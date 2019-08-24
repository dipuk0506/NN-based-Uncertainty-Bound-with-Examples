%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Aim: Train a NN to predict the sample density 
%   near the input combination
%
%   Author: H M Dipu Kabir
%
%   Motive: The model becomes more confident when a 
%   large number of nearby samples available 
%
%   Limitation: NNs can predict a negative density in 
%   rare situations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all

load('Similarity_report.mat')

%Sample density is related to the accuracy of 
%prediction for the input combination
Output_Deviation = [Similarity.Similarity_threshold];


Sample_density = length(Similarity(1).matched_indexes)./(Output_Deviation)/100;
%number of samples with less than 1% deviation
%square penalizes Deviation >> 1% and rwards Deviation << 1%

net_density = feedforwardnet([7 7]);
net_density = train(net_density,Input',Sample_density);

%view(net_density)
Density_NN = net_density(Input');
plot(Density_NN)
