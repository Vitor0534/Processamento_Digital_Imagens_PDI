%1. Converta a sua imagem em uma imagem cinza e normalize a imagem para valores entre [0 e 1]. Posteriormente binarize a imagem com limite
%k = 0,68 e qualquer número desejado e, mostre as imagens resultantes.

%leitura da imagem
img=imread('img1.jpg');
%img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('imagem original');
figure();

img2=img;
[x, y, k]= size(img2);

%****primeiro passo, converter a imagem em escala de cinza*****

%para realizar este procedimento pode-se extrais os componentes R, G e B da
%imagem e utilizar a formula padrão NTSC para converter os pixels em
%intensidades de cinza. Para tanto, basta realizar um somatório dos pixels
%R, G e B para a nova imagem utilzando uns pesos padrões.
%intensity = 0.2989*red + 0.5870*green + 0.1140*blue

imgGray=imgEscalaCinza(img2);

imshow(imgGray);
title('imagem em escala de cinza');
figure();
imwrite(imgGray,'imgGray.jpg');


%***** normalizando a imagem para valores 0 e 1 
img01=normalizacao(imgGray,255);

%***** binarizando a imagem com k=68
img012=binarizacao(img01,0.68);

imshow(img012);
title('imagem Binarizada');
figure();


function [ imgNova ] = normalizacaoV2(img2,k)

[xo,yo,ko] = size(img2);
imgNova = zeros(xo,yo,ko,'double');

%está função segue a ideia mostrada no livro do Gonsales Pág 51 pdf
fm= img2 - min(img2);
%imgNova= uint8(round( k * ( fm ./ max(fm))));
imgNova= k * ( fm ./ max(fm));

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


function [ img01 ] = binarizacao(img2,T)

[xo,yo,ko] = size(img2);
img01 = uint8(zeros(xo,yo,ko));

% T limiar de binarização

for i=1:xo
    for j=1:yo
        if(img2(i,j,:) < T)
             img01(i,j,:) = 255;
        end
    end
end

end
