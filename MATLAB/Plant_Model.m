clc
clear
M = 0.0027;     % kg   mass of the ball
L = 0.35;       % m    length of beam
R = L - 0.02;   % m    distance from pivot
D = 0.042;      % m    ball diameter
J = 8e-7;       % kg.m^2 moment of inertia
G = -9.81;      % m/s^2 gravity
r = D/2;
A = (J/(r^2)) + M;
K = (M * G * R) / L;
s = tf('s');
P = (-K/A) * 1/(s^2);
disp('Ball & Beam Plant Transfer Function:')
P
figure
step(P)
grid on
title('Open Loop Step Response (Unstable)')
Kp = 40;
Ki = 5;
Kd = 10;
C = pid(Kp,Ki,Kd);
T = feedback(C*P, 1);
figure
step(T)
grid on
title('Closed Loop Response with PID')
Kp_vals = [20 40 70];
figure
hold on
for kp = Kp_vals
    Ctemp = kp + Ki/s + Kd*s;
    Ttemp = feedback(Ctemp*P,1);
    step(Ttemp)
end
legend('Kp=20','Kp=40','Kp=70')
grid on
title('Effect of Kp')
Ki_vals = [0 5 15];
figure
hold on
for ki = Ki_vals
    Ctemp = Kp + ki/s + Kd*s;
    Ttemp = feedback(Ctemp*P,1);
    step(Ttemp)
end
legend('Ki=0','Ki=5','Ki=15')
grid on
title('Effect of Ki')
Kd_vals = [0 10 25];
figure
hold on
for kd = Kd_vals
    Ctemp = Kp + Ki/s + kd*s;
    Ttemp = feedback(Ctemp*P,1);
    step(Ttemp)
end
legend('Kd=0','Kd=10','Kd=25')
grid on
title('Effect of Kd')
%% Comparison Between Theoretical and Practical Closed-Loop Behavior
KP=25;
KI=17;
KD=140;
c=pid(KP,KI,KD)
% Practical / Identified transfer function (Model 1)
num_pr = [1.625 2.959];
den_pr = [1 15.09 1.285e4];
G_practical = tf(num_pr, den_pr)

% Closed-loop of practical model with same PID
T_practical = feedback(c * G_practical, 1);

% Practical / Identified transfer function (Model 2)
num_pr2 = [25.05 39.11];
den_pr2 = [1 87.88 1.494e-10];
G_practical2 = tf(num_pr2, den_pr2)

% Closed-loop of second practical model
T_practical2 = feedback(c * G_practical2, 1);

% Plot comparison
figure
step(T, 'b', T_practical, 'r--', T_practical2, 'y-.', 5)
grid on
legend('Theoretical Closed-Loop Model', ...
       'Practical / Identified Model 1', ...
       'Practical / Identified Model 2')
title('Comparison Between Theoretical and Practical Closed-Loop Behavior')
ylabel('Ball Position')
xlabel('Time (s)')
%% ================== Performance Analysis ==================

% Step information
info_theoretical = stepinfo(T);
info_practical1  = stepinfo(T_practical);
info_practical2  = stepinfo(T_practical2);

% Steady-state values
ss_theoretical = dcgain(T);
ss_practical1  = dcgain(T_practical);
ss_practical2  = dcgain(T_practical2);

% Steady-state error (for unit step input)
ess_theoretical = abs(1 - ss_theoretical);
ess_practical1  = abs(1 - ss_practical1);
ess_practical2  = abs(1 - ss_practical2);

% Display results
fprintf('\n===== Closed-Loop Performance Comparison =====\n');

fprintf('\nTheoretical Model:\n');
fprintf('Overshoot = %.2f %%\n', info_theoretical.Overshoot);
fprintf('Settling Time = %.3f s\n', info_theoretical.SettlingTime);
fprintf('Steady-State Error = %.5f\n', ess_theoretical);

fprintf('\nPractical Model 1:\n');
fprintf('Overshoot = %.2f %%\n', info_practical1.Overshoot);
fprintf('Settling Time = %.3f s\n', info_practical1.SettlingTime);
fprintf('Steady-State Error = %.5f\n', ess_practical1);

fprintf('\nPractical Model 2:\n');
fprintf('Overshoot = %.2f %%\n', info_practical2.Overshoot);
fprintf('Settling Time = %.3f s\n', info_practical2.SettlingTime);
fprintf('Steady-State Error = %.5f\n', ess_practical2);