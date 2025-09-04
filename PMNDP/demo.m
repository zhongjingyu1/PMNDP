clc
clear;
addpath(genpath('.'));
dataName = 'data/music_emotion.mat';
[result,GTLA] = PMNDP(dataName);
result
GTLA
