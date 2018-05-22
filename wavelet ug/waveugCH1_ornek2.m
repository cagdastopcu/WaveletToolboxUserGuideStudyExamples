%% dbaux komutu, filtre degiskenleri belirlenir
% wavelet user guide version 2

Lprime = dbaux(2);

Hprime = wrev(Lprime);

% for i = 1:length(Hprime)
%     if (mod(i,2) == 1)
%         Hprime(i) = Hprime(i)*-1;
%         display(Hprime(i))
%     end
% end

Hprime(1) = Hprime(1)*-1;

HU = dyadup(Hprime);
% stem(HU)
HU = wkeep(HU,length(HU)-2);
% figure,
% stem(HU)

H2 = conv(HU,Lprime);
plot(H2)

H3 = dyadup(H2);

H3 = conv(H3,Lprime);

H3 = wkeep(H3,length(H3)-2);
figure,
plot(H3)