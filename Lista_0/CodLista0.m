%0) lendo e mostrando uma imagem do disco
img=imread('C:\Users\Vitor\Desktop\faculdade\9 nono periodo\PDI\Lista 0\Naruto.jpg');
imshow(img(:,:,:));
figure();

% %1) mostrando elemento R,G e B da imagem
% imshow(img(:,:,1)); %R
% figure();
% imshow(img(:,:,2)); %G
% figure();
% imshow(img(:,:,3)); %B
% figure();
% 
% %2) trocando os compenente R e G
% %para trocar estes elemento basta concatenas os vetores 1 e 3
% % da imagem utilizando a função cat
% %a função cat permite se escolher uma das dimenções para concatenar
% %em linha(1), coluna(2) ou ambas(3) 
% 
% imgGR= cat(3,img(:,:,2),img(:,:,1),img(:,:,3) );
% imshow(imgGR);
% figure();
% 
% %3)preencher de zeros os componentes:
%   %-- preencha de zero a matriz correspondente 
%   %   ao componente verde e azul e mostre a imagem.
%   imgGB= img;
%   imgGB(:,:,2)=0;
%   imgGB(:,:,3)=0;
%   imshow(imgGB);
%   figure();
%   
%   %-- elementos R e B
%   imgRB= img;
%   imgRB(:,:,1)=0;
%   imgRB(:,:,3)=0;
%   imshow(imgRB);
%   figure();
%   
%   %-- elementos R e G
%   imgRB= img;
%   imgRB(:,:,1)=0;
%   imgRB(:,:,2)=0;
%   imshow(imgRB);
%   figure();

%4) convertes imagens para espaços de cores diferentes

% %RGB para HSV
% imgHSV= rgb2hsv(img);
% imshow(imgHSV);
% figure();
% 
% %RGB para Cielab
% imgLab= rgb2lab(img);
% imshow(imgLab);
% figure();
% 
% %escala de cinza
% imgGray= rgb2gray(img);
% imshow(imgGray);
% figure();

%5. Torne a imagem de entrada mais clara ou mais escura.

%imagem mais clara
% imgClara=img;
% for i=1: 326
%     for j=1 : 433
%         imgClara(i,j,:)= imgClara(i,j,:) + 150;
%     end
% end
% imshow(imgClara);
% figure();
% 
% %imagem mais escura
% imgEscura = img;
% for i=1: 326
%     for j=1 : 433
%         imgEscura(i,j,:)= imgEscura(i,j,:) - 150;
%     end
% end
% imshow(imgEscura);
% figure();
 
%6. Reduza o tamanho da imagem pela metade. Rotacione a 
%imagem original em 180°. Utilize os comandos imresize e imrotate.

%sintaxe da função B = imresize(A,scale)

%reduzindo a imagem pela metade
% imgMetade=imresize(img,1/2);
% imshow(imgMetade);
% figure();
% 
% %rotacionando a imagem em 180 degrees
% img180=imrotate(img,180);
% imshow(img180);
% figure();
 