#include <Servo.h>

#define Umax 66
#define Umin -66
#define Umax_rad 1.151
#define Umin_rad -1.151
#define T 0.09

const int echoPin1 = 3;
const int trigPin1 = 2;

Servo servo;

// ================= Variables =================
double setpoint = 0.30;        // 20 cm ثابتة (بالمتر)
double setpoint_prec = 0.30;

double y, y_prec;
double error;
double P, I, D, U;
double I_prec = 0, D_prec = 0;

boolean Saturation = false;

// ================= PID Gains =================
double Kp = 25;
double Ki = 17;
double Kd = 140;

// ================= Functions =================
float measure_1(void);
void move_servo(int);


//==========================================
unsigned long t_prev = 0;
const unsigned long Ts = 10; // 10 ms = 0.01 s


//==========================================
// ================= Setup =================
void setup() {

  Serial.begin(9600);

  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin1, INPUT);

  servo.attach(9);

  delay(1000);
  move_servo(90);
  delay(2000);

  y_prec = measure_1();
  delay(1000);
}

// ================= Loop =================
void loop() {

  // Measurement
  y = measure_1();
  y = 0.53 * y + 0.47 * y_prec;
// Quantization كل 0.01
 y = round(y * 100.0) / 100.0;

  // Print
 Serial.println(round(y * 100.0) / 100.0);
  // === PID (لو حابب) ===
  error = y - setpoint;
  // Error
  error = round(100 * (y - setpoint)) * 0.01;

  // PID
  P = Kp * error;

  if (!Saturation)
    I = I_prec + T * Ki * error;

  D = (Kd / T) * (y - y_prec);
  D = 0.56 * D + 0.44 * D_prec;

  U = P + I + round(100 * D) * 0.01;   // radians

  // Saturation
  if (U < Umin_rad) {
    U = Umin_rad;
    Saturation = true;
  }
  else if (U > Umax_rad) {
    U = Umax_rad;
    Saturation = true;
  }
  else {
    Saturation = false;
  }

  // Convert to servo angle
  U = round(U * 180 / M_PI);
  U = map(U, Umin, Umax, 24, 156);

  // Move servo only if needed
  if (U < 83 || U > 95 || abs(error) > 0.02)
    move_servo(round(U));

  delay(24);

  // Update previous values
  I_prec = I;
  y_prec = y;
  D_prec = D;
}

// ================= Ultrasonic Sensor =================
float measure_1(void) {

  long elapsed_time = 0;
  float distance = 0;

  digitalWrite(trigPin1, LOW);
  delayMicroseconds(10);

  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);

  digitalWrite(trigPin1, LOW);

  elapsed_time = pulseIn(echoPin1, HIGH);
  distance = (float)elapsed_time / 58.2;

  delay(30);

  if (distance > 42) distance = 43;
  else if (distance < 0) distance = 0;

  return 0.01 * (distance - 1.5 + 0.5);   // meters
}

// ================= Servo =================
void move_servo(int u) {
  u = constrain(u, 0, 180);
  servo.write(u);
}