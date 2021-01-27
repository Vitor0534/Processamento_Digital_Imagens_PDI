% 6.	Refa�a quest�o 2 com uma m�scara retangular, dimens�es a sua escolha. 
% Explique a diferen�a visual com a imagem resultante da quest�o 2. 

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
Dl=200; %Altura do quadrado em linhas
Dc=400;  %Largura do retangulo em colunas 
masck = ideal_low_Pass_rect_masck(img1,Dl,Dc);

imshow(masck(:,:,:).*255);
title("mascara filtro passa-baixa ideal retangular Dl=" + string(Dl)+ " x Dc=" +string(Dc));
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
title('imagem filtrada ideal low pass retagular Dl=' + string(Dl)+ ' x Dc=' +string(Dc));
figure();


%gerando mascara de filtro circular ideal passa alta
%essa fun��o foi baseada nas equa��oes expostas em 
%(GONZALEZ, WOODS, 2010)p�g 184
%Dl e Dc s�o as dimes�es do retangulo em linhas por colunas respectivamente
function masck = ideal_low_Pass_rect_masck(img1,Dl,Dc)

[x,y,~] = size(img1);

masck = zeros(x,y,'double');
% Dx1 e Dx2 s�o o calculo da altura do retangulo em rela��o a origem
% Dy1 e Dy2 s�o o calculo da largura do retangulo em rela��o a origem
Dx1= round( (x/2)-(Dl/2) );
Dx2= round( (x/2)+(Dl/2) );
Dy1= round( (y/2)-(Dc/2) );
Dy2= round( (y/2)+(Dc/2) );

%construindo a mascara retangular 
for i= Dx1:Dx2
    for j= Dy1:Dy2
            masck(i,j)=1;
    end
end
end