%2. Aplique a operação de deformação, a sua escolha.

%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');

img2=img;
imshow(img2(:,:,:));
title('imagem original');
figure();

[xo yo k] = size(img2);
constCisi=1;              %constante de cisalhamento

imgNova=uint8(zeros([xo (yo*constCisi + xo)  3 ]));

for i=1: xo
    for j=1 : yo
        x=i;
        y=constCisi*i+j;
        imgNova(x,y,:)=img2(i,j,:);
    end
end


imshow(imgNova(:,:,:));
title('imagem com cizalhamento');
figure();

imwrite(imgNova,'imaQuest8.jpg');