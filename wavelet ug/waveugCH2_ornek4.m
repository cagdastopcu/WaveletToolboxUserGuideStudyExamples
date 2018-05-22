%% one-dimensional discrete stationary wavelet analysis
% wavelet user guide version 2
close all, clear all,
clc,

%% load a signal

load noisdopp

s = noisdopp;

%% perform a single-level stationary wavelet decomposition


[swa, swd] = swt(s, 1, 'db1');

%% plot the signal

figure,
plot(s); title('Original Signal S')

%% display the coefficients of approxmation and detail at level 1
% eleman sayýsý yariya dusmuyor, it doesn't have downsampling

figure,
subplot(1,2,1), plot(swa); title('Aproximation coeffs')
subplot(1,2,2), plot(swd); title('Detail coeffs')

%% regenerate the signal by inverse stationary wavelets transform

A0 = iswt(swa, swd, 'db1');

%% check the perfect reconstruction

err = norm(s-A0)

%% construct and display approximation and detail from the coeffs

nulcfs = zeros(size(swa)); % degisken olusturulur

A1 = iswt(swa, nulcfs, 'db1');

D1 = iswt(nulcfs, swd, 'db1');

figure,
subplot(1,2,1), plot(A1); title('Approximation A1');
subplot(1,2,2), plot(D1); title('Detail D1');

%% perform a multilevel stationary wavelet decomposition

[swa, swd] = swt(s, 3, 'db1');

clear A0 A1 D1 err nulcfs;

%% display the coefficients of approximations and details

kp = 0;

figure,

for i = 1:3
    subplot(3, 2, kp+1), plot(swa(i,:));
    title(['Approx. coeffs level ', num2str(i)])
    subplot(3, 2, kp+2), plot(swd(i,:));
    title(['Detail coeffs level ', num2str(i)])
    kp = kp + 2;
end

%% reconstruct approximation at level 3 from ceofficients

mzero = zeros(size(swd));

A = mzero;

A(3,:) = iswt(swa, mzero, 'db1');

%% reconstruct details from coefficients

D = mzero;

for i = 1:3
    swcfs = mzero;
    swcfs(i,:) = swd(i,:);
    D(i,:) = iswt(mzero, swcfs, 'db1');
end

%% reconstruct and display approximation at level 1 and 2 from
% approximation at level 3 and details at level 2 and 3

A(2,:) = A(3,:) + D(3,:);
A(1,:) = A(2,:) + D(2,:);

%% display the approximation and details at levels 1, 2 and 3

kp = 0;

figure,

for i = 1:3
    
    subplot(3,2,kp+1), plot(A(i,:));
    title(['Approx. level ', num2str(i)])
    subplot(3,2,kp+2), plot(D(i,:));
    title(['Detail level ', num2str(i)])
    
    kp = kp + 2;
end

%% remove noise by thresholding

[thr, sorh] = ddencmp('den', 'wv', s);

dswd = wthresh(swd, sorh, thr);

clean = iswt(swa, dswd, 'db1');

% display the original and de-noised signal

figure,
subplot(2,1,1), plot(s);
title('Original Signal')
subplot(2,1,2), plot(clean);
title('De-noised Signal')

%%  level 5 de-noising

[swa, swd] = swt(s, 5, 'db1');

[thr, sorh] = ddencmp('den', 'wv', s);

dswd = wthresh(swd, sorh, thr);

clean = iswt(swa, dswd, 'db1');

figure,
subplot(2,1,1), plot(s); title('Original Signal')
subplot(2,1,2), plot(clean); title('De-noised Signal L5')

%% dwtmode('sym') symmetric padding, page 2-133