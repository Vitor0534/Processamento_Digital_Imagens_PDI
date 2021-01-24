%Resolução lista 1

%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');
imshow(img(:,:,:));
title('img original');
figure();

[x y k] = size(img);

%1. Aplique a operação de espelhar a imagem horizontalmente e verticalmente.

%Espelhamento na vertical
img2=img;
for i=x: -1: 1
    for j=y: -1: 1
        img2(421-i,511-j,:) = img(i,j,:);
    end
end
imshow(img2(:,:,:));
title('img esp-vertical');
figure();


%Espelhamento na horizontal
img2=img;
for i=1: x
    for j=y: -1: 1
        img2(i,511-j,:) = img(i,j,:);
    end
end
imshow(img2(:,:,:));
title('img esp-horizontal');
figure();

%3. Aplique a operação de cortar a imagem
%dimensões de corte
X1=x/2;
Y1=y/2;
img3=uint8(zeros([X1 Y1 3 ]));

for i=1: X1
    for j=1: Y1
        img3(i,j,:) = img(i,j,:);
    end
end

imshow(img3(:,:,:));
title('img cortada');
figure();

%5. Aplique a operação de aumento de escala da imagem. 
