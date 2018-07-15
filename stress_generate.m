clc; clear all; close all;

%% Add path
addpath('C:\Users\Jun\Dropbox\SLA_database\matlab_script');
addpath('C:\Users\Jun\Dropbox\SLA_database\abaqus_RPT\abaqus_RPT_slice6');

%% Data_extraction
IndexFilePath = 'C:\Users\Jun\Dropbox\SLA_database\abaqus_INDEX\abaqus_INDEX_slice6\';
IndexFiles = dir(fullfile(IndexFilePath, '*.txt'));
nIndexFiles = length(IndexFiles);

for i = 1:nIndexFiles
    stressExtract(fullfile(IndexFilePath, IndexFiles(i).name));
end  









