clc;
Zs = j*12;Zm = j*4;Va = 100;
VL = sqrt(3) * Va;
% Part 1 Without using symmetric components
Z = [(Zs-Zm) -(Zs-Zm)  0;
    0         (Zs-Zm) -(Zs-Zm);
    1           1       1];
V = [VL*cos(pi/6)+j*VL*sin(pi/6); VL*cos(-pi/2)+j*VL*sin(-pi/2);0];
Iabc = inv(Z)*V; %Line current Rectangular form 
Iabcp = [abs(Iabc), angle(Iabc)*180/pi]; % Line current polar form
fprintf('i-) without symemetric components\n');
fprintf('Ia = %g A angle = %g\n',Iabcp(1,1),Iabcp(1,2));
fprintf('Ib = %g A angle = %g\n',Iabcp(2,1),Iabcp(2,2));
fprintf('Ic = %g A angle = %g\n\n\n',Iabcp(3,1),Iabcp(3,2));

%Part 2 With Symmetric components
Z012 = [Zs+2*Zm 0  0;0  Zs-Zm 0;0 0 Zs-Zm];
V012 = [0; Va; 0];
I012 = inv(Z012) * V012;
a = cos(2*pi/3) + j*sin(2*pi/3); 
A = [1 1   1;% Transformationmatrix
     1 a^2 a;
     1 a   a^2];
Iabc = A*I012; % Line current rectangular form
Iabcp = [abs(Iabc), angle(Iabc)*180/pi]; % Line current polar formn
fprintf('ii-) with symemetric components\n');
fprintf('Ia = %g A angle = %g\n',Iabcp(1,1),Iabcp(1,2));
fprintf('Ib = %g A angle = %g\n',Iabcp(2,1),Iabcp(2,2));
fprintf('Ic = %g A angle = %g\n',Iabcp(3,1),Iabcp(3,2));






