clc; clear all; close all;

%% Add path
addpath('C:\Users\Jun\Dropbox\SLA_database\matlab_script');

%% Data_extraction
StlFilePath = 'C:\Users\Jun\Dropbox\SLA_database\crosection_STL\crosection_STL7_c\';
StlFiles = dir(fullfile(StlFilePath, '*.stl'));
nStlFiles = length(StlFiles);

for i = 1:nStlFiles
    indexExtract(fullfile(StlFilePath, StlFiles(i).name));
end  









