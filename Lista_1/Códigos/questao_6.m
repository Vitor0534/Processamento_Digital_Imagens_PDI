%6. Crie um m�todo que reduza a escala da imagem pela
%metade e outro que rotacione a imagem original em 180�.



%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');

img2=img;
imshow(img2(:,:,:));
title('imagem original');
figure();

imgNova=reduz_Escala_Metade(img2);
imshow(imgNova(:,:,:));
title('imagem escala pela metade');
figure();


imgNova=rotacao_180(imgNova);
imshow(imgNova(:,:,:));
title('imagem rotacionada 180 graus');
figure();



function [ imgNova ] = reduz_Escala_Metade(img2)

escalaX=1/2; %configurado para retornar a metada da escala
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

end

function [ C ] = rotacao_180( img )

[rowsi,colsi,z]= size(img); 

angle=180;

rads=2*pi*angle/360;  

%calcula o tamanho dos vetores de linha e coluna da nova imagem. isso �
%feito para que a imagem original sirva dentro das dimen��es da proxima
%imagem ap�s a rota��o. O uso do valor absoluto garante que n�o sejam
%retornados valores negativos. caso n�o seja feita est� opera��o os cantos
%da imagem rotacionada podem ser cortados.

rowsf=ceil(rowsi*abs(cos(rads))+colsi*abs(sin(rads)));                      
colsf=ceil(rowsi*abs(sin(rads))+colsi*abs(cos(rads)));                     

% define an array withcalculated dimensionsand fill the array  with zeros ie.,black
C=uint8(zeros([rowsf colsf 3 ]));

%C(rowsf,colsf,3)=0;
C(:,:,:)=255;  %fundo configurado para cor branca

%calculating center of original and final image
xo=ceil(rowsi/2);   %fun��o ceil(x) pega o valor inteiro mais pr�ximo do n�mero,               
yo=ceil(colsi/2);   %sempre maior ou igual;

midx=ceil((size(C,1))/2);
midy=ceil((size(C,2))/2);

%o centro da imagem � importante pois a nova imagem ir� girar em torno
%deste valor

%loop para calcular as coordenadas correspondentes do pixel da imagem nova
%de acordo com cada pixel na imagem original

for i=1:size(C,1)
    for j=1:size(C,2)                                                       

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads);  %calculo para retornar o valor da linha na nova imagem                                     
         y= -(i-midx)*sin(rads)+(j-midy)*cos(rads); %Calculo para retornar o valor da coluna na nova imagem                            
         x=round(x)+xo;   % A fun��o round arredonda o n�mero para o inteiro mais pr�ximo
         y=round(y)+yo;   %soma o ponto com o centro para compensar o deslocamente

         if (x>=1 && y>=1 && x<=size(img,1) &&  y<=size(img,2) ) %verifica se a cordenada est� dentro da imagem
              C(i,j,:)=img(x,y,:);          %adiciona o pixel na cordenada x,y calculada nos locais correspondentes em C ,m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         end

    end
end


end








