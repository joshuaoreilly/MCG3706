clc;clear;

k=260000;    %constante de 2 ressorts [N/m]         40000
b=37000;    %constante d'amortisseur [N/ms]     30000
mT=9000;    %masse du tracteur [kg]
%you should take this: 9000
%http://www.tractorspecs.com/specs/JohnDeere/6120.aspx
mR=30000;   %masse du remorque [kg]
%you should take this: 30000
%http://manuals.deere.com/omview/OMH226957_19/OUO6075_0000375_19_24APR06_1.htm 
T = 50000;  %torque applique [N/m]
r = 0; %rayon du roue [m]


A=[0 1 0 0;-k/mT -b/mT k/mT b/mT;0 0 0 1;k/mR b/mR -k/mR -b/mR];
B=[0;1/mT;0;0];
C=[1 0 -1 0];
D=0;

%interval de temps 
%we need to add this for the project (choose an appropriate interval)
t=0:50;


u = T*heaviside(t)-2*T*heaviside(t-25);
z=lsim(A,B,C,D,u,t);
plot(t,z)
title('Systeme bien amortis')
xlabel('temps (s)')
ylabel('distance (m)')
grid on


%u = heaviside function (unit step). By default starts at 0, we want it 
%to stop at some point (by default continues into infinite). In order to 
%make it stop @ two seconds, we set u(t-2s), so that for t = 2, u = 0

%u=100*heaviside(t)-100*heaviside(t-10);

%z=lsim(A,B,C,D,u,t);

%plot(t,z+1)


%you mess with K and B values until you run into something that 
%comes out with a rapid death (within an acceptable range)
%you want a shrinking wave essentially


