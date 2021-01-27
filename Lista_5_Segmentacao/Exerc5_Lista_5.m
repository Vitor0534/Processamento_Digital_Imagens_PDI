%% 5. Para cada imagem utilize a segmentação utilizando o método de médias moveis.  
%% leitura do caminho onde as imagens estão 
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



%% essa função foi baseada nos conteudos disponíveis em (MATHWORK,2020)
%,(GONZALEZ, WOODS, 2010)
% a função aplica um otso de forma globla, buscando dividir a imagem em 2
% seguimentos, fundo e objeto 
%% 
%% função demostrada no livro 
%n: é a quantidade de pontos utilizado nas médias moveis
%B: é uma constante que tem seu valor no intervalo de [0,1]
function g = movingthresh( f1,n , B )
%% segmentação movingthresh usando metodo das médias móveis. 
%    g = movingthresh( f1,n , B ) seguimenta uma imagem F por meio de
%    thresholding de intensidades baseado na media moveis das intensidades
%    ao longe das linhas individuais de uma imagem. A média no pixel B é
%    formada pela media de intensidades do pixel e dos n-1 processametno
%    dos vizinhos. para reduzir efeito bias, o escaneamento é feito em
%    zig-zag, tratanto o pixel ocmo se eles fossem um vetor contínuo de
%    dados 1-D. se o valor de uma imagem no ponto exeder k% de um valor da
%    média em execução naquele ponto, o valor 1 é colocado nessa posição na
%    matrix g. Caso contrário 0 é colocado nessa posição. No final do
%    processo, g é a imagem segmentada. k deve ser um escalar entre 0 e 1;
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
f = f';  % ainda é uma matriz 
f = f ( : )' ; % Converte para um vetor de linha para usar na função filter
%% calcula a media movel
maf = ones ( 1 , n ) / n ; % filtro média movel 1-D
ma = filter( maf , 1 , f ) ; % calculo da medeia movel
%% realiza o thesholding
g = f > B * ma ;
%% volta para o formato original da imagem
g = reshape ( g , N , M )';
% gira as linhas de volta a posição normal 
g (2:2:end , : ) = fliplr (g(2:2:end,:));
        
end

