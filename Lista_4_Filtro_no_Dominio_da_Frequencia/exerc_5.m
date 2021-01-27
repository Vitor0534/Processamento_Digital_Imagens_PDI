% 5.	Utilize a imagem resultante na quest�o 4 e refa�a-a quest�o com ela,
% explique se teve alguma diferen�a, e mostre a magnitude antes de aplicar
% a m�scara de novo. Volte a imagem para o dom�nio do tempo e mostre o 
% resultado. 

%leitura da imagem
img1=imread('imgQ5.jpg');
imshow(img1(:,:,:));
title('imagem original');
figure();

[x,y,z] = size(img1);

% n�o se usa rgb2gray(img1) porque a imagem j� esta em escala de cinza
imgGray = img1;  

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


%realizando filtragem da imagem em magnitude de frequ�ncia
imgFiltred = imgfftShift .* masck;

imshow(log(abs(imgFiltred)),[]);
title('maginitude da imagem filtrada');
figure();

%voltando imagem para o dom�nio do tempo
imgFiltred_temp=uint8( abs ( ifft2(fftshift(imgFiltred) ) ));
%imgFiltred_temp=uint8( ifft2(fftshift(imgFiltred) ));

imshow(imgFiltred_temp);
title('imagem filtrada ideal hight pass Do=' + string(Do));
figure();





%gerando mascara de filtro circular ideal passa alta
%essa fun��o foi baseada nas equa��oes expostas em 
%(GONZALEZ, WOODS, 2010)p�g 184
function masck = ideal_hight_Pass_Circular_masck (img1,Do)

[x,y,~] = size(img1);

masck = zeros(x,y,'double');
% Do � o di�mentro do circulo, freq de corte
for i=1: x
    for j=1:y
        if( (( (i- x/2)^2 + (j - y/2)^2 )^(1/2)) >Do)
            masck(i,j)=1;
        end
    end
end

end