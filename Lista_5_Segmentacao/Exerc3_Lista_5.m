%% 3. Para cada imagem utilize a segmentação por K-means clustering. 
%% leitura do caminho onde as imagens estão (obs mude a chave de / para \, caso ocorra erro na leitura)
images ="folhas/";
jpgfiles=dir(fullfile(images,'/*.jpg*'));
n=numel(jpgfiles);

%% aplicando processamento de k-measn clustering em todas as imagens da base
K=2; %numero de clusters 
for i=1:n-5
    nomeImg=jpgfiles(i).name;
    img1=imread(fullfile(images,nomeImg));
    
    %subplot(n,1,i);
    imshow(img1);
    title('imagem original Nimg= ' + string(i));
    figure();
    
    %subplot(n,1,i+1);
    img2out=k_means_clustering (img1,K);
    
    %% mostra a imagem resultante
    %subplot(n,1,i+2);
    imshow(img2out,'InitialMagnification',67);
    title('imagem de superpixel Nimg= ' + string(i) + " K= " + K);
    figure();
end 
%% 
%% função de k-means clustering para imagem RGB
% essa função foi baseada nos conteudos disponíveis em (MATHWORK,2020)
function img2out = k_means_clustering (imgRGB,K)

%% seguimenta a imagem em k clusters fazendo k-means clustering e retornando
% o seguimento rotulado para L
L = imsegkmeans(imgRGB,K);
%% normaliza as labels da imagem para valores entre 0 e 255 novamente
img2out = labeloverlay(imgRGB,L);
end


