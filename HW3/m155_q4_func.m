function I_new = m155_q4_func(I, m)

I = double(I);
[rows, cols] = size(I);
I_new = I;
a = (m-1)/2;
w = 1/(m^2);
% Go through and apply the filter to each element in image matrix, except the borders.
for i = (1+a):(rows-a)
     for j = (1+a):(cols-a)   
        % Find the neighborhood sub-matrix, multiply each element by w, and
        % then sum up every element inside.
        Neighborhood = I((i-a):(i+a), (j-a):(j+a));
        I_new(i ,j) = sum(w * Neighborhood, 'all');
    end
end
I_new = round(I_new);
I_new = uint8(I_new);

end
