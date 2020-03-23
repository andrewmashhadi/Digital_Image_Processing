function I_new = q1_func(I, k)

% I is the matirx of the image.
% k is the bit number (the specified power of 2).

I = double(I);       % Important to avoid integer division in line 13.
[r, c] = size(I);
m = 8-k;
I_new = zeros(r, c);

if (k > 8)
    return;
else 
    for i = 1:r
        for j = 1:c
          I_new(i, j) = floor(I(i,j)/(2^m))*(2^m);
        end    
    end
end

% Normalize Intensity Values to spread over [0, 255].
MAX = max(I_new,[],'all');
MIN = min(I_new,[], 'all');
I_new = 255*((I_new - MIN)./(MAX - MIN));

end
