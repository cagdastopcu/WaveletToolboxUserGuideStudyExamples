%% Multivariate Wavelet Denoising

close all, clear all,
clc,

%% Load a multivariate signal

load ex4mwden

%% display the original and observed signals

kp = 0;

figure,

for i=1:4
subplot(4,2,kp+1), plot(x_orig(:,i)); axis tight;
title(['Original signal ',num2str(i)])
subplot(4,2,kp+2), plot(x(:,i)); axis tight;
title(['Observed signal ',num2str(i)])
kp = kp + 2;
end

%% Remove noise by simple multivariate thresholding

% de-noising parameters

level = 5;
wname = 'sym4';
tptr = 'sqtwolog';
sorh = 's';

% set the PCA parameters by retaining all the principal components

npc_app = 4;
npc_fin = 4;

x_den = wmulden(x, level, wname, npc_app, npc_fin, tptr, sorh);

%% display the original and de-noised signals

kp = 0;
figure,
for i=1:4
subplot(4,3,kp+1), plot(x_orig(:,i));
set(gca,'xtick',[]); axis tight;
title(['Original signal ',num2str(i)])
subplot(4,3,kp+2), plot(x(:,i)); set(gca,'xtick',[]);
axis tight;
title(['Observed signal ',num2str(i)])
subplot(4,3,kp+3), plot(x_den(:,i)); set(gca,'xtick',[]);
axis tight;
title(['denoised signal ',num2str(i)])
kp = kp + 3;
end

%To automatically select the numbers of retained principal components 
%by Kaiser’s rule (which keeps the components associated with
%eigenvalues exceeding the mean of all eigenvalues), type

npc_app = 'kais';
npc_fin = 'kais';

[x_den, npc, nestco] = wmulden(x, level, wname, npc_app, ...
npc_fin, tptr, sorh);

%% Display the number of retained principal components

npc

%% Display the estimated noise covariance matrix

nestco

%% display the original and final de-noised signals
% it is better

kp = 0;
figure,
for i=1:4
subplot(4,3,kp+1), plot(x_orig(:,i));
set(gca,'xtick',[]); axis tight;
title(['Original signal ',num2str(i)]); set(gca,'xtick',[]);
axis tight;
subplot(4,3,kp+2), plot(x(:,i)); set(gca,'xtick',[]);
axis tight;
title(['Observed signal ',num2str(i)])
subplot(4,3,kp+3), plot(x_den(:,i)); set(gca,'xtick',[]);
axis tight;
title(['denoised signal ',num2str(i)])
kp = kp + 3;
end