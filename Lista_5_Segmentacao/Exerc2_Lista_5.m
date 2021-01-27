% 2. Refaça a questão 1 com as imagens coloridas. 

%leitura do caminho onde as imagens estão
images ='C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 5\folhas';
jpgfiles=dir(fullfile(images,'\*.jpg*'));
n=numel(jpgfiles);


%% aplicando processamento de superpixel em todas as imagens da base
N=100; %numero de superpixels
for i=6:n
    nomeImg=jpgfiles(i).name;
    img1=imread(fullfile(images,nomeImg));
    
    %subplot(n,1,i);
    imshow(img1);
    title('imagem original Nimg= ' + string(i));
    figure();
    
    %subplot(n,1,i+1);
    img2out=super_pixel_RGB(img1,N,i);
    
    %% mostra a imagem resultante
    %subplot(n,1,i+2);
    imshow(img2out,'InitialMagnification',67);
    title('imagem de superpixel Nimg= ' + string(i) + " Nspixels= " + string(N));
    figure();
end 
%% 


%% função de superpixel para imagem RGB
%% essa função foi baseada nos conteudos disponíveis em (MATHWORK,2020)
function img2out = super_pixel_RGB (imgRGB,N, numeroImg)
%% dimensões da img1 
[x,y,~] = size(imgRGB);

%% separa a imagem em superpixels controlados por N
[L,N] = superpixels(imgRGB,N); 

%% Essa função gera uma mascara baseada no array L, de superpíxels
%consiste dos limites da imagem para o superpixel
BW = boundarymask(L); 

%% imoverlay(img1,BW,'cyan') essa função "queima" uma imagem BW em cima de
%uma imagem A, é como se fosse uma colagem (MATHWORKS,2020);
imshow(imoverlay(imgRGB,BW,'red'),'InitialMagnification',67);
title('conjunto de superpixels Nimg= ' + string(numeroImg) + " Nspixels= " + N);
figure();
%% retorna matriz de zeros == img1
img2out = zeros(size(imgRGB),'like',imgRGB);

%% converte matrizes rotulada para celula de vetores de indice linear                  
idx = label2idx(L);

%% realiza media dos pixels para cada superpixel nos conjuntos R, G e B
XporY= x*y; 
for labelVal = 1:N
    redIdx = idx{labelVal};
    greenIdx = idx{labelVal}+XporY  ;
    blueIdx = idx{labelVal}+2*XporY ;
    img2out(redIdx) = mean(imgRGB(redIdx));
    img2out(greenIdx) = mean(imgRGB(greenIdx));
    img2out(blueIdx) = mean(imgRGB(blueIdx));
end    
end

%resumidademente, o processo consiste em, tratar a imagem em seus
%componentes R, G e B e ir pegando a média dos pixels em regiões para serem
%atribuidos nos locia de pixels correspondentes na imagem resultante. esse
%processo é limitado por um N, que é o número de superpixels estabelecidos