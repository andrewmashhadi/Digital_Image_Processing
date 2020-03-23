I_256 = imread('Fig2.21(a).jpg');
figure()
subplot(2, 2, 1)
image(I_256)
colormap(gray); 
title('8 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
[rows, columns] = size(I_256);

% Reducing Gray Levels from 256->128
I_128 = q1_func(I_256, 7);
I_128 = uint8(I_128);
subplot(2, 2, 2)
image(I_128)
colormap(gray);
title('7 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
 
%  Reducing Gray Levels from 256->64
I_64 = q1_func(I_256, 6);
I_64 = uint8(I_64);
subplot(2, 2, 3)
image(I_64)
colormap(gray); 
title('6 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])


%  Reducing Gray Levels from 256->32
I_32 = q1_func(I_256, 5);
I_32 = uint8(I_32);
subplot(2, 2, 4)
image(I_32)
colormap(gray); 
title('5 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

%  Reducing Gray Levels from 256->16
I_16 = q1_func(I_256, 4);
I_16 = uint8(I_16);
figure()
subplot(2, 2, 1)
image(I_16)
colormap(gray);
title('4 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
 
%  Reducing Gray Levels from 256->8
I_8 = q1_func(I_256, 3);
I_8 = uint8(I_8);
subplot(2, 2, 2)
image(I_8)
colormap(gray); 
title('3 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

%  Reducing Gray Levels from 256->4
I_4 = q1_func(I_256, 2);
I_4 = uint8(I_4);
subplot(2, 2, 3)
image(I_4)
colormap(gray); 
title('2 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

%  Reducing Gray Levels from 256->2
I_2 = q1_func(I_256, 1);
I_2 = uint8(I_2);
subplot(2, 2, 4)
image(I_2)
colormap(gray);
title('1 - Bit Image')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])