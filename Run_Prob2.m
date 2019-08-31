clear all; close all; clc; 
% Prob 2-HW2- MAE 5010- Atmospheric Flight Controls
% Sandesh Thapa

%% Prob2(a)
Lp = -1; % rad/s
Ldela = 30; % s^-2; 
tau = 0.1; % sec 

Deldela_max = 0.436; % rad 
Delphi_max = 0.787; % rad 
delv_max = 10; % volts

A = [Lp 0 Ldela; 
     1  0 0; 
     0  0 -1/tau];

B = [0 0 1/tau]';

Q = [0  0                0;
     0 1/(Delphi_max)^2 0
     0 0                 1/(Deldela_max)^2];
 
R = 1/(delv_max)^2;
 
N = zeros(3,1);
[K,S,e] = lqr(A,B,Q,R,N)
 
%% Prob 2(b)

sim('Sim_Prob2')

figure
plot(t,y(:,1),'--k',t,y(:,2),'b',t,y(:,3),'-.r');
legend('\Deltap','\Delta\phi','\Delta\delta_a','Location','best','Interpreter','latex')
xlabel('time (s)')
ylabel('States')
hold on

figure 
plot(t,V)
xlabel('time (s)')
ylabel('Voltage input to the aileron actuator servomotor')


