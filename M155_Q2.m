I = imread('Fig5.26a.jpg');
figure()
image(I)
colormap(gray); 
title("Orginal Image")
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

I_gradient = M155_Q2_FUNC(I); 

figure()
image(I_gradient)
colormap(gray)
title("Gradient of Image")
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])