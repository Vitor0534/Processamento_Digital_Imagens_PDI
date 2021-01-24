%6.	Escolha um limiar e aplique em todos os componentes da sua imagem.

%leitura da imagem
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\img1.jpg');
%img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('imagem original');
figure();

img2=img;
[x, y, k]= size(img2);

%limiar selecionado
T=200;
img01= binarizacaoRGB(img2,T);

imshow(img01(:,:,:));
title('imagem binarizada com limiar k= ' + string(T));
figure();


%esta função binariza cada elemento R, G e B de forma individual
function [ img01 ] = binarizacaoRGB(img2,T)

[xo,yo,ko] = size(img2);
img01 = uint8(zeros(xo,yo,ko));

% T limiar de binarização
for i=1:xo
    for j=1:yo
        if(img2(i,j,1) < T)
             img01(i,j,1) = 255;
        else
            img01(i,j,1) = 0;
        end
        if(img2(i,j,2) < T)
             img01(i,j,2) = 255;
        else
            img01(i,j,2) = 0;
        end
        if(img2(i,j,3) < T)
             img01(i,j,3) = 255;
        else
             img01(i,j,3) =0;
        end
    end
end

end