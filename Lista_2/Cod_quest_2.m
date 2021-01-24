%2.Execute a correção gama para a imagem inicial em escala de cinza e 
%  normalize a imagem para valores entre [0 e 1]. A equação de transformação 
%  é s=r*c^y, onde r é a intensidade de entrada, s é a intensidade de saída, 
%  c é uma constante e geralmente é definida como 1, y é o parâmetro que você
%  pode alterar. Defina y = 0.2, y= 0.8 e y = 2.5, exiba e comente os 
%  diferentes resultados.

%leitura da imagem
img=imread('img1.jpg');
%img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('imagem original');
figure();

[x, y, k]= size(img);


%transformando a imagem em escala de cinza
%img2 = imgEscalaCinza(img);
img2=img;

% imshow(img2);
% title('imagem em escala de cinza');
% figure();
% imwrite(img2,'imgGray.jpg');

%***** normalizando a imagem para valores 0 e 1 (binarizando) T=200
img02=normalizacao(img2,255);
img08=normalizacao(img2,255);
img25=normalizacao(img2,255);

%correção gama
% T e c parâmetro de correção, quanto mais alto mais brilho na imagem
img02= correcaoGama (img02,0.2,1);
img08= correcaoGama (img08,0.8,1);
img25= correcaoGama (img25,2.5,1);


imshow(img02(:,:,:));
title('imagem com correção gama y = 0.2');
figure();

imshow(img08(:,:,:));
title('imagem com correção gama y = 0.8');
figure();

imshow(img25(:,:,:));
title('imagem com correção gama y = 2.5');
figure();

imwrite(img25,'imgQuest4_2.jpg');


function [imgGama] = correcaoGama (img2,T,c)

[x,y,k] = size(img2);
imgGama= zeros(x,y,k,'double');
for i=1:x
    for j=1: y
        imgGama(i,j,:) = double( c * (img2(i,j,:).^T) );
    end
end

end


function [imgGray] = imgEscalaCinza(img2)

[x, y, ~]= size(img2);

%serparando componentes R, G e B
R = img2(:,:,1);
G = img2(:,:,2);
B = img2(:,:,3);

%criando um nova matriz preenchida com 0s de mesma dimensão da imagem original
imgGray=zeros(x, y, 'uint8');

%atribui cada pixel de intensidade a eu novo local da img em cinza
for i=1:x
    for j=1:y
        imgGray(i,j)= 0.2989 * R(i,j) + 0.5870 * G(i,j) + 0.1140 * B(i,j);
    end
end

end


function [ imgNova ] = normalizacao(img2,k)

[xo,yo,ko] = size(img2);
imgNova=zeros(xo,yo,ko,'double');

for i=1 :xo
    for j=1 : yo
        imgNova(i,j,:) = double(img2(i,j,:))/double(k);
    end
end

end

