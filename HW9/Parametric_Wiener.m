function f_hat = Parametric_Wiener(g, a, b, T, k)

g = double(g);
[M, N] = size(g);
g_shifted = zeros(M, N);

% Multiply g by (-1)^(x+y) to shift the center 
for i = 1:M
   for j = 1:N
         x_plus_y=(i-1)+(j-1);
         g_shifted(i,j)=g(i,j)*(-1)^x_plus_y;
   end
end

G = fft2(g_shifted);

% Create degredation function
H = zeros(M, N);
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

H_spec = abs(H);
 
F_hat_N = (H_spec.^2);
F_hat_D = H.*((H_spec.^2) + k);

% Make sure to deal with the denominator being 0.
for i = 1:M
    for j = 1:N
        % If the denominator is 0 at an element, set the numerator at that
        % element equal to 0 and the denominator equal to 1 so that that
        % F_hat matrix will replace undefined elements with 0's
        if (F_hat_D(i, j) == 0)
            F_hat_N(i, j) = 0;
            F_hat_D(i, j) = 1;
        end      
    end
end
    

F_hat = (F_hat_N./F_hat_D).*G;

f_hat = ifft2(F_hat);
f_hat = real(f_hat);

for n = 1:M
   for m = 1:N
         xplusy=(n-1)+(m-1);
         f_hat(n,m)=f_hat(n,m)*(-1)^xplusy;
   end
end

MAX = max(f_hat,[],'all');
MIN = min(f_hat,[], 'all');
f_hat = 255*((f_hat - MIN)./(MAX - MIN));
f_hat = uint8(round(f_hat));


end






