function [I_new, s] = q4_b_func(I, L)

% I is the matrix of an image.

[rows, cols] = size(I);
I_new = zeros(rows, cols);
tot_p = rows*cols;
n = zeros(L, 1);

% Fill the frequency value of each intensity level up in the vector n.
for r = 0:(L-1)
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

% Apply transformation to all intensity values and store in vector s
s = zeros(L, 1);
for k = 0:(L-1)
    temp_sum = 0;
    for m = 0:k
        temp_sum = temp_sum + n(m+1,1);
    end
    s(k+1, 1) = ((L-1)*temp_sum)/tot_p;
end

% Fill in corresponding values for new image matrix, I_new
for h = 0:(L-1)
    for l = 1:rows
        for u = 1:cols
            if (I(l,u) == h)
                I_new(l, u) = s(h+1,1);
            end
        end
    end 
end
end


