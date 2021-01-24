function [ imgNova ] = reduz_Escala_Metade(img2)

escalaX=1/2; %configurado para retornar a metada da escala
escalaY=1/2;
[xo yo k] = size(img2);
imgNova=uint8(zeros([round(xo*escalaX) round(yo*escalaY) 3 ]));

for i=1: xo
    for j=1: yo
        x=ceil(escalaX*i);
        y=ceil(escalaY*j);
        imgNova(x,y,:)=img2(i,j,:);
    end
end

end

