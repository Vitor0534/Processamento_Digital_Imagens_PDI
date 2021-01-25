%3. Gere uma m�scara para um filtro espacial usando o seguinte c�digo: 
%Tam = 3; 
%Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 
%Realize a filtragem espacial com a m�scara acima e exiba a imagem de sa�da. 

%leitura da imagem
img1=imread('img1.png');
imshow(img1(:,:,:));
title('imagem original');
figure();

Tam = 3; 
Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 

imgFiltred= imfilter(img1,Mascara,'replicate');
imshow(imgFiltred);
title('img filtrada fun��o criada');
figure();


imgFiltred2=convolucao(img1,Mascara);
imshow(imgFiltred2(:,:,:));
title('img filtrada fun��o criada');
figure();


%essa fucn��o foi criada baseada nas defini��es expostas no livro do
%Gonzales p�g 97 . Importante lembrar que a imagem final da fun��o � menos
%que a original (x-m-1).
function [imgNova3] = convolucao(img,masck)
[x,y,k] = size(img);
[m,n] = size(masck);
%rotaciona a mascara em 180 graus para realizar a convolu��o
h=rot90(masck,2); 
%cria uma matriz x+m+1 por y+n+1 preenchida de zero
imgNova=zeros(x+m+1,y+n+1,3,'double');
[X1,Y1,~] = size(imgNova);

%coloca a imagem original centralizada dentro da matriz de zeros
for i=1: x
    for j=1: y
        imgNova(i+m-1,j+m-1,:)= img(i,j,:);
    end
end

imgNova2=imgNova;
%realiza o c�lculo da soma dos produtos dos pixels com a mascara
for i= 1:X1-m+1
    for j=1:Y1-n+1
        pixelNovo=1;
        for s=1: m
            for t=1: n
                pixelNovo= pixelNovo + h(s,t)*imgNova(i+s-1,j+t-1,:);
            end
        end
        imgNova2(i+round(m/2)-1,j+ round(n/2)-1,:)= round(pixelNovo);
    end
end

imgNova3=uint8(imgNova2(m+1:end-m-1,n+1:end-n-1,:));

end

