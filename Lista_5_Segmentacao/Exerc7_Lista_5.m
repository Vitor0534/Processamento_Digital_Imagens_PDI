%7. Crie sua própria rotina de segmentação para as imagens combinando 
%alguns métodos de sua preferência, presentes ou não na lista. Justifique o
%uso dos métodos escolhidos. 

close all;
%% leitura do caminho onde as imagens estão
images ='folhas/';
jpgfiles=dir(fullfile(images,'/*.jpg*'));
n=numel(jpgfiles);

%% aplicando a segmentação em todas as imagens da base
for i=1:n
    nomeImg=jpgfiles(i).name;
    img1=imread(fullfile(images,nomeImg));
    
    %% motra imagem original
    imshow(img1);
    title('imagem original Nimg= ' + string(i));
    figure();  
    %% filtra imagem 
    img2out=   Filtro_Q3_Lista3(img1, 10);
    %% encontra ponto semente 
    [x,y] = find_Point(img2out);
    %% aplica regionGrowing
    img2out=RegionGrowingMine(img2out,x,y,0.2);
    %% aplica otsu
    img3out=otsu(img2out,img1,i);
    
    %% mostra a imagem resultante
    imshow(img3out,'InitialMagnification',67);
    title('imagem final  Nimg= ' + string(i));
    figure();
end 
%% 




function img2out = otsu(img1,img2,i)
% converte para escala de cinza
    imgGray = rgb2gray(img1); 
%% Encontrar a mascara utilizando otsu
% esse função retorna um k para servir de limiar para a img1
% essa função usa o método de otsu
k = graythresh(imgGray);
%normaliza o valor de k
k = k * 255; 
%% aplica a limiarização usando k obtido com o métododo de otsu
% mascara = uint8( (imgGray < k) * 255);
mascara=zeros(size(img1,1),size(img1,2),'uint8');
for i=1: size(img1,1)
    for j=1: size(img1,2)
        if(imgGray(i,j,:) > k)
            mascara(i,j)=1;
        end
    end
end

%% aplicando a mascara na 
img2out = mascara .* img2;
end
%% 

%% filtro
function [ imgFiltred ] = Filtro_Q3_Lista3( img1, Tam)
Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 
imgFiltred= imfilter(img1,Mascara,'replicate');
end
%% 


%%  essa função rastreia a imagem para encontrar um bom ponto de semente
function [x,y] = find_Point(img1)
    
   img12=img1;
   img12(:,:,2)=0;
   img12(:,:,3)=0;
   [x1,y1,~] = size(img12);
   
   cont=0;
   for i=1 : x1 
           if(img12(i,i)<100)
               cont=cont+1;
           end
           if(cont==22)
               y=i;
               x=i;
               break;
           end
       
   end
    
end
%% 

%% 
function [ img2out ] = RegionGrowingMine(img1,x,y,reg_maxdist)

I = im2double(img1);

if(exist('reg_maxdist','var')==0), reg_maxdist=0.2; end
if(exist('y','var')==0), figure, imshow(I,[]); [y,x]=getpts; y=round(y(1)); x=round(x(1)); end
J = zeros(size(I,1),size(I,2)); % Output 
Isizes = size(I); % Dimensions of input image
reg_mean = I(x,y); % The mean of the segmented region
reg_size = 1; % Number of pixels in region
% Free memory to store neighbours of the (segmented) region
neg_free = 10000; neg_pos=0;
neg_list = zeros(neg_free,3); 
pixdist=0; % Distance of the region newest pixel to the regio mean
% Neighbor locations (footprint)
neigb=[-1 0; 1 0; 0 -1;0 1];
% Start regiogrowing until distance between regio and posible new pixels become
% higher than a certain treshold
while(pixdist<reg_maxdist&&reg_size<numel(I))
    % Add new neighbors pixels
    for j=1:4
        % Calculate the neighbour coordinate
        xn = x +neigb(j,1); yn = y +neigb(j,2);
        
        % Check if neighbour is inside or outside the image
        ins=(xn>=1)&&(yn>=1)&&(xn<=Isizes(1))&&(yn<=Isizes(2));
        
        % Add neighbor if inside and not already part of the segmented area
        if(ins&&(J(xn,yn)==0)) 
                neg_pos = neg_pos+1;
                neg_list(neg_pos,:) = [xn yn I(xn,yn)]; J(xn,yn)=1;
        end
    end
    % Add a new block of free memory
    if(neg_pos+10>neg_free), neg_free=neg_free+10000; neg_list((neg_pos+1):neg_free,:)=0; end
    
    % Add pixel with intensity nearest to the mean of the region, to the region
    dist = abs(neg_list(1:neg_pos,3)-reg_mean);
    [pixdist, index] = min(dist);
    J(x,y)=2; reg_size=reg_size+1;
    
    % Calculate the new mean of the region
    reg_mean= (reg_mean*reg_size + neg_list(index,3))/(reg_size+1);
    
    % Save the x and y coordinates of the pixel (for the neighbour add proccess)
    x = neg_list(index,1); y = neg_list(index,2);
    
    % Remove the pixel from the neighbour (check) list
    neg_list(index,:)=neg_list(neg_pos,:); neg_pos=neg_pos-1;
end
% Return the segmented area as logical matrix
J=J>1;

img2out = uint8(J) .*img1;
end
%% 