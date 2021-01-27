function [L, Num, mask, img_media] = superpixel(I, N)
    [L, Num] = superpixels(I, N);
    mask = boundarymask(L);
    
    
    % Mostra as iamgens com a cor média em cada superpixel
    img_media = zeros(size(I),'like',I);
    
    idx = label2idx(L);

    [i, j, r] = size(I);
    
    for l = 1:Num
        r_idx = idx{l};
        g_idx = idx{l}+i*j;
        b_idx = idx{l}+2*i*j;
        img_media(r_idx) = mean(I(r_idx));
        img_media(g_idx) = mean(I(g_idx));
        img_media(b_idx) = mean(I(b_idx));
    end
    
end