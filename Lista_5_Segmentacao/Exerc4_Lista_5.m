%% 4. Para cada imagem utilize a segmentação utilizando o método de otsu. 
%% leitura do caminho onde as imagens estão 
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


%% função de otuso para imagem RGB
% essa função foi baseada nos conteudos disponíveis em (MATHWORK,2020)
% e (GONZALEZ, WOODS, 2010)
% a função aplica um otso de forma globla, buscando dividir a imagem em 2
% seguimentos, fundo e objeto 

function img2out = otsu(img1,i)
% converte para escala de cinza
    imgGray = rgb2gray(img1); 
%% Encontrar a mascara utilizando otsu
% esse função retorna um k para servir de limiar para a img1
% essa função usa o método de otsu
k = graythresh(imgGray);
%normaliza o valor de k
k = k * 255; 
%% aplica a limiarização usando k obtido com o métododo de otsu
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









