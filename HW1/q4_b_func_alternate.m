function [I_new, s] = q4_b_func_alternate(I, L)

I = double(I);
[rows, cols] = size(I);
tot_p = rows*cols;
I_new = zeros(rows, cols);
n = zeros(L, 1);
s = zeros(L, 1);

% Fill the frequency of each intensity level up in the vector n.
for r = 0:(L-1)
    lgl = (I == r);
    n(r+1, 1) = sum(lgl, 'all');
    s_k = ((L-1)*sum(n))/tot_p;
    I_new(lgl) = s_k;
    s(r+1, 1) = s_k;
end


end
