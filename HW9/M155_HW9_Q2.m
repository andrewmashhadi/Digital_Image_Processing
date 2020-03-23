% Download and display original image
f = imread('Fig5.26a.jpg');
figure()
image(f)
colormap(gray)
title('Original Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Part (b)
% Motion blur the image 
a = 0.1;
b = 0.1;
T = 1;
f_blur = Motion_Blur(f, a, b, T);

% Display motion blurred image
figure()
image(f_blur)
colormap(gray)
title('Motion Blurred Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Part (c)
% Add Gaussian white noise to the blurred image
v = 0.01;
g = imnoise(f_blur,'gaussian',0, v);

% Display blurred and noised image
figure()
image(g)
colormap(gray)
title('Motion Blurred Image with Gaussian White Noise')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Part (d)
% Restore image using Parametric Wiener Filter
% Using trial and error, we chose k = 0.05 for the best visual results
f_hat = Parametric_Wiener(g, a, b, T, 0.05);     

% Display restored image
figure()
image(f_hat)
colormap(gray)
title('Restored Image using Parametric Wiener Filter')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
