%% Multiscale Principal Components Analysis

clear all, close all,
clc,

%% Load a multivariate signal

load ex4mwden

%% set the wavelet parameters
% The multiscale PCA combines noncentered PCA on approximations and
% details in the wavelet domain and a final PCA. At each level,
% the most significant principal components are selected.

level= 5;
wname = 'sym4';

%% automatically select the number of retained princ. comp.
% using Kaiser's rule

npc = 'kais';

%% perform multiscale PCA

[x_sim, qual, npc] = wmspca(x ,level, wname, npc);

%% display the original and simplified signals

kp = 0;
figure,
for i=1:4
subplot(4,2,kp+1), plot(x (:,i)); set(gca,'xtick',[]);
axis tight;
title(['Original signal ',num2str(i)])
subplot(4,2,kp+2), plot(x_sim(:,i)); set(gca,'xtick',[]);
axis tight;
title(['Simplified signal ',num2str(i)])
kp = kp + 2;
end

%% quality of column reconstructions given by relative
% mean square errors are close to 100%.

qual

%% Improve the first result by retaining fewer principal components

npc

npc(1:3) = zeros(1,3);

npc

%% perform multiscale PCA

[x_sim, qual, npc] = wmspca(x, level, wname, npc);

%% display the original and final simplified signals
%  the results are improved

kp = 0;
figure,
for i=1:4
subplot(4,2,kp+1), plot(x (:,i)); set(gca,'xtick',[]);
axis tight;
title(['Original signal ',num2str(i)]); set(gca,'xtick',[]);
axis tight;
subplot(4,2,kp+2), plot(x_sim(:,i)); set(gca,'xtick',[]);
axis tight;
title(['Simplified signal ',num2str(i)])
kp = kp + 2;
end

%% 5. chapterda data compressiondan sorasi yok
% dg konuyla alakasiz diger alt bolumun de c-line kýsmý yok.