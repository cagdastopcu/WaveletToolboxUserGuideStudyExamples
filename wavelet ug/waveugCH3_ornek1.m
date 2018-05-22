%% effective fast matrix multiplication
% wavelet user guide version 2

% flops fonksiyonu cikarilmiþ. sonra yeniden bakman gerekecektir.
% kod calismiyor bu haliyle

clear all, close all,
clc,

n = 512;

lev = 5;

wav = 'db1';

%% wavelet based matrix multiplication by a vector
% a good example
% matrix is magic(512) and vector is (1:512)

m = magic(n);

v = (i:n)';

[Lo_D, Hi_D, Lo_R, Hi_R] = wfilters(wav);

%% ordinary matrix multiplication by a vector

flops(0);

p = m * v;

flomv = flops;

%% compute matrix approximation at level 5.

flops(0);

sm = m;

for i = 1:lev
    
    sm = dyaddown(conv2(sm, Lo_D), 'c');
    sm = dyaddown(conv2(sm, Lo_D), 'r');
    
end

flmapp = flops

%% the three steps
% 1. compute vector approximation.
% 2. compute multiplication in wavelet domain.
% 3. reconstruct vector approximation.

flops(0)

sv = v;

for i = 1:lev
    
    sv = dyaddown(conv(sv, Lo_D));
    
end

sp = sm * sv;

for i = 1:lev
    
    sp = conv2(dyadup(sp), Lo_R);
    
end

sp = wkeep(sp, length(v));

flwmv = flops