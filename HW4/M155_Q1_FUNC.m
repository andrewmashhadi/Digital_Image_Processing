function [I_new, I_lap] = M155_Q1_FUNC(I)

I = double(I);
I_lap = I;
[rows, cols] = size(I);
lap_mask = [0, 1, 0; 1, -4, 1; 0, 1, 0];

for i = 2:(rows-1)
    for j = 2:(cols-1)
        I_neighborhood = I((i-1):(i+1),(j-1):(j+1));
        filtered_neighborhood = (I_neighborhood.*lap_mask);
        I_lap(i, j) = sum(filtered_neighborhood, 'all');
    end
end

I_new = I - I_lap;

% Normalize Intensity Values to spread over [0, 255].
MAX = max(I_lap,[],'all');
MIN = min(I_lap,[], 'all');
I_lap = 255*((I_lap - MIN)./(MAX - MIN));

I_lap = round(I_lap);
I_lap = uint8(I_lap);


MAX = max(I_new,[],'all');
MIN = min(I_new,[], 'all');
I_new = 255*((I_new - MIN)./(MAX - MIN));

I_new = round(I_new);
I_new = uint8(I_new);

end
