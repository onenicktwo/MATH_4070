clear all

echo on

dfile ='MATH_4070_HW_5_Problem_2_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 5
% Problem 2
% By Nicholas Morrow

A = [1 2 1 -1;
    3 -1 2 -2];

b = [2; 1];

% Part (a)

% For a fat and short matrix (rows < cols), our notes tells us to approximate with QR/
% The equation for this is AP = QR.

m = size(A, 1) % num of rows
n = size(A, 2) % num of cols

[Q, R, P] = qr(A)

% From notes, RP^(-1)x = Q^*b, we take transpose of Q instead since we are using real numbers
rhs = Q' * b;

% Get the first m columns of R and solve this as R1*y1 = rhs, we want y2 = 0 for a small norm
R1 = R(:, 1:m)
y1 = R1 \ rhs
y_approx = [y1; zeros(n-m, 1)]

% From notes, it then wants us to find x = Py
x_approx = P * y_approx

% Check, should be 0 or close to 0
A*x_approx - b

% Show 2-norm
norm(x_approx)

% Part (b)

% First find an SVD
[U, S, V] = svd(A, "econ")

% Construct sigma
s_diag = diag(S)
s_inv_diag = 1 ./ s_diag
S_inv = diag(s_inv_diag)

% Plug in and calculate for: x = V * inv(S) * U^* * b
x_svd = V * S_inv * U' * b

% Part (c)

% Find the Moore-Penrose psuedoinverse A_dagger = V * inv(S) * U^*
A_dagger = V * S_inv * U'

% Always good to check built in functions, these are same or similar
pinv(A)

% Verify results based on what problem suggests
x_dagger = A_dagger * b

% This is exactly what we got for part(b)

diary off;
echo off;