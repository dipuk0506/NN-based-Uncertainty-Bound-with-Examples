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

% UB_point (Uncertainty Bound) is the cumulative probability from the lower-end.

sample_no = 1402%8%round(rand(1)*length(Input)) %Any value from 1 to length of Data 

Input_index_number = size(Input,2);
Output_index_number = Input_index_number+1;

indexes=Similarity(sample_no).matched_indexes;
for i=1:length(indexes)
    %Plotting example Inputs
    plot(1:Input_index_number,Input(indexes(i),:),'Color','[.8 .8 .8]')
    hold on
    %Plotting example Outputs
    plot(Input_index_number:Output_index_number,[Input(indexes(i),end) Output(indexes(i))],'Color','[.9 .9 .9]--')
    hold on
end
%Plotting original Input
plot(1:Input_index_number,Input(sample_no,:), 'r+')
hold on
plot(1:Input_index_number,Input(sample_no,:), 'r')
hold on
%Ploting Original Output
plot(Output_index_number,Output(sample_no), 'ro')
hold on

%Plotting the uncertainty bound
PDF = Output(indexes);
PDF = sort(PDF);
plot(Output_index_number,PDF(round(UB_point*length(PDF))), 'ok')

