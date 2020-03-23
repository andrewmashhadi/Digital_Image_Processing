function I_new = m155_q4_func_alternate(I, m)

I = double(I);
[rows, cols] = size(I);
I_new = I;
a = (m-1)/2;
w = 1/(m^2);
% Go through and apply the filter to each element in image matrix, except the borders.
for i = (1+a):(rows-a)
     for j = (1+a):(cols-a)
        new_entry = 0;
        for m_rows = -a:a
            for m_cols = -a:a
               new_entry = new_entry + w*I(i+m_rows,j+m_cols);  
            end
        end
        I_new(i,j) = new_entry;      
    end
end
I_new = round(I_new);
I_new = uint8(I_new);

end