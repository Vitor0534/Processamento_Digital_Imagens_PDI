% 5.	Torne a imagem de entrada mais clara ou mais escura. 

%leitura da imagem
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\img1.jpg');
%img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('imagem original');
figure();

img2=img;
[x, y, k]= size(img2);

%imagem mais clara
imgNova= intensidadeBrilho(img2,50);

imshow(imgNova(:,:,:));
title('imagem mais clara');
figure();

%imagem mais escura
imgNova= intensidadeBrilho(img2,-50);

imshow(imgNova(:,:,:));
title('imagem mais escura');
figure();


function [imgNova] = intensidadeBrilho (img,c)
[x, y, k]= size(img);
imgNova= img;

for i=1 : x
    for j=1 : y
        imgNova(i,j,:) = imgNova(i,j,:) + c;
    end
end
end


