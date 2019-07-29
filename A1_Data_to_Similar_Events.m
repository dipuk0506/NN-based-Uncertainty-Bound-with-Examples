%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Project: Minimim deviation based similarity 
%   finding for Uncertainty Bounds
%   Aim: To achieve all indexes of similar samples
%   Author: H M Dipu Kabir
%   Steps: 
%   1. Itertion over all Input combinations.
%       2. Initial similarity threshold =1%
%       3. If more than 200 similar points reduce threshold
%       4. If less than 50 similar points increase threshold
%       5. Save all similar indexes
%   6. Save to variable
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all

load('Time_series.mat')

Input = Demand_Data(:,1:end-1);
Output = Demand_Data(:,end);

similarity_count = zeros(1,length(Input));
Range=max(Input)-min(Input);

min_sample=50;
max_sample=200;

tic

for iter1 = 1:length(Input)
   Similarity_threshold=0.01;
   % Starting with 2% range of all input to consider it similar.
   % Most sample have 2% threshold. 
   % Therefore, the initial threshold is 2%
   loop_break=0;
   while 1
       matched_indexes=[];
       for iter2 = 1: length(Input)
           if max(abs(Input(iter1,:)-Input(iter2,:))./Range) < Similarity_threshold && iter1 ~= iter2 
               similarity_count(iter1)=similarity_count(iter1)+1;
               matched_indexes =[matched_indexes iter2];
           end
       end
       if similarity_count(iter1)>max_sample
           if loop_break==10
                break;
           end
          similarity_count(iter1) =0;
          Similarity_threshold = Similarity_threshold/2;
          loop_break=loop_break+1;
          matched_indexes=[];
       else
           if similarity_count(iter1)<min_sample
               loop_break=loop_break+1;
               similarity_count(iter1) =0;
               matched_indexes=[];
               Similarity_threshold = Similarity_threshold*1.5;
           else
               break
           end
       end
   end

   Similarity(iter1)=struct('Similarity_threshold',Similarity_threshold,...
       'matched_indexes',matched_indexes);
end

save('Similarity_report', 'Similarity', 'similarity_count', 'Input', 'Output')

toc
