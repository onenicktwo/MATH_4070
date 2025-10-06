clear all

echo on

dfile ='MATH_4070_HW_3_Problem_5_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 3
% Problem 5
% By Nicholas Morrow

% Time t in seconds
t = (0:12)';

% Position y in feet
y = [0; 8.8; 29.9; 62.0; 104.7; 159.1; 222.0; 294.5; 380.4; 471.1; 571.7; 686.8; 809.2];

% Part (a)

% Construct the matrix A. Each column corresponds to a power of t.
A = [ones(size(t)), t, t.^2, t.^3]

% Make the norm equation: A'*A * b = A'*y
% First, the gram matrix G = A' * A
G = A' * A

% Then, the right hand side equation
b_rhs = A' * y

% Solve G * b = b_rhs using Cholesky
% First, find Cholesky factor s.t. G = L' * L
L = chol(G)

% Then, solve the equation L'Lb = b_rhs
b_chol = L \ (L' \ b_rhs)

% Part (b)

% Find QR factorization of A
[Q, R] = qr(A);
Q
R

% Least-squares solution to A*b = y is the solution to R*b=Q'*y
b_qr = R \ (Q' * y)

% Compare answers
Diff = b_chol - b_qr
max_abs_diff = max(abs(Diff))

% This is a very low error, so this b found by QR is the same as the b found by Cholesky

% Part (c)

% The estimated position is est = beta_0 + beta_1*t + beta_2*t^2 + beta_3*t^3 where t = 4.5.
t_est = 4.5;
t_vec = [1, t_est, t_est^2, t_est^3];

% Solve equation for (a) and (b)
est_a = t_vec * b_chol
est_b = t_vec * b_qr

diary off;
echo off;