% This script is written to generate the CONFUSION MATRIX for differnt ML
% classifers.
clc
clear all
close all
% Get the data
datafolder = 'T:\LMBI\021Transcription_Systems_Dynamics_and_Biology\Toufiq\R studio project\DKin project2\Confusion matrix\KernelKNN_10fold_CV_confusionMatrix';
outputConfusionMatrixFolder = 'T:\LMBI\021Transcription_Systems_Dynamics_and_Biology\Toufiq\R studio project\DKin project2\Confusion matrix\KernelKNN_10fold_CV_confusionMatrix'; 
% FigureFolder = 'T:\LMBI\021Transcription_Systems_Dynamics_and_Biology\Toufiq\R studio project\DKin project\Reduced dimension files\figures';
addpath ('E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Scripts');
% Read the prediction file
cd(datafolder);
for i = 1:16
    MP(:,:,i) = xlsread (['KernelKNN_canberra_k=7_',num2str(i),'_cRel_.CSV']);
    % find predicted group
    for j =1:size(MP(:,:,i),1)
        [~,pg(j,1)]= max(MP(j,2:8,i));
    end
    C = confusionmat(MP(:,9,i),pg);
    % Write the confusion matrix
    cd(outputConfusionMatrixFolder);
    xlswrite(['Confusion_cRel','KNN_canberra_k=7_',num2str(i),'.csv'],C);
    cd(datafolder);
end