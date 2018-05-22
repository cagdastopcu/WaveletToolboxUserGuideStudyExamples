%% Complex Continuous Analysis Using the Command Line
% wavelet user guide version 2
%cusp signal
clear all, close all,
clc,

load cuspamax;

%caption

figure,
plot(cuspamax)

figure,
c = cwt(cuspamax,1:2:64,'cgau4','plot');