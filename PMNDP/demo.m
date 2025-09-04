clc
clear;
addpath(genpath('.'));
dataName = 'data/music_emotion.mat';
[result,GTLA] = PML_ND(dataName);
result
GTLA
