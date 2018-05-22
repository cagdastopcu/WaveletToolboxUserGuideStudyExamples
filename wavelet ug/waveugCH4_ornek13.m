%% Thresholding Wavelet Packets

close all, clear all,
clc,

%% load the signal

load noisbloc;

x = noisbloc;

%% decomposition

t = wpdec(x,3, 'sym4');

plot(t);

% Change Node Label from Depth_position to Index and
% click the node (0). You get the following plot.

%% Global thresholding.
t1 = t;
sorh = 'h';
thr = wthrmngr('wp1ddenoGBL','penalhi',t);
cfs = read(t,'data');
cfs = wthresh(cfs,sorh,thr);
t1 = write(t1,'data',cfs);
plot(t1)
% Change Node Label from Depth_position to Index and
% click the node (0). You get the following plot.

%% node by node thresholding

t2 = t;

sorh = 's';

thr(1) = wthrmngr('wp1ddenoGBL', 'penalhi', t);

thr(2) = wthrmngr('wp1ddenoGBL','sqtwologswn',t);

tn = leaves(t);

for k = 1:length(tn)
    
    node = tn(k);
    
    cfs = read(t, 'data', node);
    
    numthr = rem(node, 2) + 1;
    
    cfs = wthresh(cfs, sorh, thr(numthr));
    
    t2 = write(t2, 'data', node, cfs);
    
end

plot(t2);

% Change Node Label from Depth_position to Index and
% click the node (0). You get the following plot.