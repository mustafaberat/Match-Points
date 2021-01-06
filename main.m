%NOT: Projenin calisabilmesi icin extention indirmek gerekmektedir.

%resimlerimizi verip gri bandini degiskenlere atiyoruz
resim1_gray = rgb2gray(imread('resim1.png'));
resim2_gray= rgb2gray(imread('resim2.png')); 

%Harris–Stephens algoritmasi ile kose noktalarini degiskene atiyoruz
loc_met_count1 = detectHarrisFeatures(resim1_gray);
loc_met_count2 = detectHarrisFeatures(resim2_gray);

%Ozellikleri cikarmak icin resmimizi    ve kose noktalarimizi verip
%ozellikleri ve gecerli noktalari aliyoruz
[ozellikler1, vpts1] = extractFeatures(resim1_gray, loc_met_count1);
[ozellikler2, vpts2] = extractFeatures(resim2_gray, loc_met_count2);

%Burada ozellikleri karsilastirip ortaklari aliyoruz
ortaklar = matchFeatures(ozellikler1, ozellikler2);

%Karsilastiracagimiz nokta sayisini belirliyoruz
nokta_sayisi = 1:12;

%Eslesen noktalari yazdirmak icin degiskene atiyoruz
matchedPoints1 = vpts1(ortaklar(nokta_sayisi, 1));
matchedPoints2 = vpts2(ortaklar(nokta_sayisi, 2));

figure; ax = axes;
showMatchedFeatures(resim1_gray,resim2_gray,matchedPoints1,matchedPoints2,'montage','Parent',ax);
title(ax, 'Ortak özellikli noktaları eşleştirme ödevi');
legend(ax, 'Resim 1 de eşleşen nokta','Resim 2 de eşleşen nokta');
