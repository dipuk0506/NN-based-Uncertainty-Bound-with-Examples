clc
clear all


N = 10000;
x1 = [1/N:2/N:1 1:-2/N:1/N];
x2 = rand(1,N);
x3 = rand(1,N);

y = sin(2.5*pi*x1)+ rand(1,N).*cos(2*pi*x1);

plot(y,'.')

Demand_Data = [x1' x2' x3' y'];
 
save('Sensitivity_Example','Demand_Data');