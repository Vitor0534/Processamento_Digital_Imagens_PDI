%% 5. Para cada imagem utilize a segmenta��o utilizando o m�todo de m�dias moveis.  
%% leitura do caminho onde as imagens est�o 
images ='folhas';
jpgfiles=dir(fullfile(images,'\*.jpg*'));
n=numel(jpgfiles);

%% aplicando o metodo de otsu em todas as imagens da base
for i=8:n
    nomeImg=jpgfiles(i).name;
    img1=imread(fullfile(images,nomeImg));
    
    %subplot(n,1,i);
    imshow(img1);
    title('imagem original Nimg= ' + string(i));
    figure();
    
    %subplot(n,1,i+1);
    imgGray= rgb2gray(img1);
    img2out=zeros(size(img1,1),size(img1,2),3);
    %%muda esses valores de n e B
    img2out(:,:,1)= movingthresh( img1(:,:,1), 50,0.734); 
    img2out(:,:,2)= movingthresh( img1(:,:,2), 50,0.734);
    img2out(:,:,3)= movingthresh( img1(:,:,3), 50,0.734); 
    
    %% mostra a imagem resultante
    %subplot(n,1,i+2);
    imshow(img2out);
    title('imagem resultante, Nimg= ' + string(i));
    figure();
end 
%% 



%% essa fun��o foi baseada nos conteudos dispon�veis em (MATHWORK,2020)
%,(GONZALEZ, WOODS, 2010)
% a fun��o aplica um otso de forma globla, buscando dividir a imagem em 2
% seguimentos, fundo e objeto 
%% 
%% fun��o demostrada no livro 
%n: � a quantidade de pontos utilizado nas m�dias moveis
%B: � uma constante que tem seu valor no intervalo de [0,1]
function g = movingthresh( f1,n , B )
%% segmenta��o movingthresh usando metodo das m�dias m�veis. 
%    g = movingthresh( f1,n , B ) seguimenta uma imagem F por meio de
%    thresholding de intensidades baseado na media moveis das intensidades
%    ao longe das linhas individuais de uma imagem. A m�dia no pixel B �
%    formada pela media de intensidades do pixel e dos n-1 processametno
%    dos vizinhos. para reduzir efeito bias, o escaneamento � feito em
%    zig-zag, tratanto o pixel ocmo se eles fossem um vetor cont�nuo de
%    dados 1-D. se o valor de uma imagem no ponto exeder k% de um valor da
%    m�dia em execu��o naquele ponto, o valor 1 � colocado nessa posi��o na
%    matrix g. Caso contr�rio 0 � colocado nessa posi��o. No final do
%    processo, g � a imagem segmentada. k deve ser um escalar entre 0 e 1;
%% Preliminares.
f = im2double(f1) ;
[M, N] = size(f) ;
if ( n < 1 ) || (rem(n, 1) ~= 0 )
    error( ' n must be an integer > = 1 . ' );
end
if (B < 0 || B > 1)
    error ( ' K must be a fraction in the range [ O , 1 ] . ' )
end
%% Gira todas as linhas de um imagem f para processar o equivalente ao
% zig-zag
f(2:2:end,:) = fliplr( f( 2 : 2 : end , : ) ) ;
f = f';  % ainda � uma matriz 
f = f ( : )' ; % Converte para um vetor de linha para usar na fun��o filter
%% calcula a media movel
maf = ones ( 1 , n ) / n ; % filtro m�dia movel 1-D
ma = filter( maf , 1 , f ) ; % calculo da medeia movel
%% realiza o thesholding
g = f > B * ma ;
%% volta para o formato original da imagem
g = reshape ( g , N , M )';
% gira as linhas de volta a posi��o normal 
g (2:2:end , : ) = fliplr (g(2:2:end,:));
        
end

