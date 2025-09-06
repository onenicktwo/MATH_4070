clear all

echo on

dfile ='MATH_4070_HW_1_Problem_5_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 1
% Problem 5
% By Nicholas Morrow

% Part (a)

% 4 input vectors vi and their corresponding output vector wi
% L maps R4 -> R4, so the matrix A will be 4x4. If we did 4x5, the resulting matrix wouldn't be invertible
v1 = [0; 1; 1;  1];
v2 = [1; 1; 0;  1];
v3 = [1; 1; 0;  0];
v4 = [0; 1; 0; -1];
w1 = [-3; -2; -1;  0];
w2 = [-1;  0; -3; -2];
w3 = [ 1;  1; -3; -3];
w4 = [ 2;  2; -2; -2];

% Create input and output matrices
V = [v1 v2 v3 v4];
W = [w1 w2 w3 w4];

% Solve for L = W * inv(V)
L = W / V

% Part (b)

% Input vector
x = [1; -2; -1; 1];
% Solve L(x)
Lx = L * x

% Part (c)

% Make basis vectors and basis matrix
b1 = [ 1;  1;  1;  1];
b2 = [ 1; -1;  1; -1];
b3 = [ 1;  1; -1; -1];
b4 = [ 1; -1; -1;  1];
B  = [b1 b2 b3 b4];

% Plug into similarity equation
LB = inv(B) * L * B

% Part (d)

% The mapping L is one-to-one if and only if N(L) = {0}
% We also can say N(L) = N(LB) (see an similar proof with traces in 3b using cycles)
% Therefore we just need to find if N(LB) = {0} to show if its one-to-one or N(LB) != {0} if its not
% Let v = (0, 0, 0, 1)^T
LB
% Lv = 0, which tells us N(LB) != {0}. Therefore, L is not one-to-one.

diary off
echo off