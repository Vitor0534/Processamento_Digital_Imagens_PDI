%2. Aplique a opera��o de deforma��o, a sua escolha.

img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png'); 

[rowsi,colsi,z]= size(img); 

angle=30;

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
C(:,:,:)=255;  %fundo configudo para cor branca

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

imshow(C);