# Ball and Beam Control System

A complete mechatronics control project developed at Benha University following the VDI 2206 methodology for mechatronic system design.

## Project Description

The Ball and Beam system is a classical unstable control problem widely used in control engineering education and research. The objective is to accurately control the position of a rolling ball along a beam by adjusting the beam inclination angle through a servo motor and a closed-loop PID controller.

This project covers the entire mechatronics design cycle, including mechanical design, mathematical modeling, simulation, controller design, hardware implementation, and experimental validation.

---

## Features

- Complete mechatronic system development based on VDI 2206
- Mechanical design and CAD modeling
- Kinematic and dynamic analysis
- Finite Element Analysis (FEA)
- Mathematical modeling and transfer function derivation
- PID controller design and tuning
- MATLAB and Simulink simulation
- Real-time implementation using Arduino Uno
- Ultrasonic sensor-based position measurement
- Hardware-software integration with MATLAB
- System Identification and model validation
- Comparison between theoretical and practical performance

---

## System Architecture

Input Reference Position
↓
PID Controller
↓
Arduino Uno
↓
MG995 Servo Motor
↓
Beam Angle Control
↓
Ball Motion
↓
HC-SR04 Sensor
↓
Feedback Signal

---

## Hardware Components

| Component | Purpose |
|------------|------------|
| Arduino Uno | Main controller |
| MG995 Servo Motor | Beam angle actuation |
| HC-SR04 Ultrasonic Sensor | Ball position measurement |
| PLA Mechanical Structure | Beam and linkage assembly |
| Voltage Regulators | Power management |
| 12V Power Supply | System power source |

---

## Software Tools

- MATLAB
- Simulink
- Arduino IDE
- System Identification Toolbox
- SolidWorks / CAD Software
- FEA Analysis Tools

---

## Engineering Analysis

The project includes:

### Mechanical Design
- Beam and linkage mechanism design
- Material selection
- Structural validation

### Kinematic Analysis
- Position analysis
- Velocity analysis
- Acceleration analysis

### Dynamic Modeling
- Mathematical derivation using Newtonian mechanics
- Linearization around equilibrium point
- Transfer function development

### Control System Design
- PID controller tuning
- Stability analysis
- Root locus evaluation
- Step response evaluation

### Finite Element Analysis
- Stress distribution analysis
- Displacement analysis
- Safety factor verification

---

## Results

### Theoretical Model

| Parameter | Value |
|------------|------------|
| Overshoot | 5.43% |
| Settling Time | 0.364 s |
| Steady-State Error | 0 |

### Achievements

- Stable ball position control achieved
- Successful PID implementation
- Experimental validation completed
- Good agreement between simulation and practical implementation
- Real-time visualization through MATLAB

---

## Repository Structure

```text
CAD/
Documentation/
MATLAB/
Simulink/
System_Identification/
Arduino/
Images/
Videos/
```

---

## Project Gallery

### CAD Design
[Insert CAD Images]

### FEA Analysis
[Insert FEA Images]

### Hardware Prototype
[Insert Prototype Images]

### Experimental Results
[Insert Response Plots]

---

## Team Members

- Mahmoud Mohamed Shamekh
- Omar Mahmoud Metwally
- Youssef Mostafa Ayad
- Ebrahim Magdy Ebrahim

---

## Supervision

Dr. Amro Shafik

Eng. Mohamed Ashraf

---

## Acknowledgment

We would like to express our sincere gratitude to Dr. Amro Shafik and Eng. Mohamed Ashraf for their continuous guidance, valuable feedback, and technical support throughout the development of this project.

We also appreciate the collaborative efforts of all team members whose dedication and teamwork contributed significantly to the successful completion of this work.

---

## License

This repository is published for educational and academic purposes.
