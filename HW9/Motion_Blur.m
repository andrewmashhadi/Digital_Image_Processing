function f_blur = Motion_Blur(f, a, b, T)

f = double(f);
[M, N] = size(f);
f_shifted = zeros(M, N);

% Multiply f by (-1)^(x+y) to shift the center 
for i = 1:M
   for j = 1:N
         x_plus_y=(i-1)+(j-1);
         f_shifted(i,j)=f(i,j)*(-1)^x_plus_y;
   end
end

F = fft2(f_shifted);

H = zeros(M, N);

% Create motion blur
for u = 0:(M-1)
    for v = 0:(N-1)
        C = pi*((u-M/2)*a+(v-N/2)*b);
        if (C~=0)
            H(u+1, v+1) = (T/C)*sin(C)*exp(1i*(-C));
        else
            H(u+1, v+1) = 1;
        end
    end
end

F_blur = H.*F;
f_blur = ifft2(F_blur);

% Find the real values and re-center values
f_blur = real(f_blur);
for n = 1:M
   for m = 1:N
         xplusy=(n-1)+(m-1);
         f_blur(n,m)=f_blur(n,m)*(-1)^xplusy;
   end
end

MAX = max(f_blur,[],'all');
MIN = min(f_blur,[], 'all');
f_blur = 255*((f_blur - MIN)./(MAX - MIN));
f_blur = uint8(round(f_blur));

end
