%% denoising in action
% wnoise

close all, clear all,
clc,

%% Set signal to noise ratio and set rand seed.

sqrt_snr = 4; init = 2055615866;

%% Generate original signal xref and a noisy version x adding
% a standard Gaussian white noise.

[xref,x] = wnoise(1,11,sqrt_snr,init);

%% De-noise noisy signal using soft heuristic SURE thresholding
% and scaled noise option, on detail coefficients obtained
% from the decomposition of x, at level 3 by sym8 wavelet.

xd = wden(x,'heursure','s','one',3,'sym8');

%% cizdir plot

figure,
subplot(3,1,1); plot(xref); title('Original Signal'); axis tight;
subplot(3,1,2); plot(x); title('Noisy Signal'); axis tight;
subplot(3,1,3); plot(xd); title('De-noised Signal'); axis tight;