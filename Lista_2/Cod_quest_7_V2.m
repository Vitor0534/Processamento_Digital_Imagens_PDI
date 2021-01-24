% 7.	Quantifique os planos de cores usando 2 bits e 4 bits visualize 
%o efeito das operações.


%para realizar esta operação será necessário limitar a representação de uma
%imagem a um intervalo fixo de representação de corers. Deste modo, para 2
%bits, se tem um intervalo com 4 cores, para 4 bits se tem um intervalo com
%16 cores. para reslizar este processo, seleciona-se para 2bits 4 limiares
%diferentes e para 4 bist 16 limiares diferentes, de modo que seja possível
%representar a imagem original de 255 cores diferents em um intervalo de 4
%e 16 cores.
% Deste modo, a ideia para se limitar uma imagem a esse espaço de cores 
% disponível, foi estabelecer limiares sucessivos de modo que fossem 
% selecionadas 4 cores principais para 2 bits e 16 cores principais para 16
% bits. As imagens resultantes foram limiarizadas utilizando essas cores, de 
% modo a aproximar o máximo do que se espera da imagem original com 2^24 
% cores.
%leitura da imagem
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\img1.jpg');
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

%criando imagens novas, elas que vão receber as cores de acordo com o
%limiar
img2bits=zeros(x,y,k,'uint8');
img4bits=zeros(x,y,k,'uint8');

