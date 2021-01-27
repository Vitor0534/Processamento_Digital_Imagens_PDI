% inf = imread('D:\Estudos\Eng. de Computação\Processamento Digital de Imagens\PCA e Classificação\Imagens_Separadas\Parasitized\C109P70ThinF_IMG_20150930_102716_cell_185.png');
% 
% unf = imread('D:\Estudos\Eng. de Computação\Processamento Digital de Imagens\PCA e Classificação\Imagens_Separadas\Uninfected\C2NThinF_IMG_20150604_115238_cell_115.png');
% 
% x = unf;
% 
% figure();
%      imshow(x);
% 
%      % --------------------------------------------------------------------
%      % Passo 1 - Redimensionamento e conversão para escala de cinza
%      x = imresize(x, [150 150]);
%      x = rgb2gray(x);
%      y = x;
%      figure();
%      imshow(y);
%      % --------------------------------------------------------------------
%      
%      % --------------------------------------------------------------------
%      % Passo 2 - Limiarização
%      y = uint8(y > 10).*x;
%      y = uint8(y < 125).*x;
%      figure();
%      imshow(y);
%      % --------------------------------------------------------------------
% 
%      
%      % --------------------------------------------------------------------
%      % Passo 3 - Filtragem
%      n = 25;
%      mask = 1/(n*n) * ones(n,n);
%      y = imfilter(y, mask);
%      y = round(y/1.3);
%      figure();
%      imshow(y);
%      
%      y = otsu(y) .* x; % 70/30 = 84% de acerto 
%      figure();
%      imshow(y);
%      % --------------------------------------------------------------------