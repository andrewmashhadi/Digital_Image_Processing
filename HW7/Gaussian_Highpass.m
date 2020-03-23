function H_k = Gaussian_Highpass(F, u_k, v_k)

[ROWS, COLS] = size(F);

% Create H_k, the Guassian filter about (u_k, v_k)
H_k = zeros(ROWS, COLS);

% Set D_0
D_0 = 10;

% Create function handle used in loops to create filter, H
D = @(u,v) sqrt((u-(ROWS/2 + u_k))^2 + (v-(COLS/2 + v_k))^2);

for u = 0:ROWS-1              
   for v = 0:COLS-1
         P = -(D(u,v))^2 / (2*(D_0^2));
         H_k(u+1,v+1) = 1 - exp(P);
   end
end


