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

Uncertainty_Bound = 0.1 % The certain UB

Uncertainty_Bound_corrected = net_Bound_correction(Uncertainty_Bound)

higher_count=0;
prediction_bound = zeros(1,length(Output));
for iter=1:length(Output)
    indexes=Similarity(iter).matched_indexes;
    PDF = Output(indexes);
    PDF = sort(PDF);
    prediction_bound(iter) = PDF(round(round(Uncertainty_Bound_corrected*length(PDF))));
    if prediction_bound(iter) > Output(iter)
        higher_count = higher_count + 1;
    end
end

UB_result = higher_count/length(Output)

%Train NN for UB

net_UB = feedforwardnet([5 5]);
net_UB = train(net_UB,Input',prediction_bound);

% Observing the performance in entire data (both train and test).
load('Time_series.mat')
Input = Demand_Data(:,1:end-1);
Output = Demand_Data(:,end);

UB_array = net_UB(Input');

plot(Output,'g')
hold on
plot(UB_array,'r')


% Accuracy of bound on train data
higher_count=0;
for iter = 1:Train_end_index
    if UB_array(iter) > Output(iter)
        higher_count = higher_count + 1;
    end
end

UB_result_train = higher_count/Train_end_index

% Accuracy of bound on test data
higher_count=0;
for iter = Train_end_index+1:length(Output)
    if UB_array(iter) > Output(iter)
        higher_count = higher_count + 1;
    end
end

UB_result_test = higher_count/(length(Output)-Train_end_index)

