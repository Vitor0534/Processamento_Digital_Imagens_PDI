%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
figure();

img2=img;

[xo yo] = size(img2);

%constantes de translação
tx=xo/2;
ty=yo/400;

%delimitações da translação
X1= xo/4; 
Y1= yo/6;

for i=1: X1
         x=ceil(i+tx);
    for j=1: Y1
         y=ceil(j+ty);
         if(x>=1 || x<=xo && y>=1 || y<=yo) %verifica os cantos da figura
             img2(i,j,:)=0;
             img2(x,y,:)=img(i,j,:);
         end
         
    end
end

        

imshow(img2(:,:,:));
title('img com pedaço transladado');
figure();