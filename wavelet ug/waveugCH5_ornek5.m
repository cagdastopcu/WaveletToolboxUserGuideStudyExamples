%% level-dependent noise estimation. db3 and level 3

%% Load electrical signal and select part of it.
load leleccum; indx = 2000:3450;

x = leleccum(indx);

%% find first value in order to avoid edge effects

deb = x(1);

%% de-noise signal using soft fixed form thresholding and
% unknown noise option

xd = wden(x-deb, 'sqtwolog', 's', 'mln', 3, 'db3');

figure,
subplot(2,1,1); plot(x); title('Original Electrical Signal');
axis tight;
subplot(2,1,2); plot(xd); title('De-noised Cool Signal');
axis tight;