%definindo limiares e aplicando-os  2bits
for i=1 : x
    for j=1 : y
        
        
        %divisão dos valores em cores com 2bits
        cor=1;
        %limiar para os componentes R
        if(img2(i,j,cor)<= 40 )
            img2bits(i,j,cor)= 0;
        elseif(img2(i,j,cor)> 100 && img2(i,j,cor)<= 150)
            img2bits(i,j,cor)= 100;
        elseif(img2(i,j,cor) > 150 && img2(i,j,cor)<= 204)
            img2bits(i,j,cor)= 150;
        elseif(img2(i,j,cor) > 204)
            img2bits(i,j,cor)= 204;
        end
        
        cor=2;
         %limiar para os componentes G
         if(img2(i,j,cor)<= 40 )
            img2bits(i,j,cor)= 0;
        elseif(img2(i,j,cor)> 100 && img2(i,j,cor)<= 150)
            img2bits(i,j,cor)= 100;
        elseif(img2(i,j,cor) > 150 && img2(i,j,cor)<= 204)
            img2bits(i,j,cor)= 150;
        elseif(img2(i,j,cor) > 204)
            img2bits(i,j,cor)= 204;
        end
        
        cor=3;
         %limiar para os componentes B
        if(img2(i,j,cor)<= 40 )
            img2bits(i,j,cor)= 0;
        elseif(img2(i,j,cor)> 100 && img2(i,j,cor)<= 150)
            img2bits(i,j,cor)= 100;
        elseif(img2(i,j,cor) > 150 && img2(i,j,cor)<= 204)
            img2bits(i,j,cor)= 150;
        elseif(img2(i,j,cor) > 204)
            img2bits(i,j,cor)= 204;
        end
        
        %divisão dos valores em cores com 4bits
        cor=1;
        
        %limiar para os componentes R
        if(img2(i,j,cor)<= 16 )
            img4bits(i,j,cor)= 0;
        elseif(img2(i,j,cor)> 16 && img2(i,j,cor)<= 32)
            img4bits(i,j,cor)= 32;
        elseif(img2(i,j,cor) > 32 && img2(i,j,cor)<= 48)
            img4bits(i,j,cor)= 48;
        elseif(img2(i,j,cor) > 48 && img2(i,j,cor)<= 64)
            img4bits(i,j,cor)= 64;
        elseif(img2(i,j,cor) > 64 && img2(i,j,cor)<= 80)
            img4bits(i,j,cor)= 80;
        elseif(img2(i,j,cor) > 80 && img2(i,j,cor)<= 96)
            img4bits(i,j,cor)= 96;
        elseif(img2(i,j,cor) > 96 && img2(i,j,cor)<= 112)
            img4bits(i,j,cor)= 112;
        elseif(img2(i,j,cor) > 112 && img2(i,j,cor)<= 128)
            img4bits(i,j,cor)= 128;
        elseif(img2(i,j,cor) > 128 && img2(i,j,cor)<= 144)
            img4bits(i,j,cor)= 144;
        elseif(img2(i,j,cor) > 144 && img2(i,j,cor)<= 160)
            img4bits(i,j,cor)= 160;
        elseif(img2(i,j,cor) > 160 && img2(i,j,cor)<= 176)
            img4bits(i,j,cor)= 176;
        elseif(img2(i,j,cor) > 176 && img2(i,j,cor)<= 192)
            img4bits(i,j,cor)= 192;
        elseif(img2(i,j,cor) > 192 && img2(i,j,cor)<= 208)
            img4bits(i,j,cor)= 208;
        elseif(img2(i,j,cor) > 208 && img2(i,j,cor)<= 224)
            img4bits(i,j,cor)= 224;
        elseif(img2(i,j,cor) > 224 && img2(i,j,cor)<= 240)
            img4bits(i,j,cor)= 255;
        elseif(img2(i,j,cor) > 240)
            img4bits(i,j,cor)= 255;
        end
        
        %divisão dos valores em cores com 4bits
        cor=2;
        
        %limiar para os componentes G
        if(img2(i,j,cor)<= 16 )
            img4bits(i,j,cor)= 0;
        elseif(img2(i,j,cor)> 16 && img2(i,j,cor)<= 32)
            img4bits(i,j,cor)= 32;
        elseif(img2(i,j,cor) > 32 && img2(i,j,cor)<= 48)
            img4bits(i,j,cor)= 48;
        elseif(img2(i,j,cor) > 48 && img2(i,j,cor)<= 64)
            img4bits(i,j,cor)= 64;
        elseif(img2(i,j,cor) > 64 && img2(i,j,cor)<= 80)
            img4bits(i,j,cor)= 80;
        elseif(img2(i,j,cor) > 80 && img2(i,j,cor)<= 96)
            img4bits(i,j,cor)= 96;
        elseif(img2(i,j,cor) > 96 && img2(i,j,cor)<= 112)
            img4bits(i,j,cor)= 112;
        elseif(img2(i,j,cor) > 112 && img2(i,j,cor)<= 128)
            img4bits(i,j,cor)= 128;
        elseif(img2(i,j,cor) > 128 && img2(i,j,cor)<= 144)
            img4bits(i,j,cor)= 144;
        elseif(img2(i,j,cor) > 144 && img2(i,j,cor)<= 160)
            img4bits(i,j,cor)= 160;
        elseif(img2(i,j,cor) > 160 && img2(i,j,cor)<= 176)
            img4bits(i,j,cor)= 176;
        elseif(img2(i,j,cor) > 176 && img2(i,j,cor)<= 192)
            img4bits(i,j,cor)= 192;
        elseif(img2(i,j,cor) > 192 && img2(i,j,cor)<= 208)
            img4bits(i,j,cor)= 208;
        elseif(img2(i,j,cor) > 208 && img2(i,j,cor)<= 224)
            img4bits(i,j,cor)= 224;
        elseif(img2(i,j,cor) > 224 && img2(i,j,cor)<= 240)
            img4bits(i,j,cor)= 255;
        elseif(img2(i,j,cor) > 240)
            img4bits(i,j,cor)= 255;
        end
        
        %divisão dos valores em cores com 4bits
        cor=3;
        
        %limiar para os componentes B
        if(img2(i,j,cor)<= 16 )
            img4bits(i,j,cor)= 0;
        elseif(img2(i,j,cor)> 16 && img2(i,j,cor)<= 32)
            img4bits(i,j,cor)= 32;
        elseif(img2(i,j,cor) > 32 && img2(i,j,cor)<= 48)
            img4bits(i,j,cor)= 48;
        elseif(img2(i,j,cor) > 48 && img2(i,j,cor)<= 64)
            img4bits(i,j,cor)= 64;
        elseif(img2(i,j,cor) > 64 && img2(i,j,cor)<= 80)
            img4bits(i,j,cor)= 80;
        elseif(img2(i,j,cor) > 80 && img2(i,j,cor)<= 96)
            img4bits(i,j,cor)= 96;
        elseif(img2(i,j,cor) > 96 && img2(i,j,cor)<= 112)
            img4bits(i,j,cor)= 112;
        elseif(img2(i,j,cor) > 112 && img2(i,j,cor)<= 128)
            img4bits(i,j,cor)= 128;
        elseif(img2(i,j,cor) > 128 && img2(i,j,cor)<= 144)
            img4bits(i,j,cor)= 144;
        elseif(img2(i,j,cor) > 144 && img2(i,j,cor)<= 160)
            img4bits(i,j,cor)= 160;
        elseif(img2(i,j,cor) > 160 && img2(i,j,cor)<= 176)
            img4bits(i,j,cor)= 176;
        elseif(img2(i,j,cor) > 176 && img2(i,j,cor)<= 192)
            img4bits(i,j,cor)= 192;
        elseif(img2(i,j,cor) > 192 && img2(i,j,cor)<= 208)
            img4bits(i,j,cor)= 208;
        elseif(img2(i,j,cor) > 208 && img2(i,j,cor)<= 224)
            img4bits(i,j,cor)= 224;
        elseif(img2(i,j,cor) > 224 && img2(i,j,cor)<= 240)
            img4bits(i,j,cor)= 255;
        elseif(img2(i,j,cor) > 240)
            img4bits(i,j,cor)= 255;
        end
        
        
        
     end
end

imshow(img2bits);
title('imagem 2 bits');
figure();

imshow(img4bits);
title('imagem 4 bits');
figure();



%oque foi feito foi uma divisão dos valor de 255 por 4 e por 16, de modo
%que fosse possível identificar o intervalos das cores. também foi feito um
%ajuste manual dos limiares de modo que a imagem ficasse o mais fiel a
%original possível