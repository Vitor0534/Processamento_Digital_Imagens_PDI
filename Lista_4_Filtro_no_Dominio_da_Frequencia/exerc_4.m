% 4.	Carregue a imagem transforme em escala de cinza e execute a
% transformada, e em seguida crie uma máscara circular e aplique direto 
% na magnitude da imagem escolhida para que seja executa a passa-alta ideal.
% Volte a imagem para o domínio do tempo e mostre e comente o resultado. 


%leitura da imagem
img1=imread('img1.jpg');
imshow(img1(:,:,:));
title('imagem original');
figure();

[x,y,z] = size(img1);

imgGray = rgb2gray(img1);

imshow(imgGray(:,:,:));
title('imagem em escala de cinza');
figure();

imgfft = fft2(imgGray);

imgfftShift = fftshift(imgfft);

imshow(log(abs(imgfftShift)),[]);
title('magnitude da imagem');
figure();

%gerando mascara de filtro circular ideal passa alta
Do=100; %diametro do circulo
masck = ideal_hight_Pass_Circular_masck(img1,Do);

imshow(masck(:,:,:).*255);
title("mascara filtro passa-alta ideal circular");
figure();


%realizando filtragem da imagem em magnitude de frequência
imgFiltred = imgfftShift .* masck;

imshow(log(abs(imgFiltred)),[]);
title('maginitude da imagem filtrada');
figure();

%voltando imagem para o domínio do tempo
imgFiltred_temp=uint8( abs ( ifft2(fftshift(imgFiltred) ) ));
%imgFiltred_temp=uint8( ifft2(fftshift(imgFiltred) ));

imshow(imgFiltred_temp);
title('imagem filtrada ideal hight pass Do=' + string(Do));
figure();

imwrite(imgFiltred_temp,'imgQ5.jpg');



%gerando mascara de filtro circular ideal passa alta
%essa função foi baseada nas equaçãoes expostas em 
%(GONZALEZ, WOODS, 2010)pág 184
function masck = ideal_hight_Pass_Circular_masck (img1,Do)

[x,y,z] = size(img1);

masck = zeros(x,y,'double');
% Do é o diâmentro do circulo, freq de corte
for i=1: x
    for j=1:y
        if( (( (i- x/2)^2 + (j - y/2)^2 )^(1/2)) >Do)
            masck(i,j)=1;
        end
    end
end

end