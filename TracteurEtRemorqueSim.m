clc;clear;

k=4000;    %constante du ressort [N/m]
b=6000;    %constante d'amortisseur [N/ms]
mT=8000;    %masse du tracteur [kg]
mR=12000;   %masse du remorque [kg]
T = 201;  %torque applique [N/m]
r = 2.4; %rayon du roue [m]


A=[0 1 0 0;-k/mT -b/mT k/mT b/mT;0 0 0 1;k/mR b/mR -k/mR -b/mR];
B=[0;1/(mT*r);0;0];
C=[1 0 -1 0];
D=0;

%interval de temps 
t=0:0.05:50;


u = T*heaviside(t)-2*T*heaviside(t-25);
z=lsim(A,B,C,D,u,t);
plot(t,z+0.2032)
title('Systeme bien amortis')
xlabel('temps (s)')
ylabel('distance (m)')
grid on