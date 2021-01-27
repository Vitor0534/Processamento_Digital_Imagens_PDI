% 3.	Carregue a imagem transforme em escala de cinza e execute a
% transformada, e em seguida crie a m�scara Butterworth (D0= 180 e N=2) e
% aplique direto na magnitude da imagem escolhida. Volte a imagem para o
% dom�nio do tempo e mostre o resultado. 

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

%gerando mascara de filtro circular ideal passa baixa
Do=180; %diametro do circulo
n=2;    %ordem do filtro
masck = Butterworth_low_Pass_masck (img1,Do,n);

imshow(masck,[]);
title("mascara filtro butterworth passa-baixa ");
figure();


%realizando filtragem da imagem em magnitude de frequ�ncia
imgFiltred = imgfftShift .* masck;

imshow(log(abs(imgFiltred)),[]);
title('maginitude da imagem filtrada');
figure();

%voltando imagem para o dom�nio do tempo
imgFiltred_temp=uint8( abs ( ifft2(fftshift(imgFiltred) ) ));


imshow(imgFiltred_temp);
title('imagem filtrada BLPF com Do=' + string(Do)+' e n=' + string(n));
figure();




%gerando mascara de filtro circular ideal passa baixa
%essa fun��o foi baseada nas equa��oes expostas em 
%(GONZALEZ, WOODS, 2010)p�g 176
function masck = Butterworth_low_Pass_masck (img1,Do,n)

[x,y,~] = size(img1);

masck = zeros(x,y,'double');
% Do � o di�mentro do circulo, freq de corte
% Duv distancia entre o ponto e o centro
% para transi��es suaves masck(i,j) = (50% de 1) quando Duv=Do
for i=1: x
    for j=1:y
        Duv = (((i- x/2)^2 + (j - y/2)^2 )^(1/2));
        if( Duv == Do)
            masck(i,j)= 1*0.5;
        else
            masck(i,j)= 1/ ( 1+ ( Duv/Do)^(2*n) );
        end
        
    end
end

end
