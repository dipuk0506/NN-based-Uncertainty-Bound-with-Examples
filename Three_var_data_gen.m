%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Aim: 1. Generating a toy Dataset for a 3-input-1-output NN
%   
%   One input dominates point prediction
%   Another input dominates the uncertainty
%   Third input is random to input
%
%   Author: H M Dipu Kabir
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc
clear all
rng(0)

N = 10000;
x1 = [1/N:2/N:1 1:-2/N:1/N];
x2 = rand(1,N);
x3 = rand(1,N);

y = sin(2.5*pi*x1)+ rand(1,N).*cos(2*pi*x2);

plot(y,'.')

Demand_Data = [x1' x2' x3' y'];
 
save('Sensitivity_Example','Demand_Data');
