%% wavelet packet spectrum

close all, clear all,
clc,

fs = 1000;
t = 0:1/fs:2;
y = sin(128*pi*t) + sin(256*pi*t); % sine of periods 64 and 128.

figure,
plot(t,y); title('Original Signal')

level = 6;
wpt = wpdec(y,level,'sym8');

figure,
[Spec,Time,Freq] = wpspectrum(wpt,fs,'plot');

%% short-time fourier transform spectrum

figure;
windowsize = 128;
window = hanning(windowsize);
nfft = windowsize;
noverlap = windowsize-1;
[S,F,T] = spectrogram(y,window,noverlap,nfft,fs);
imagesc(T,F,log10(abs(S)))
set(gca,'YDir','Normal')
xlabel('Time (secs)')
ylabel('Freq (Hz)')
title('Short-time Fourier Transform spectrum')