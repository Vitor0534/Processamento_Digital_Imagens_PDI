% 1. Para cada imagem transforme-a em escala de cinza e utilize a segmentação
% por superpixels. Utilize 5, 10, 100 superpixels e explique os resultados. 

%leitura do caminho onde as imagens estão
images ='C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 5\folhas';
jpgfiles=dir(fullfile(images,'\*.jpg*'));
n=numel(jpgfiles);


%% aplicando processamento de superpixel em todas as imagens da base
N=100; %numero de superpixels
for i=5:n
    nomeImg=jpgfiles(i).name;
    img1=imread(fullfile(images,nomeImg));
    
    %subplot(n,1,i);
    imshow(img1);
    title('imagem original N=' + string(i));
    figure();
    
    imgGray = rgb2gray(img1);
    %subplot(n,1,i+1);
    img2out=super_pixel_grayScale(imgGray,N,i);
    
    %% mostra a imagem resultante
    %subplot(n,1,i+2);
    imshow(img2out,'InitialMagnification',67);
    title('imagem de superpixel Nimg= ' + string(i) + " Nspixels= " + N);
    figure();
end 
%% 





%% função de superpixel para imagem grayscale
%% essa função foi baseada nos conteudos disponíveis em (MATHWORK,2020)
function img2out = super_pixel_grayScale (img1,N, numeroImg)
%% dimensões da img1 e grayScale
[x,y,z] = size(img1);
imgGray = img1;

%% separa a imagem em superpixels controlados por N
[L,N] = superpixels(imgGray,N); 

%% Essa função gera uma mascara baseada no array L, de superpíxels
%consiste dos limites da imagem para o superpixel
BW = boundarymask(L); 

%% imoverlay(img1,BW,'cyan') essa função "queima" uma imagem BW em cima de
%uma imagem A, é como se fosse uma colagem (MATHWORKS,2020);
imshow(imoverlay(imgGray,BW,'red'),'InitialMagnification',67);
title('conjunto de superpixels Nimg= ' + string(numeroImg) + " Nspixels= " + N);
figure();
%% retorna matriz de zeros == img1
img2out = zeros(size(imgGray),'like',imgGray);

%% converte matrizes rotulada paara celular de vetores de indice linear                  
idx = label2idx(L);

%% realiza media dos pixels para cada superpixel
for labelVal = 1:N
    IdxImg = idx{labelVal};
    img2out(IdxImg) = mean(imgGray(IdxImg));
end    

end
