% Read in the input image and display
f = imread('Fig4.45(a).jpg');
figure()
image(f)
colormap(gray)
title('Original Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

[ROWS, COLS] = size(f);
f = double(f);
f_shifted = zeros(ROWS, COLS);

% Multiply f by (-1)^(x+y) to shift the center 
for i = 1:ROWS
   for j = 1:COLS
         x_plus_y=(i-1)+(j-1);
         f_shifted(i,j)=f(i,j)*(-1)^x_plus_y;
   end
end

% Compute the centered DFT
F = fft2(f_shifted);

% Create H
H = zeros(ROWS, COLS);
% Create function handle used in loops to create filter, H
D = @(u,v) sqrt((u-(ROWS/2))^2 + (v-(COLS/2))^2);

for u = 0:ROWS-1              
   for v = 0:COLS-1
         P = -(D(u,v))^2 / (2*(25^2));
         H(u+1,v+1) = 1 - exp(P);
   end
end

% Apply filter H to F, for G
G = H.*F;

% Compute the inverse discrete fourier transform
g = ifft2(G);

% Find the real values and re-center values
g = real(g);
for n = 1:ROWS
   for m = 1:COLS
         xplusy=(n-1)+(m-1);
         g(n,m)=g(n,m)*(-1)^xplusy;
   end
end

% Display Highpass filtered image
g = uint8(round(g));
figure()
image(g)
colormap(gray)
title('Highpass Filtered Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])