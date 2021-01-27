function imagem = otsu(img)
    % img -> Imagem em escala de cinza
    
    % Encontra o melhor valor de k
    % Baseado no histograma da imagem
    l = graythresh(img);
    l = l * 255;        % Converte para o intervalo 0 a 255
 
    % Caso a imagem não esteja na escala de cinza
    if(size(img, 3) == 3)
        img = rgb2gray(img); 
    end
        
    % Gera uma mascara
    % img_cinza < l limiarização da imagem
    imagem = uint8(img > l);
    
end
