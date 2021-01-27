% 7.	Execute a questão 2 mas a imagem resultante deve ser colorida. 

%leitura da imagem
img1=imread('img1.jpg');
imshow(img1(:,:,:));
title('imagem original');
figure();

[x,y,z] = size(img1);

% rgb2gray(img1) não é necessário converter a imagem para cinza

imgGray = img1(:,:,:);


%imgfft = fft2(imgGray);
imgfft=zeros(x,y,z,'double');
imgfft(:,:,1) = fft2(imgGray(:,:,1));
imgfft(:,:,2) = fft2(imgGray(:,:,2));
imgfft(:,:,3) = fft2(imgGray(:,:,3));


%imgfftShift = fftshift(imgfft);
imgfftShift=zeros(x,y,z,'double');
imgfftShift(:,:,1) = fftshift(imgfft(:,:,1));
imgfftShift(:,:,2) = fftshift(imgfft(:,:,2));
imgfftShift(:,:,3) = fftshift(imgfft(:,:,3));

%gerando mascara de filtro circular ideal passa baixa
Do=100; %diametro do circulo
masck = ideal_low_Pass_Circular_masck(img1,Do);

imshow(masck(:,:,:).*255);
title("mascara filtro passa-baixa ideal circular");
figure();

%realizando filtragem da imagem em magnitude de frequência em R, G e B
%imgFiltred(:,:,:) = imgfftShift(:,:,:) .* masck;
imgFiltred=zeros(x,y,z,'double');
imgFiltred(:,:,1) = imgfftShift(:,:,1) .* masck;
imgFiltred(:,:,2) = imgfftShift(:,:,2) .* masck;
imgFiltred(:,:,3) = imgfftShift(:,:,3) .* masck;

imshow(log(abs(imgFiltred(:,:,1))),[]);
title('maginitude da imagem filtrada R');
figure();

imshow(log(abs(imgFiltred(:,:,2))),[]);
title('maginitude da imagem filtrada G');
figure();

imshow(log(abs(imgFiltred(:,:,3))),[]);
title('maginitude da imagem filtrada B');
figure();

%voltando imagem para o domínio do tempo
%imgFiltred_temp=uint8( abs ( ifft2(fftshift(imgFiltred (:,:,:)) ) ));
imgFiltred_temp=zeros(x,y,z,'uint8');
imgFiltred_temp(:,:,1)=uint8( abs ( ifft2(fftshift(imgFiltred (:,:,1)) ) ));
imgFiltred_temp(:,:,2)=uint8( abs ( ifft2(fftshift(imgFiltred (:,:,2)) ) ));
imgFiltred_temp(:,:,3)=uint8( abs ( ifft2(fftshift(imgFiltred (:,:,3)) ) ));

%imgFiltred_temp=uint8( ifft2(fftshift(imgFiltred) ));

imshow(imgFiltred_temp);
title('imagem filtrada ideal low pass Do=' + string(Do));
figure();


%gerando mascara de filtro circular ideal passa baixa
%essa função foi baseada nas equaçãoes expostas em 
%(GONZALEZ, WOODS, 2010)pág 176
function masck = ideal_low_Pass_Circular_masck (img1,Do)

[x,y,~] = size(img1);

masck = zeros(x,y,'double');
% Do é o diâmentro do circulo, freq de corte
for i=1: x
    for j=1:y
        if( (( (i- x/2)^2 + (j - y/2)^2 )^(1/2)) <=Do)
            masck(i,j)=1;
        end
    end
end

end