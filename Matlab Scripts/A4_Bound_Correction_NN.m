%%%%%bound point correction
%
%   Reason: Often UB_point returns a distant point. 
%   The reason for this is the considerations of silightly different
%   samples those do not have an exact match. Say 1% or 2% different.
%   As a result the output distribution is more spread than the actual.
%   If we are setting UB_point =.90, we may get a point corresponds to 0.96
%
%   Solving technique: 1. Getting effective UB for UB_points
%       2. Train NN which takes effective UB and returns required
%            UB_points for that effective UB
%   
%%%%%%%%%%%%%%%

clc
clear all
load('Similarity_report.mat')
%load('Similarity_sensitivity_1.mat')

Correction_input=[];
Correction_output=[];

for UB_point= 0.01:0.01:0.99
    higher_count=0;
    for iter=1: length(Output)
        indexes=Similarity(iter).matched_indexes;
        PDF = Output(indexes);
        PDF = sort(PDF);
        prediction_bound = PDF(round(round(UB_point*length(PDF))));

        if prediction_bound > Output(iter)
            higher_count = higher_count + 1;
        end
    end
    Correction_input = [Correction_input higher_count/length(Output)];
    Correction_output = [Correction_output UB_point];
end

net_Bound_correction = feedforwardnet([7 7]);
net_Bound_correction = train(net_Bound_correction,Correction_input,Correction_output);

save('Bound_Correction', 'Correction_input', 'Correction_output','net_Bound_correction')

net_Bound_correction(.95)