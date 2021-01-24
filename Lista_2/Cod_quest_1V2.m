%leitura da imagem
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\img1.jpg');
imshow(img(:,:,:));
title('imagem original');
figure();

img2=img;
[x, y, k]= size(img2);

%correção gama
T=2.5;    %parâmetro de correção, quanto maior mais brilho na imagem
c=1;
 
imgGama= zeros(x,y,k,'double');
for i=1:x
    for j=1: y
        imgGama(i,j,:) = c * (double(img2(i,j,:)).^double(T));
    end
end
 
%***** normalizando a imagem 
img01=normalizacao(imgGama,255);
 
imshow(img01(:,:,:));
title('imagem com correção gama y = ' + string(T) + ' noramilzada k= 255');
figure();
 
imwrite(img01, 'imgQuest4_2.jpg'); 

function [ imgNova ] = normalizacao(img2,k)
 
[xo,yo,ko] = size(img2);
imgNova=uint8(zeros(xo,yo,ko));
 
%está função segue a ideia mostrada no livro do Gonsales Pág 51 pdf
fm= img2 - min(img2);
imgNova= uint8(round( k * ( fm ./ max(fm)) ) );
 
end
