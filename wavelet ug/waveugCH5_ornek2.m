%% the threshold rules for a 1000-by-1 N(0,1) vector

close all, clear all,
clc,

rng default;

sig = randn(1e3, 1);

%% selection of thresholds

thr_rigrsure = thselect(sig,'rigrsure')
thr_univthresh = thselect(sig,'sqtwolog')
thr_heursure = thselect(sig,'heursure')
thr_minimaxi = thselect(sig,'minimaxi')

%% histogram of the signal

hist(sig);

%% find all line objects in the current axes (hazir)

h = findobj(gca,'Type','patch');

set(h,'FaceColor',[0.7 0.7 0.7],'EdgeColor','w');
hold on;
plot([thr_rigrsure thr_rigrsure], [0 300],'linewidth',2);
plot([thr_univthresh thr_univthresh], [0 300],'r','linewidth',2);
plot([thr_minimaxi thr_minimaxi], [0 300],'k','linewidth',2);
plot([-thr_rigrsure -thr_rigrsure], [0 300],'linewidth',2);
plot([-thr_univthresh -thr_univthresh], [0 300],'r','linewidth',2);
plot([-thr_minimaxi -thr_minimaxi], [0 300],'k','linewidth',2);

% histogramda görülecegi uzere isaretin frekansdaki baslangic
% ve band gibi bolumlerini threshold ile yakaladik