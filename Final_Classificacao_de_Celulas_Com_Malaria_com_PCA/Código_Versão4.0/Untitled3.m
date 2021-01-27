l = size(img_e, 2);
close all;
for i = 1: l
    c = img_e(i);
    c = c{1};
    c = strcat(path,'\',c);

    c1 = img_a(i);
    c1 = c1{1};
    c1 = strcat(path,'\',c1);
    
    figure;
    
    subplot(1, 2, 1);
    imshow(PDI(imread(c)));
    b = split(img_e(i), '\');
    title(b(2));   
    
    subplot(1, 2, 2);
    imshow(PDI(imread(c1)));
    b = split(img_a(i), '\');
    title(b(2));   
    
    
    if mod(i,10) == 0
       input('...'); 
               close all

    end
    
end