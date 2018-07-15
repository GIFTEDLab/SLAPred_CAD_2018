clc; clear all; close all;

%% Add path
addpath('C:\Users\Jun\Dropbox\SLA_database\matlab_script');

%% Data extraction
StlFilePath = 'C:\Users\Jun\Dropbox\SLA_database\crosection_STL\crosection_STL_fixed\';
% StlFilePath = 'C:\Users\Jun\Desktop\STL\';
StlFiles = dir(fullfile(StlFilePath, '*.stl'));
nStlFiles = length(StlFiles);

for i = 1:nStlFiles
    cmd = ['meshlabserver.exe ' '-i ' fullfile(StlFilePath, StlFiles(i).name) ' -o ' fullfile(StlFilePath, StlFiles(i).name) ' -s Invert_Faces_Orientation.mlx'];
    system(cmd);
end

