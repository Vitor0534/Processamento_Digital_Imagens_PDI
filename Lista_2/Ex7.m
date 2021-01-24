% Realiza a leitura da imagem
image = imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 2\img1.jpg');
[linhas , colunas, rgb] = size(image);
image2 = zeros(1, 1, rgb, 'uint8');
image3 = zeros(1, 1, rgb, 'uint8');



% Separa as componentes RGB da imagem
for i = 1:linhas
    for j = 1 : colunas
        
        %Limiar para a componente red
        if(image(i,j,1)<= 51 )
            image2(i,j,1)= 0;
        elseif(image(i,j,1)> 102 && image(i,j,1)<= 153)
            image2(i,j,1)=102;
        elseif(image(i,j,1) > 153 && image(i,j,1)<= 204)
            image2(i,j,1)=153;
        elseif(image(i,j,1) > 204)
            image2(i,j,1)=204;
        end
        
        % Limiar para a componente green
        if(image(i,j,2)<= 51 )
            image2(i,j,2)= 0;
        elseif(image(i,j,2)> 102 && image(i,j,2)<= 153)
            image2(i,j,2)=102;
        elseif(image(i,j,2) > 153 && image(i,j,2)<= 204)
            image2(i,j,2)=153;
        elseif(image(i,j,2) > 204)
            image2(i,j,2)=204;
        end


        % Limiar para a componente blue
        if(image(i,j,3)<= 51 )
            image2(i,j,3)= 0;
        elseif(image(i,j,3)> 102 && image(i,j,3)<= 153)
            image2(i,j,3)=102;
        elseif(image(i,j,3) > 153 && image(i,j,3)<= 204)
            image2(i,j,3)=153;
        elseif(image(i,j,3) > 204)
            image2(i,j,3)=204;
        end

    end
end


for i = 1:linhas
    for j = 1 : colunas
        
        % Limiar para a componente red
        if(image(i,j,1)<= 16 )
            image3(i,j,1)=0;
        elseif(image(i,j,1) > 16 && image(i,j,1)<= 32)
            image3(i,j,1)=32;
        elseif(image(i,j,1) > 32 && image(i,j,1)<= 48)
            image3(i,j,1)=48;
        elseif(image(i,j,1) > 48 && image(i,j,1)<= 64)
            image3(i,j,1)=64;
        elseif(image(i,j,1) > 64 && image(i,j,1)<= 80)
            image3(i,j,1)=80;
        elseif(image(i,j,1) > 80 && image(i,j,1)<= 96)
            image3(i,j,1)=96;
        elseif(image(i,j,1) > 96 && image(i,j,1)<= 112)
            image3(i,j,1)=112;
        elseif(image(i,j,1) > 112 && image(i,j,1)<= 128)
            image3(i,j,1)=128;
        elseif(image(i,j,1) > 128 && image(i,j,1)<= 144)
            image3(i,j,1)=144;
        elseif(image(i,j,1) > 144 && image(i,j,1)<= 160)
            image3(i,j,1)=160;
        elseif(image(i,j,1) > 160 && image(i,j,1)<= 176)
            image3(i,j,1)=176;
        elseif(image(i,j,1) > 176 && image(i,j,1)<= 192)
            image3(i,j,1)=192;
        elseif(image(i,j,1) > 192 && image(i,j,1)<= 208)
            image3(i,j,1)=208;
        elseif(image(i,j,1) > 208 && image(i,j,1)<= 224)
            image3(i,j,1)=224;
        elseif(image(i,j,1) > 224 && image(i,j,1)<= 240)
            image3(i,j,1)=240;
        elseif(image(i,j,1) > 240)
            image3(i,j,1)=255;     
        end
        
  
        
        % Limiar para a componente red
        if(image(i,j,2)<= 16 )
            image3(i,j,2)=0;
        elseif(image(i,j,2) > 16 && image(i,j,2)<= 32)
            image3(i,j,2)=32;
        elseif(image(i,j,2) > 32 && image(i,j,2)<= 48)
            image3(i,j,2)=48;
        elseif(image(i,j,2) > 48 && image(i,j,2)<= 64)
            image3(i,j,2)=64;
        elseif(image(i,j,2) > 64 && image(i,j,2)<= 80)
            image3(i,j,2)=80;
        elseif(image(i,j,2) > 80 && image(i,j,2)<= 96)
            image3(i,j,2)=96;
        elseif(image(i,j,2) > 96 && image(i,j,2)<= 112)
            image3(i,j,2)=112;
        elseif(image(i,j,2) > 112 && image(i,j,2)<= 128)
            image3(i,j,2)=128;
        elseif(image(i,j,2) > 128 && image(i,j,2)<= 144)
            image3(i,j,2)=144;
        elseif(image(i,j,2) > 144 && image(i,j,2)<= 160)
            image3(i,j,2)=160;
        elseif(image(i,j,2) > 160 && image(i,j,2)<= 176)
            image3(i,j,2)=176;
        elseif(image(i,j,2) > 176 && image(i,j,2)<= 192)
            image3(i,j,2)=192;
        elseif(image(i,j,2) > 192 && image(i,j,2)<= 208)
            image3(i,j,2)=208;
        elseif(image(i,j,2) > 208 && image(i,j,2)<= 224)
            image3(i,j,2)=224;
        elseif(image(i,j,2) > 224 && image(i,j,2)<= 240)
            image3(i,j,2)=240;
        elseif(image(i,j,2) > 240)
            image3(i,j,2)=255;
        end
        
        
        % Limiar para a componente blue
        if(image(i,j,3)<= 16 )
            image3(i,j,3)=0;
        elseif(image(i,j,3) > 16 && image(i,j,3)<= 32)
            image3(i,j,3)=32;
        elseif(image(i,j,3) > 32 && image(i,j,3)<= 48)
            image3(i,j,3)=48;
        elseif(image(i,j,3) > 48 && image(i,j,3)<= 64)
            image3(i,j,3)=64;
        elseif(image(i,j,3) > 64 && image(i,j,3)<= 80)
            image3(i,j,3)=80;
        elseif(image(i,j,3) > 80 && image(i,j,3)<= 96)
            image3(i,j,3)=96;
        elseif(image(i,j,3) > 96 && image(i,j,3)<= 112)
            image3(i,j,3)=112;
        elseif(image(i,j,3) > 112 && image(i,j,3)<= 128)
            image3(i,j,3)=128;
        elseif(image(i,j,3) > 128 && image(i,j,3)<= 144)
            image3(i,j,3)=144;
        elseif(image(i,j,3) > 144 && image(i,j,3)<= 160)
            image3(i,j,3)=160;
        elseif(image(i,j,3) > 160 && image(i,j,3)<= 176)
            image3(i,j,3)=176;
        elseif(image(i,j,3) > 176 && image(i,j,3)<= 192)
            image3(i,j,3)=192;
        elseif(image(i,j,3) > 192 && image(i,j,3)<= 208)
            image3(i,j,3)=208;
        elseif(image(i,j,3) > 208 && image(i,j,3)<= 224)
            image3(i,j,3)=224;
        elseif(image(i,j,3) > 224 && image(i,j,3)<= 240)
            image3(i,j,3)=240;
        elseif(image(i,j,3) > 240)
            image3(i,j,3)=255;
        end
    end
end


% Impressão das imagens
subplot(1,3,1);
imshow(image);
title('Original');


subplot(1,3,2);
imshow(image2);
title('Imagem 2 bits');

subplot(1,3,3);
imshow(image3);
title('Imagem 4 bits');

