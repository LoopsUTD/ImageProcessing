khw = 18.436;
kd = 0.689;
kp = 8.566;
j1 = 0.0214;
c1 = .0105;
s = tf('s')
sys = khw/(j1*s^3 + (c1 + kd*khw)*s^2 + khw*kp*s);
rlocus(sys)