I = imread('Fig3.08(a).jpg');

% Call either function implemented from part (b).
[I_new, s] = q4_b_func(I, 256);   

% Plot s = T(r)
figure()
plot(0:255, s, 'Linewidth',3)
title('Histogram Equalization Function T(r)')
xlabel('r (Intensity Values)')
ylabel('s (Transformed Intensity Values)')

% Plot orginal image histogram using function from part (a) and display
% original image.
q4_a_func(I);
title('Original Image Histogram')
xlabel('r (Intensity Values)')
ylabel('h(r)')

figure()
image(I)
colormap(gray)
title('Original Image')

I_new = round(I_new);
I_new = uint8(I_new);

% Plot equalized image histogram using function from part (a) and display
% equalized image.
q4_a_func(I_new); 
title('Equalized Image Histogram (Enhanced Image Histogram)')
xlabel('s (Intensity Values)')
ylabel('h(s)')


figure()
image(I_new)
colormap(gray)
title('Transformed/Enhanced Image')

