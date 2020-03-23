% Download and display original Image
g = imread('Fig5.08(b).jpg');
figure()
image(g)
colormap(gray); 
title('Original Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
g = double(g);

Q = -1.5;
m = 3;
a = (m-1)/2;
b = (m-1)/2;
[ROWS, COLS] = size(g);

f_hat = g;

% Generate new filtered imagr 
for i = (1+a):(ROWS-a)
   for j = (1+b):(COLS-b)
      S_xy = g((i-a):(i+a), (j-a):(j+a));
      num = sum((S_xy.^(Q+1)), 'all');
      den = sum((S_xy.^Q), 'all');
      f_hat(i, j) = num/den;
   end
end

f_hat = uint8(round(f_hat));
figure()
image(f_hat)
colormap(gray); 
title('Contraharmonic Filtered Image with Q=-1.5')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
