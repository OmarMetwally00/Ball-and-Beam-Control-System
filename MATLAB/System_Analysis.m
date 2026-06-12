% ============================================================
                         % Benha University
                     % Faculty of Engineering
          % Mechatronics and Automation Engineering Program
                  % MAM 301 - Design of Mechatronics
               % Design Project: Ball and Beam System

% Students:
            %  Mahmoud Mohamed Shamekh
            %  Omar Mahmoud Metwally
            %  Youssef Mostafa Ayad
            %  Ebrahim Magdy Ebrahim

% Supervisors:
               %  Dr. Amro Shafik
               %  Eng. Mohamed Ashraf
% ============================================================

clc; clear; close all;

%% ============================================================
%  Physical Parameters
%% ============================================================
M = 0.0027;      % Ball mass (kg)
L = 0.35;        % Beam length (m)
R = L - 0.02;    % Distance from pivot (m)
D = 0.042;       % Ball diameter (m)
r = D/2;         % Ball radius (m)
J = 8e-7;        % Ball moment of inertia (kg.m^2)
g = -9.81;        % Gravity acceleration (m/s^2)

%% ============================================================
%  Ball & Beam Model Constants
%% ============================================================
A = (J/(r^2)) + M;          % Effective mass term
K = (M * g * R) / L;        % System constant

%% ============================================================
%  Transfer Function
%% ============================================================
s = tf('s');

% Ball position / Beam angle transfer function
P = -(K/A) * 1/(s^2);

disp('Ball and Beam Plant Transfer Function:')
P

%% ============================================================
%  Open-Loop Response (Unstable)
%% ============================================================
figure
step(P,5)
grid on
title('Open-Loop Step Response (Unstable Ball & Beam System)')
xlabel('Time (s)')
ylabel('Ball Position (m)')

%% ============================================================
%  PID Controller Parameters
%% ============================================================
Kp = 40;          % Proportional gain
Ki = 5;           % Integral gain
Kd = 12;          % Derivative gain

% PID controller (transfer function form, without scalar gain)
C0 = Kp + Ki/s + Kd*s;

%% ============================================================
%  Root Locus with Variable Gain K
%% ============================================================
figure
rlocus(C0 * P)
grid on
title('Root Locus of Ball and Beam System with PID Controller')
sgrid(0.7, [])    % Desired damping ratio

%% ============================================================
%  Gain Selection
%% ============================================================
K_gain = 1;       % Selected from root locus (adjust if needed)

C_final = K_gain * C0;
T_final = feedback(C_final * P, 1);

%% ============================================================
%  Closed-Loop Response
%% ============================================================
figure
step(T_final,5)
grid on
title(['Closed-Loop Step Response with PID (K = ', num2str(K_gain), ')'])
xlabel('Time (s)')
ylabel('Ball Position (m)')

%% ============================================================
%  Effect of PID Parameters
%% ============================================================

% ---- Effect of Kp ----
Kp_vals = [20 40 70];
figure; hold on
for kp = Kp_vals
    Ctemp = kp + Ki/s + Kd*s;
    Ttemp = feedback(Ctemp * P, 1);
    step(Ttemp,5)
end
legend('Kp = 20','Kp = 40','Kp = 70')
grid on
title('Effect of Proportional Gain Kp')
xlabel('Time (s)')
ylabel('Ball Position (m)')

% ---- Effect of Ki ----
Ki_vals = [0 5 15];
figure; hold on
for ki = Ki_vals
    Ctemp = Kp + ki/s + Kd*s;
    Ttemp = feedback(Ctemp * P, 1);
    step(Ttemp,5)
end
legend('Ki = 0','Ki = 5','Ki = 15')
grid on
title('Effect of Integral Gain Ki')
xlabel('Time (s)')
ylabel('Ball Position (m)')

% ---- Effect of Kd ----
Kd_vals = [0 10 25];
figure; hold on
for kd = Kd_vals
    Ctemp = Kp + Ki/s + kd*s;
    Ttemp = feedback(Ctemp * P, 1);
    step(Ttemp,5)
end
legend('Kd = 0','Kd = 10','Kd = 25')
grid on
title('Effect of Derivative Gain Kd')
xlabel('Time (s)')
ylabel('Ball Position (m)')

%% ============================================================
%  Stability Information (Poles & Damping Table)
%% ============================================================
[wn, zeta, poles] = damp(T_final);

ResultsTable = table( ...
    poles, ...
    zeta, ...
    wn, ...
    'VariableNames', {'Pole', 'DampingRatio', 'NaturalFrequency'} ...
);

disp('Closed-Loop Poles and Damping Information:')
disp(ResultsTable)