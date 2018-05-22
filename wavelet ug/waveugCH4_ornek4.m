%% Wavelet packet spectrum of a linear chirp

close all, clear all,
clc,

fs = 1000;
t = 0:1/fs:2;
y = sin(256*pi*t.^2);

figure,
plot(t,y); title('Original Signal')

level = 6;
wpt = wpdec(y,level,'sym8');

figure,
[Spec,Time,Freq] = wpspectrum(wpt,fs,'plot');

%% stft spectrum

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