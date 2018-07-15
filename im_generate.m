clc; clear all; close all;

%% Add path
addpath('D:\wang0\Desktop\Dropbox\SLA_database\matlab_script');

%% Data extraction
StlFilePath = 'D:\wang0\Desktop\STL files_part_500_128\';
% StlFilePath = 'C:\Users\Jun\Desktop\STL\';
StlFiles = dir(fullfile(StlFilePath, '*.stl'));
nStlFiles = length(StlFiles);

for i = 1:nStlFiles
    imExtract(fullfile(StlFilePath, StlFiles(i).name));
end

%% a = 1