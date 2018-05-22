%% haar wavelet packets (n = 0 to 7)

close all, clear all,
clc,

[wfun,xgrid] = wpfun('db1',7,5);

for i = 1:8
    subplot(8, 1, i), plot(wfun(i,:));
    title(['Haar Wavelet Packets n = ', num2str(i-1)])
end

%% db2 wps n = 0 to 7 olmadi galiba :)

[wfun,xgrid] = wpfun('db2',7,8);

xmin = 0;
xmax = 4;
ymin = -2;
ymax = 3;

figure,
for i = 1:8
    subplot(8, 1, i), plot(wfun(i,:));
    %axis([xmin xmax ymin ymax])
    title(['Db2 Wavelet Packets n = olmadi bu cizim ', num2str(i-1)])
end

%% wpviewcf function

      x = sin(8*pi*[0:0.005:1]);
      t = wpdec(x,4,'db1');
      plot(t);
      wpviewcf(t,1);