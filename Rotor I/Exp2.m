clc;
Length = 130;
VR3ph = 325*10^3;
R = 0.036*Length;
S = 270 * 10^6;
lagging_pf = 0.8;
L = 0.8*10^-3*Length;
C = 0.0112*10^-6*130;
f =60;
j = sqrt(-1);
g = 0;
Z = complex(R,2*pi*f*L);
Y = complex(g,2*pi*f*C);
A = (Y/2)*Z+1;
B = Z;
C = Y*((Y/4)*Z+1);
D = A;
VR = VR3ph/sqrt(3);
AR = acos(0.8);
SR = S * complex(cos(AR),sin(AR));
IR = conj(SR) / (3*conj(VR));
VS = A*VR + B*IR;
IS = C*VR + D*IR;
VS3ph = abs(VS) * sqrt(3);
pf = cos(angle(VS)-angle(IS));
VREG = (VS3ph/abs(A)- VR3ph)/VR3ph *100;
VS3ph = VS3ph * 10^-3;
fprintf('Is = %g A',abs(IS)), fprintf(' pf = %g \n',pf);
fprintf(' Vs = %g L-L kV \n',VS3ph);
fprintf('Percentage Voltage Regulation = %g \n',VREG);












