I = imread('Fig3.40(a).jpg');
figure()
image(I)
colormap(gray); 
title("Orginal Image")
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

[I_new, I_lapacian] = M155_Q1_FUNC(I);

figure()
image(I_lapacian)
colormap(gray)
title("Lapacian of Image")
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

figure()
image(I_new)
colormap(gray)
title("Image Sharpened by Lapacian")
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
