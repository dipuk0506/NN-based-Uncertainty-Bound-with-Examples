%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Aim: 1. To plot the similar occurrences for one Input combination 
%        2. Train NN for Bound point correction  
%   Author: H M Dipu Kabir
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all

load('Similarity_report.mat')


UB_point = 0.05 %Any value from 0 to 1
sample_no = 505 %Any value from 1 to length of Data 

indexes=Similarity(sample_no).matched_indexes;
for i=1:length(indexes)
    %Plotting example Inputs
    plot(Input(indexes(i),:))
    hold on
    %Plotting example Outputs
    plot(5,Output(indexes(i)),'.k')
    hold on
end
%Plotting original Input
plot(Input(sample_no,:), '+r')
hold on
%Ploting Original Output
plot(5,Output(sample_no), '+r')
PDF = Output(indexes);
PDF = sort(PDF);
hold on
plot(5,PDF(round(UB_point*end)), '+g')

