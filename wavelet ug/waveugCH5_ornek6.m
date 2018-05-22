%% One-Dimensional Wavelet Variance Adaptive Thresholding

clear all, close all,
clc,

%% Let us generate a signal from a fixed-design regression model
%with two noise
%variance change points located at positions 200 and 600.

%% Generate blocks test signal.
x = wnoise(1,10);

%% Generate noisy blocks with change points.
bb = randn(1,length(x));
cp1 = 200; cp2 = 600;
x = x + [bb(1:cp1),bb(cp1+1:cp2)/4,bb(cp2+1:end)];

%% Perform a single-level wavelet decomposition
% of the signal using db3.
wname = 'db3'; lev = 1;
[c,l] = wavedec(x,lev,wname);
%% Reconstruct detail at level 1.
det = wrcoef('d',c,l,wname,1);

%% To remove almost all the signal, replace 2%
%of biggest values by the mean.

x = sort(abs(det));
v2p100 = x(fix(length(x)*0.98));
ind = find(abs(det)>v2p100);
det(ind) = mean(det);

%% Use the wvarchgfunction to estimate the change points with the
%following parameters:
%The minimum delay between two change points is d = 10.
%The maximum number of change points is 5.

[cp_est,kopt,t_est] = wvarchg(det,5)

%% Replace the estimated change points

cp_est = t_est(kopt+1,1:kopt);

% knew = 5;
% cp_New = t_est(knew+1,1:knew); % where 1 knew 5