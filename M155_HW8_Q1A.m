% Download and display original Image
f = imread('Fig5.07(a).jpg');
figure()
image(f)
colormap(gray); 
title('Original Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Download and display image curropted by Gaussian Noise
g = imnoise(f,'gaussian',0,0.01);
f = double(f);
figure()
image(g)
colormap(gray); 
title('Corrupted Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
g = double(g);

% Calculating the SNR before denoising
A = sum(g.^2, 'all');
B = sum((f-g).^2, 'all');
SNR_before = 10*log10(A/B);
disp('The Signal-to-Noise-Ratio before denoising is: ');
SNR_before

[rows, cols] = size(g);
f_hat = g;          
% 3x3 sub-image
m = 3;
a = (m-1)/2;
b = (m-1)/2;
w = 1/(m^2);

% Go through and apply the filter to each element in image matrix, except the borders.
for i = (1+a):(rows-a)
     for j = (1+b):(cols-b)   
        % Find the neighborhood sub-matrix
        Neighborhood = g((i-a):(i+a), (j-b):(j+b));
        % Set this element of the restored image to the local mean 
        f_hat(i ,j) = w * sum(Neighborhood, 'all');
    end
end

f_hat = round(f_hat);
f_hat = uint8(f_hat);

figure()
image(f_hat)
colormap(gray); 
title('3x3 Arithmetic Mean Filtering of Corrupted Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Calculating the SNR after denoising
f_hat = double(f_hat);
A = sum(f_hat.^2, 'all');
B = sum((f-f_hat).^2, 'all');
SNR_after = 10*log10(A/B);
disp('The Signal-to-Noise-Ratio after denoising is: ');
SNR_after
