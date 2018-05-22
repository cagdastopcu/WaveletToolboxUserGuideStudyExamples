%% minimum-entropy decomposition

close all, clear all,
clc,

%% signal

w00 = ones(1,16)*0.25;
s = ones(1,16)*0.25;

%% compute entropy of the signal

display('entropy of the signal');
e00 = wentropy(w00,'shannon')

%% split w00 using the haar wavelet

[w10, w11] = dwt(w00,'db1');

%% compute entropy of approximation at level 1

display('entropy of approximation at level 1')
e10 = wentropy(w10,'shannon')
% e10 + e11 < e00 (e11 = 0)

%% split w10

[w20, w21] = dwt(w10, 'db1');

%% compute entropy of approximation at level 2

display('compute entropy of approximation at level 2');
e20 = wentropy(w20,'shannon')

% again we have e20 + 0 < e10 so splitting makes the entropy decrease

%% split w20

[w30,w31] = dwt(w20,'db1');

%% compute entropy of approximation at level 3

display('compute entropy of approximation at level 3');
e30 = wentropy(w30,'shannon')

%% split w30

[w40,w41] = dwt(w30,'db1');

%% compute entropy of approximation at level 4
% w40 = 0, entropy e40 = 0.
% display('compute entropy of approximation at level 3');
% e40 = wentropy(w40,'shannon')

% In the last splitting operation we find that only one piece of information
% is needed to reconstruct the original signal. The wavelet basis at level 4
% is a best basis according to Shannon entropy (with null optimal entropy
% since e40+e41+e31+e21+e11 = 0).

%% perform wavelet packets decomposition of signal s

t = wpdec(s, 4, 'haar', 'shannon');

bt = besttree(t);

%% The nodes are labeled with optimal entropy.

plot(bt);


