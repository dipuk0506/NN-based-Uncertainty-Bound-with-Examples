%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Project: Minimum deviation based similarity 
%   finding and using those similarities for UB
%
%   Purpose of script A1: Minimim deviation based similarity 
%   finding for Uncertainty Bounds
%   Aim: To achieve all indexes of similar samples
%   Author: H M Dipu Kabir
%   Steps: 
%       1. Itertion over all Input combinations.
%       2. Find all deviation by indexes
%       3. Save top 100 deviation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all

load('Time_series.mat')
% This data can be changed to any new dataset, following the 
% same input-output pattern.

Training = 0.6;
Testing = 0.4;
Similiar_event_count = 100; 

Train_end_index = round(length(Demand_Data)*Training);

Input = Demand_Data(1:Train_end_index,1:end-1);
Output = Demand_Data(1:Train_end_index,end);

Range=max(Input)-min(Input);

tic
for iter1 = 1:length(Input)
   for iter2 = 1:length(Input)
       max_dev__index(iter2,:) = [max(abs(Input(iter1,:)-Input(iter2,:))./Range) iter2];
   end
   
   sort_dev_index=sortrows(max_dev__index); %Sorting based on first column
   matched_indexes = sort_dev_index(1:Similiar_event_count,2);  
        %Indexes of 100(Similiar_event_count) closest input patterns
        
   Similarity_threshold = sort_dev_index(Similiar_event_count,1); 
        %The most devient among selected closer inputs

   Similarity(iter1)=struct('Similarity_threshold',Similarity_threshold,...
       'matched_indexes',matched_indexes);
   if mod(iter1,200)==0
       clc
       [num2str(iter1/length(Input)*100) '%' '  Complete']
       % Observing progres in Command Window
       % Takes about 1 hr. to find all similar events for entire training data
   end
end

save('Similarity_report', 'Similarity', 'Input', 'Output', 'Train_end_index')

['100%' '  Complete']

toc
