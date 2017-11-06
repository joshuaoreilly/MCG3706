clc;clear;

k=100;
b=10;
mT=800;
mR=300;


A=[0 1 0 0;-k/mT -b/mT k/mT b/mT;0 0 0 1;k/mR b/mR -k/mR -b/mR]
B=[0;1/mT;0;0];
C=[0;0;1;0]
D=0;

%interval de temps 
%we need to add this for the project (choose an appropriate interval)
t=0:500;

%u = heaviside function (unit step). By default starts at 0, we want it 
%to stop at some point (by default continues into infinite). In order to 
%make it stop @ two seconds, we set u(t-2s), so that for t = 2, u = 0
u=100*heaviside(t)-100*heaviside(t-2);

z=lsim(A,B,C,D,u,t);

plot(t,z+1)


%you mess with K and B values until you run into something that 
%comes out with a rapid death (within an acceptable range)
%you want a shrinking wave essentially


