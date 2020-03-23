function nu = Sinusoidal_Noise(f, A, u_0, v_0)

[ROWS, COLS] = size(f);
nu = zeros(ROWS, COLS);

for x = 0:ROWS-1
    for y = 0:COLS-1
        nu(x+1, y+1) = A*sin(2*pi*u_0*x + 2*pi*v_0*y);
    end
end
end