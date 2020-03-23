% **************** Part (b) ******************

f = imread('Fig5.26a.jpg');

% Download image
figure()
image(f)
colormap(gray)
title('Original Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

[ROWS, COLS] = size(f);
f = double(f);


A = 200;
u_0 = 0.25;
v_0 = 0;

% Add sinusoidal noise
g = f + Sinusoidal_Noise(f, A, u_0, v_0);

% **************** Part (c) ******************

% Display degraded image
figure()
image(g)
colormap(gray)
title('Degraded Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

g_shifted = zeros(ROWS, COLS);
% Multiply g by (-1)^(x+y) to shift the center 
for i = 1:ROWS
   for j = 1:COLS
         x_plus_y=(i-1)+(j-1);
         g_shifted(i,j)=g(i,j)*(-1)^x_plus_y;
   end
end

% Compute the centered DFT
G = fft2(g_shifted);

% Compute the spectum 
G_spec = abs(G);

% Apply log transform for visualization purposes
G_spec_rescaled = zeros(ROWS, COLS);
for i = 1:ROWS
    for j = 1:COLS
        G_spec_rescaled(i,j)=5*log(1+G_spec(i,j));
    end
end
MAX = max(G_spec_rescaled, [], 'all');
MIN = min(G_spec_rescaled, [], 'all');
G_spec_rescaled = 255 * (G_spec_rescaled - MIN)./(MAX - MIN);
G_spec_rescaled = uint8(round(G_spec_rescaled));

% Display Spectrum
G_spec_rescaled = uint8(round(G_spec_rescaled));
figure()
image(G_spec_rescaled) 
colormap(gray) 
title('Spectrum of Degraded Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% **************** Part (d) ******************

% Using gaussian highpass filters about notch-pair
H_k = Gaussian_Highpass(G, ROWS*u_0, COLS*v_0);
H_minusk = Gaussian_Highpass(G, ROWS*(-u_0), COLS*(-v_0));
H_NR = H_k.*H_minusk;
G_filtered = G.*H_NR;

% Find the inverse Fourier Transform
g_filtered = ifft2(G_filtered);

% Find the real values and re-center values
g_filtered = real(g_filtered);
for n = 1:ROWS
   for m = 1:COLS
         xplusy=(n-1)+(m-1);
         g_filtered(n,m)=g_filtered(n,m)*(-1)^xplusy;
   end
end

% Display Highpass filtered image
g_filtered = uint8(round(g_filtered));
figure()
image(g_filtered)
colormap(gray)
title('Gaussian Notch Reject Filtered Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])



