clc
clear
M=0.0027;
L=0.35;
R=L-0.02;
D=0.042;
J=8*10^-7;
G=-9.81;
s=tf('s');
p_ball=-(M*G*D/(L*(J/R^2)+M))*1/s^2;
Kp=40;
Kc=5;
Kd=10;
K=1;
C = pid(Kp,Kc,Kd);
sys_c1=feedback(K*C*p_ball,1);
t=0:0.01:50;
figure
step(sys_c1,t);

