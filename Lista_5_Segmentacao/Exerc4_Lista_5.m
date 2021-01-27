%% 4. Para cada imagem utilize a segmenta��o utilizando o m�todo de otsu. 
%% leitura do caminho onde as imagens est�o 
images ='folhas';
jpgfiles=dir(fullfile(images,'\*.jpg*'));
n=numel(jpgfiles);

%% aplicando o metodo de otsu em todas as imagens da base
for i=1:n-8
    nomeImg=jpgfiles(i).name;
    img1=imread(fullfile(images,nomeImg));
    
    %subplot(n,1,i);
    imshow(img1);
    title('imagem original Nimg= ' + string(i));
    figure();
    
    %subplot(n,1,i+1);
    img2out=otsu(img1,i);
    
    %% mostra a imagem resultante
    %subplot(n,1,i+2);
    imshow(img2out,'InitialMagnification',67);
    title('imagem resultante, Nimg= ' + string(i));
    figure();
end 
%% 


%% fun��o de otuso para imagem RGB
% essa fun��o foi baseada nos conteudos dispon�veis em (MATHWORK,2020)
% e (GONZALEZ, WOODS, 2010)
% a fun��o aplica um otso de forma globla, buscando dividir a imagem em 2
% seguimentos, fundo e objeto 

function img2out = otsu(img1,i)
% converte para escala de cinza
    imgGray = rgb2gray(img1); 
%% Encontrar a mascara utilizando otsu
% esse fun��o retorna um k para servir de limiar para a img1
% essa fun��o usa o m�todo de otsu
k = graythresh(imgGray);
%normaliza o valor de k
k = k * 255; 
%% aplica a limiariza��o usando k obtido com o m�tododo de otsu
mascara = uint8( (imgGray < k) * 255);
imshow(mascara);
title('masck, Nimg= ' + string(i));
figure();
%% normalizando a mascara
mascara01 = mascara/255;

%% aplicando a mascara na 
img2out = mascara01 .* img1;

end
%% 









