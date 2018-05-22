%% wavelet toolbox user guide version 2, basili hali
% wavelet user guide version 2, ch4 2013'den devam edecegim icin
%belirttim

clear all, close all,
clc,
%% generate signal
s = sin(20.*linspace(0,pi,1000)) + 0.5*rand(1,1000);
%% generate cA and cD bu degerler downsampling yapilmis ve
%alcak gecirenle yuksek geciren filtrelerin uygulanmis halidir
[cA,cD] = dwt(s,'db2');
tpi1000 = linspace(0,pi,1000); %pi 1000 eþit parçaya bolundu.
figure,
plot(tpi1000,s)

figure,
stem(cA);
figure,
stem(cD);

s1 = idwt(cA,cD,'db2');% waverec()

figure,
plot(tpi1000,s1);