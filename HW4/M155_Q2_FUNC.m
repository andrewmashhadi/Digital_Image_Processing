function I_gradient = M155_Q2_FUNC(I)

I = double(I);
I_gradient = I;
[rows, cols] = size(I);
Mf_x = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
Mf_y = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

for i = 2:(rows-1)
    for j = 2:(cols-1)
        I_neighborhood = I((i-1):(i+1),(j-1):(j+1));
        f_x = (I_neighborhood .* Mf_x);
        f_y = (I_neighborhood .* Mf_y);
        I_gradient(i, j) = abs(sum(f_x, 'all')) + abs((sum(f_y, 'all')));
    end
end

% Normalize Intensity Values to spread over [0, 255].
MAX = max(I_gradient,[],'all');
MIN = min(I_gradient,[], 'all');
I_gradient = 255*((I_gradient - MIN)./(MAX - MIN));

I_gradient = round(I_gradient);
I_gradient = uint8(I_gradient);

end
