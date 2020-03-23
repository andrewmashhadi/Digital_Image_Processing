% Part (a)
help fft
help fft2

% Part (b)
f = imread('Fig5.26a.jpg');
figure()
image(f) 
colormap(gray) 
title('Input Image f')
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

% Compute the spectum
F_spec = abs(F);

% Part (c)
% Rescale for visualization purposes
F_spec_rescaled = zeros(ROWS, COLS);
for i = 1:ROWS
             for j = 1:COLS
                 F_spec_rescaled(i,j)=5*log(1+F_spec(i,j));
             end
end
MAX = max(F_spec_rescaled, [], 'all');
MIN = min(F_spec_rescaled, [], 'all');
F_spec_rescaled = 255 * (F_spec_rescaled - MIN)./(MAX - MIN);
F_spec_rescaled = uint8(round(F_spec_rescaled));

% Display Spectrum
figure()
imagesc(F_spec_rescaled) 
colormap(gray) 
title('Spectrum Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

% Part (d)
f_avg = F_spec((ROWS/2) +1, (COLS/2) +1)/(ROWS*COLS);
disp(['Average intensity of input image is: ' num2str(f_avg)]);




