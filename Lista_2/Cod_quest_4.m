% 4.	Crie seu algoritmo para calcular o histograma de uma imagem e 
%utilize-a na imagem resultante da questão 2 e 3 para ?=2.5. 

%leitura da imagem %coloque os endereços das imagens geradas nas quests 2 e 3
img0=imread('imgQuest4_1.jpg');
img1=imread('imgQuest4_2.jpg');

imshow(img0(:,:,:));
title('imagem_2  y=2.5');
figure();

imshow(img1(:,:,:));
title('imagem_3  y=2.5');
figure();

Hist = histograma(img0);
bar(Hist);
title('histograma imagem questão 2 y=2.5');
figure();

Hist = histograma(img1);
bar(Hist);
title('histograma imagem questão 3 y=2.5');


function [histo] = histograma (img)

   [xo,yo,~]= size(img);
   histo(1:256)=0;
   
   for i=1:xo
       for j=1:yo
           k=img(i,j,:);
           histo(k+1)=  histo(k+1) + 1;
       end
   end
   
end

