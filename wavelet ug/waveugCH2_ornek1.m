%% cont. wavelet transform
% wavelet user guide version 2

close all, clear all,
clc,

load noissin;

figure,
plot(noissin)
figure,
c1 = cwt(noissin,1:48,'db4','plot');

figure,
c2 = cwt(noissin,2:2:128,'db4','plot');

%wavemenu