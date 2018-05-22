%% compute various entropies
%help wentropy

close all, clear all,
clc,

%% generate a signal of energy equal to 1.

s = ones(1,16)*0.25;

%% compute the Shannon entropy of s

e1 = wentropy(s,'shannon')

%% compute the l^1.5 entropy of s, equivalent to norm(s,1.5)^1.5

e2 = wentropy(s,'norm',1.5)

%norm(s,1.5)^1.5 %same s***

%% compute the "log energy" entropy of s

e3 = wentropy(s,'log energy')

%% compute the threshold entropy of s,
%using a threshold value of 0.24

e4 = wentropy(s, 'threshold', 0.24)

