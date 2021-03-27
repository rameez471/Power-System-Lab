 Ea = (1:0.01:1.70)*384; % Magnitude of Ea volts
 Ear = 384; % Reference Ea
 deltar = -36.4 * pi/180; % Reference torque angle
 Xs = 1.1; % Synchronous reactance
 Vp = 480; % Phase voltage at 0 degrees
 Ear = Ear * (cos(deltar) + j * sin(deltar));

 % Calculate delta2
 delta2 = asin ( abs(Ear) ./ abs(Ea) .* sin(deltar) );

 % Calculate the phasor Ea
 Ea = Ea .* (cos(delta2) + j .* sin(delta2));

 % Calculate Ia
 Ia = ( Vp - Ea ) / ( j * Xs);

 % Plot the v-curve
 figure(1);
 plot(abs(Ea),abs(Ia),'b','Linewidth',2.0);
 xlabel('\bf\itE_{A}\rm\bf (V)');
 ylabel('\bf\itI_{A}\rm\bf (A)');
 title ('\bfSynchronous Motor V-Curve');
 grid on; 