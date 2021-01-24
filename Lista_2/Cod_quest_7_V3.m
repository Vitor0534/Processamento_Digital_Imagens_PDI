%leitura da imagem
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\img1.jpg');
%img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('imagem original');
figure();

img2=img;
[x, y, k]= size(img2);

img02= limitaCores(img,2);
img04= limitaCores(img,4);

imshow(img02(:,:,:));
title('imagem 2 bits');
figure();

imshow(img04(:,:,:));
title('imagem 4 bits');
figure();

%a função seguiu a ideia de uma amostragem, de modo que uma imagem com
%cores 2^24 cores pudece ser discretizada para um intervalo de 2^n. esse
%processo foi definido atravez do calculo de um intervalo para cada pixel
%em R, G e B, de modo que, atravez da função round() se pegue o interio
%mais próximo retornado pela divisão e se multiplique pelo intervalo, que
%acaba funconando como o passo da amostragem.

function [imgNova] = limitaCores(img,n)

[x,y,k]=size(img);
imgNova=zeros(x,y,k,'uint8');

intervalo= 256/2^n;

for i=1 : x
    for j=1 : y
        %o intervalo de cores é definido atravez da divisão e multiplicaçã
        %do valor pelo intervalo definido 
        imgNova(i,j,1)=round(img(i,j,1)/intervalo)*intervalo;
        imgNova(i,j,2)=round(img(i,j,2)/intervalo)*intervalo;
        imgNova(i,j,3)=round(img(i,j,3)/intervalo)*intervalo;
             
    end
end

end



