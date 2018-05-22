%% Reconstructing a Signal Approximation from a Node

close all, clear all,
clc,

%% load the noisy Doppler signal

load noisdopp

%% compute the wavelet packet decomposition down to level 5
% using sym4 wavelet

% use periodization mode

dwtmode('per');

%wp decomposition

T = wpdec(noisdopp, 5, 'sym4');

plot(T) % cok da guzel olduee

%% extract the wavelet packet coefficients from node 16

wpc = wpcoef(T,16);
% wpcs length is 64

%% obtain an approximation to signal from node 16

rwpc = wprcoef(T,16);
% wpcs length 1024

plot(noisdopp, 'k'); hold on;
plot(rwpc, 'b', 'linewidth', 2)
axis tight;

%% determine the optimum binary wavelet packet tree

Topt = besttree(T);

% plot the best tree
% do not use figure with a tree

plot(Topt);

%% reconstruct an approximation to the signal
% from the (3,0) to doublet (node 7)

rsig = wprcoef(Topt, 7);
% length(rsig) = 1024 isarete esit uzunlukta

figure,
plot(noisdopp, 'k'); hold on;
plot(rsig, 'b', 'linewidth', 2);
axis tight;

%% If you know which doublet in the binary wavelet packet tree
% you want to extract, you can determine the node corresponding
% to that doublet with depo2ind.
% For example, to determine the node corresponding to
% the doublet (3,0), enter:

Node = depo2ind(2, [3 0]);