%% 1-D signal model (with gaussian noise) and threshold

clear all, close all,
clc,

load cuspamax;
y = cuspamax+0.5*randn(size(cuspamax));
plot(y); hold on;
plot(cuspamax,'r','linewidth',2);
axis tight;
legend('f(n)+\sigma e(n)','f(n)', 'Location', 'NorthWest');

%% select threshold

thr = thselect(y,tptr) % rigrsure, sqtwolog, heursure, minimaxi

