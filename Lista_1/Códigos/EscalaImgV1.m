%5. Aplique a operação de aumento de escala da imagem.

%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 1\edward.png');


img2=img;
%img2=img;
imshow(img2(:,:,:));
title('imagem original');
figure();

escalaX=2;
escalaY=2;
[xo yo k] = size(img2);

%para correção do ponto preto em matriz não quadrada
%pega a posição atual de C, divide x e y pela escala e pega essa posição na
%imagem A para preencher o ponto preto na imagem C

imgNova= uint8(zeros([escalaX*xo escalaY*yo 3 ]));

%não é necessário realizar a verificação de fora da img por conta que o
%tamanho vai ser aumentado linearmente
for i=1: xo
    for j=1: yo
        x=escalaX*i;
        y=escalaY*j;
        imgNova(x,y,:)=img2(i,j,:);
    end
end

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



% for i=1: X1
%      for j=1: Y1
%          if( imgNova(i,j,:)==0)
%              if(j>1)
%                  imgNova(i,j,:)=imgNova(i,j-1,:);
%              else
%                  if(j<Y1)
%                      imgNova(i,j,:) = imgNova(i,j+1,:);
%                  end
%              end
%          end
%      end
% end
% 
% for j=1: Y1
%      for i=1: X1
%          if( imgNova(i,j,:)==0)
%              if(i>1)
%                  imgNova(i,j,:)=imgNova(i-1,j,:);
%              else
%                  if(i<X1)
%                      imgNova(i,j,:) = imgNova(i+1,j,:);
%                  end
%              end
%          end
%      end
% end

imshow(imgNova(:,:,:));
title('imagem com escala');
figure();