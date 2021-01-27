img = imread('D:\Estudos\Eng. de Computação\Processamento Digital de Imagens\Listas\Lista 6\Pessoas\KR\KR.AN1.83.tiff');
[featureVector,hogVisualization] = extractHOGFeatures(img);

figure;
subplot(1,2,1);
imshow(img);
title('Imagem');
subplot(1,2,2);
plot(hogVisualization);
title('Caracterisiticas');

clear img, featureVector, hogVisualization;

img1 = imread('D:\Estudos\Eng. de Computação\Processamento Digital de Imagens\Listas\Lista 6\Pessoas\TM\TM.AN1.190.tiff');
[featureVector1,hogVisualization11] = extractHOGFeatures(img1);

figure;
subplot(1,2,1);
imshow(img1);
title('Imagem');

subplot(1,2,2);
plot(hogVisualization11);
title('Caracterisiticas');