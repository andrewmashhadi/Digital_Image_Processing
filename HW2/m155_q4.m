% Read image, then display the original image
I = imread('Fig0333(a).tif');
figure()
image(I)
colormap(gray)
title('Original Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Cell array to store the smoothed image for each m-level
I_all = cell(1,4);
I_all{1,1} = I;
i = 2;

% For m = 3, 9, 15 filter the original image using m155_q4_func,
% display it, then store it in cell array
for m = [3, 9, 15]
    I_new = m155_q4_func(I, m);
    figure()
    image(I_new)
    colormap(gray)
    title(['Filtered Image with m = ', num2str(m)])
    set(gca,'xticklabel',[])
    set(gca,'yticklabel',[])
    I_all{1, i} = I_new;
    i = i+1;
end



