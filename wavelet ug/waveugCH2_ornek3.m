%one-dimensional analysis
% wavelet user guide version 2

close all, clear all,
clc,

load leleccum;

s = leleccum(1:3920);

figure,
plot(s)

l_s = length(s);

[cA1, cD1] = dwt(s,'db1');

%% recons. from coefficients

A1 = upcoef('a',cA1,'db1',1,l_s);
D1 = upcoef('d',cD1,'db1',1,l_s);

%or

% A1 = idwt(cA1,[],'db1',l_s);
% D1 = idwt([],cD1,'db1',l_s);

figure,
subplot(1,2,1); plot(A1); title('Approximation A1')
subplot(1,2,2); plot(D1); title('Detail D1')

% figure,
% plot(A1+D1); %S

%% regenerate the signal by using Inverse Wavelet Transform

A0 = idwt(cA1,cD1,'db1',l_s);

err = max(abs(s-A0))

%% perform a multilevel wavelet decomposition of a signal

% level 3 decomposition C = cA3, cD3, cD2, cD1.
% L gives the length of each component

[C, L] = wavedec(s,3,'db1');

%% exract approximation and detail coefficients

% to extract the level 3 approximation coefficients from C

cA3 = appcoef(C,L,'db1',3);

% to extract the levels 3, 2, and 1 detail coefficients from C

% cD3 = detcoef(C,L,3);
% cD2 = detcoef(C,L,2);
% cD1 = detcoef(C,L,1);

%or

[cD1, cD2, cD3] = detcoef(C,L,[1,2,3]);

%% reconstruct the level 3 apps and details

% level 3 apps

A3 = wrcoef('a',C,L,'db1',3);

% level 1, 2, 3 details

D1 = wrcoef('d',C,L,'db1',1);
D2 = wrcoef('d',C,L,'db1',2);
D3 = wrcoef('d',C,L,'db1',3);

%% display the results of a multilevel decomposition

figure,
subplot(2,2,1); plot(A3);
title('Approximation A3')
subplot(2,2,2); plot(D1);
title('Detail D1')
subplot(2,2,3); plot(D2);
title('Detail D2')
subplot(2,2,4); plot(D3);
title('Detail D3')

%% reconstruct the original signal from the level 3 decomposition

A0 = waverec(C,L,'db1');

err = max(abs(s-A0))

%% crude de-noising of a signal

figure,
subplot(2,1,1); plot(s); title('Original'); axis off
subplot(2,1,2); plot(A3); title('Level 3 Approximation'); axis off

%% remove noise by thresholding

figure,
subplot(3,1,1); plot(D1); title('Detail Level 1'); axis off
subplot(3,1,2); plot(D2); title('Detail Level 2'); axis off
subplot(3,1,3); plot(D3); title('Detail Level 3'); axis off

% calculate the default parameters

[thr, sorh, keepapp] = ddencmp('den', 'wv', s);

% wdencmp perform the actual de-noising
% gbl global thresholding option

clean = wdencmp('gbl', C, L, 'db1', 3, thr, sorh, keepapp);

figure,
subplot(2,1,1); plot(s(2000:3920)); title('Original')
subplot(2,1,2); plot(clean(2000:3920)); title('De-noised')