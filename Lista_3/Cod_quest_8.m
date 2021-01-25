%8.	Utilize a máscara da questão 4, Tam igual á 10, na função imfilter,
%com os padding symmetric, replicate, circular. Explique a diferença de
%cada um deles. 

%leitura da imagem
img1=imread('img3.jpg');
imshow(img1(:,:,:));
title('imagem original');
figure();

Tam = 10; 
Mascara = 1/(Tam*Tam) * ones(Tam,Tam); 

imgFiltred1= imfilter(img1,Mascara,'circular');
imshow(imgFiltred1(:,:,:));
title('img filtrada Tam=10, padding');
figure();

imgFiltred2= imfilter(img1,Mascara,'symmetric');
imshow(imgFiltred2(:,:,:));
title('img filtrada Tam=10, symmetric');
figure();

imgFiltred3= imfilter(img1,Mascara,'replicate');
imshow(imgFiltred3(:,:,:));
title('img filtrada Tam=10, replicate');
figure();



