%6.Crie um método que reduza a escala da imagem pela 
%metade e outro que rotacione a imagem original em 180°.

%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');


%img2=imresize(img,0.25);
img2=img;
imshow(img2(:,:,:));
figure();

%basicamente usa-se a ideia da escala exposta no livro do Gonsales
%a unica diferença é a questão de se utilizar numero fracionários
%logo, quando se coloca em escala 1/2 temos uma redução pela metade da
%escala


escalaX=1/2;
escalaY=1/2;
[xo yo k] = size(img2);
imgNova=uint8(zeros([round(xo*escalaX) round(yo*escalaY) 3 ]));

for i=1: xo
    for j=1: yo
        x=ceil(escalaX*i);
        y=ceil(escalaY*j);
        imgNova(x,y,:)=img2(i,j,:);
    end
end

if(escalaX>1 || escalaY>1)
    %dimenções de linha/coluna da nova imagem 
    X1=size(imgNova,1);
    Y1=size(imgNova,2) ;

    for i=1:X1
        for j=1:Y1
            if(imgNova(i,j,:)==0)
                imgNova(i,j,:)=img2(ceil(i/escalaX),ceil(j/escalaY),:);
            end
        end
    end
    
end

imshow(imgNova(:,:,:));
figure();

