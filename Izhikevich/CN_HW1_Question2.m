name = 'Tonic Spiking';
dt = 0.002; % step of simulation
T = 100; % end time simulation


% Izhikevich parameter
a=0.02;
b=0.2;
c=-65;
d=2;
h=15;
v0 = -70;
Izhikevich_sample(name,a,b,c,d,h,v0,dt,T);


%%%%%%%%% part 2-3-2 Phasic Spiking

a=0.02; b=0.25; c=-65; d=6; h=1;
Izhikevich_sample('Phasic Spiking',a,b,c,d,h,-70,0.002,100);


%%%%%%%%% part 2-3-3 Tonic Bursting

a=0.02; b=0.2; c=-50; d=2; h=15;
Izhikevich_sample('Tonic Bursting',a,b,c,d,h,-70,0.002,100);

%%%%%%%%% part 2-3-4 Phasic Bursting

a=0.02; b=0.25; c=-55; d=0.05; h=0.6;
Izhikevich_sample('Phasic Bursting',a,b,c,d,h,-70,0.002,100);

%%%%%%%%% part 2-3-5 Mixed Model

a=0.02; b=0.2; c=-55; d=4; h=10;
Izhikevich_sample('Mixed Model',a,b,c,d,h,-70,0.002,200);




%% Question 2 part 4

clear; 
clc;
close all;
name = 'part 2-4';

dt = 0.002; % step of simulation
T = 100; % end time simulation
t = 0:dt:T; 

% Izhikevich parameter
a=0.02; b=0.25; c=-65; d=6; h=1;
v0 = -70;
u0 = b*v0;

I_ext = h.*heaviside(t-10);
[v,u] = Izhikevich(t,a,b,c,d,I_ext,v0,u0);

figure('Name',name,'NumberTitle','off');
plot(v,u,'linewidth',1,'color','r');
title([name,' : u-v']);
xlabel('Voltage [mv]');
ylabel('u');
grid on;
grid minor; 

figure('Name',name,'NumberTitle','off');
subplot(2,1,1);
plot(t,v,'linewidth',1,'color','b');
title([name,' : v-t']);
xlabel('Time[ms]');
ylabel('Voltage [mv]');
grid on;
grid minor; 

subplot(2,1,2);
plot(t,u,'linewidth',1,'color','b');
title([name,' : u-t']);
xlabel('Time[ms]');
ylabel('u');
grid on;
grid minor; 
