%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Aim: 1. Finding UB values from distribution for a certain UB
%   2. Checking previous bound correction NN
%   3. Training NN for UB
%   Author: H M Dipu Kabir
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all

load('Similarity_report.mat');
load('Bound_Correction.mat');

Uncertainty_Bound = 0.05

Uncertainty_Bound = net_Bound_correction(Uncertainty_Bound)

higher_count=0;
prediction_bound = zeros(1,length(Output));
for iter=1:length(Output)
    indexes=Similarity(iter).matched_indexes;
    PDF = Output(indexes);
    PDF = sort(PDF);
    prediction_bound(iter) = PDF(round(round(Uncertainty_Bound*length(PDF))));
    if prediction_bound(iter) > Output(iter)
        higher_count = higher_count + 1;
    end
end

UB_result = higher_count/length(Output)

%Train NN for UB

net_UB = feedforwardnet([7 7]);
net_UB = train(net_UB,Input',prediction_bound);

UB_array = net_UB(Input');

plot(Output,'g')
hold on
plot(UB_array,'r')

