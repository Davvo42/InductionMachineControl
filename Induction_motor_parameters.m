%Nominal values used in this machine
Amp=380;
om = 2*pi*50;
np = 3;
wb = 104.61;
isdn = 20.33;
isqn = 2.12;

%Given data 
Rs = 0.24;
Ls = 59.4*10^-3;
Rr = 0.175;
Lr = 59.1*10^-3;
Lm = 57*10^-3;
Rr = Rr*Lm^2/Lr^2;
Lm = Lm^2/Lr;
Lks = Ls-Lm;
Rks = Rs + Rr;

%load data  ( ml = wm^2*K ) ( wl/wm = r ?)
Jeq = 0.4;    
Bet = 0.068;
K = 0.009;
r = 4; 

%Model alpha beta matrix
Rs_ = [Rs 0;0 Rs];
Rr_ = [Rr 0;0 Rr];
Lks_= [Lks 0;0 Lks];
Lm_ = [Lm 0;0 Lm]; 
J   = [0 -1;1 0];

%Model dq matrix
Rks_= [Rks 0;0 Rks];

%Transfer functions in the event of decoupling
s  = tf('s');
Gw = 1/(s*Jeq + Bet);
G = 1/(s*Lks + Rks);
Gp = Rr*Lm/(Lm*s + Rr);

%PI regulators to cancel poles
Ti = Lks/Rks;
Kp = 5/0.001*Lks;
Ki =Kp/ Ti;

Tip = Lm/Rr;
Kpp = 5/0.1*Lm;
Kip = Kpp/ Tip;

%PI of velocity bode
Kpw = 1.1;       
Kiw = 1.8;
Tiw = Kpw/Kiw;

R = Kp + Ki/s;
L = R*G;

Rp = Kpp + Kip/s;
Lp = Rp*Gp;

Rw = Kpw + Kiw/s;
Lw = Rw*Gw;

subplot(1,3,1); margin(L);hold on;
subplot(1,3,2); margin(Lp);hold on;
subplot(1,3,3); margin(Lw);hold on; grid on;
