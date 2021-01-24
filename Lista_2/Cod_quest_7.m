% 7.	Quantifique os planos de cores usando 2 bits e 4 bits visualize 
%o efeito das operações. 

%leitura da imagem
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\imgListaProf.jpg');
%img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('imagem original');
figure();

img2=img;
[x, y, k]= size(img2);

%separando os componentes RGB
R = img2(:,:,1);
G = img2(:,:,2);
B = img2(:,:,3);

%quantificando os planos de cores em 2bist

%img02= uint8(zeros(x,y,k));

%img02=binarizacaoRGB(img2,16);


%img02=normalizacao(img02,255);

% [X_no_dither,map] = rgb2ind(img2,16,'nodither');
% imshow(X_no_dither,map);

% [Y,newmap] = imapprox(img2,16);
% imshow(Y, newmap);

% [X_dither,map] = rgb2ind(img2,16,'dither');
% imshow(X_dither,map)
[IND,map] = rgb2ind(img2,4,'nodither');
imshow(IND,map);
title('imagem quantificada em 2 bits');
figure();



%esta função binariza cada elemento R, G e B de forma individual
function [ img01 ] = binarizacaoRGB(img2,T)

[xo,yo,ko] = size(img2);
img01 = uint8(zeros(xo,yo,ko));

% T limiar de binarização
for i=1:xo
    for j=1:yo
        if(img2(i,j,1) > T)
             img01(i,j,1) = T;
        end
        if(img2(i,j,2) > T)
             img01(i,j,2) = T;
        end
        if(img2(i,j,3) > T)
             img01(i,j,3) = T;
        end
    end
end

end



function [ imgNova ] = normalizacao(img2,k)
 
[xo,yo,ko] = size(img2);
imgNova=uint8(zeros(xo,yo,ko));
 
%está função segue a ideia mostrada no livro do Gonsales Pág 51 pdf
fm= img2 - min(img2);
imgNova= uint8(round( k * ( fm ./ max(fm)) ) );
 
end
