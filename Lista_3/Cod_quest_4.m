%4.	Altere o tamanho (Tam) para 10 e 100, use a m�scara rec�m-gerada 
%para filtrar a imagem original. 
%Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 
%Realize a filtragem espacial com a m�scara acima e exiba a imagem de sa�da. 

%leitura da imagem
img1=imread('img1.png');
imshow(img1(:,:,:));
title('imagem original');
figure();

Tam = 10; 
Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 

imgFiltred= imfilter(img1,Mascara,'replicate');
imshow(imgFiltred(:,:,:));
title('img filtrada Tam=10 com matlab');
figure();

% imgFiltred=convolucao(img1,Mascara);
% imshow(imgFiltred(:,:,:));
% title('img filtrada Tam=10');
% figure();



Tam = 100; 
Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 

imgFiltred= imfilter(img1,Mascara,'replicate');
imshow(imgFiltred(:,:,:));
title('img filtrada Tam=100 com matlab');
figure();

% imgFiltred=convolucao(img1,Mascara);
% imshow(imgFiltred(:,:,:));
% title('img filtrada Tam=100');
% figure();




%essa fucn��o foi criada baseada nas defini��es expostas no livro do
%Gonzales p�g 97 . Importante lembrar que a imagem final da fun��o � menos
%que a original (x-m-1).
function [imgNova2] = convolucao(img,masck)
[x,y,k] = size(img);
[m,n] = size(masck);
%rotaciona a mascara em 180 graus para realizar a convolu��o
h=rot90(masck,2); 
%cria uma matriz x+m+1 por y+n+1 preenchida de zero
imgNova=uint8(zeros(x+m+1,y+m+1,3)); 
[X1,Y1,~] = size(imgNova);

%coloca a imagem original centralizada dentro da matriz de zeros
for i=m+1: X1-m-1
    for j=n+1: Y1-m-1
        imgNova(i,j,:)=img(i,j,:);
    end
end

%realiza o c�lculo da soma dos produtos dos pixels com a mascara
for i= 1:x-m
    for j=1:y-n
        pixelNovo=0;
        for s=1: m
            for t=1: n
                pixelNovo= pixelNovo + round( h(s,t)*imgNova(i+s,j+t,:));
            end
        end
        imgNova(i,j,:)=pixelNovo;
    end
end
imgNova2=imgNova(m+1:end-m-1,n+1:end-n-1,:);

end

