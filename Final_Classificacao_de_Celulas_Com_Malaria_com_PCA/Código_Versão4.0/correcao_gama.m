function imagem = correcao_gama(img, gama, c)
    [i j k] = size(img);
    
    imagem = zeros(i, j, k, 'double');
    
    for x = 1: i
       for y = 1: j
           imagem(x, y, :) = c*(double(img(x, y, :)).^double(gama));
       end
    end
end