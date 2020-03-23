function q4_a_func(I)  

% I is the matrix of an image.

[rows, cols] = size(I);
n = zeros(256, 1);

% Fill the frequency value of each intensity level up in the vector n.
for r = 0:255
    n_r = 0;
    for i = 1:rows
        for j = 1:cols
            if (I(i,j) == r)
                 n_r = n_r + 1;
            end
        end
    end 
    
    n(r+1, 1) = n_r;
end

r_k = 0:255;

figure()
bar(r_k, n, 'barwidth', 4)


end