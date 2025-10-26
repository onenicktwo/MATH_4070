clear all

echo on

dfile ='MATH_4070_HW_5_Problem_3_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 5
% Problem 3
% By Nicholas Morrow

% Load matrices
load('hw5_num3.mat')
A
b

% Part (a)

% Plug into function
x_hat = lsqminnorm(A, b)

% Find the norm of x_hat
norm_x_hat = norm(x_hat)

% Find the norm: ||A*x_hat - b||
norm_residual = norm(A * x_hat - b)

% Part (b)

% MATLAB rank
rank = rank(A)

% SVD rank is based on the values in S. The last 3 values are 0 or close to 0, so the rank is 7
S = svd(A)

% Part (c)

% From part (b), use svd rank
r = 7;

% We can do a rank-r approximation using a truncated SVD
[U, S, V] = svd(A, 'econ')
Ar = U(:, 1:r) * S(1:r, 1:r) * V(:, 1:r)'

% Proof of approximation using Frobenius norm. It is close to 0, so this is a very good approximation.
closeness = norm(A - Ar, 'fro')

% Part (d)

% Find psuedoinverse of Ar, where Ar_dagger = Vr * inv(Sr) * Ur'
Ur = U(:, 1:r)
Sr = S(1:r, 1:r)
Vr = V(:, 1:r)
Ar_dagger = Vr * inv(Sr) * Ur'

% Find solution of xr by using the psuedoinverse
xr = Ar_dagger * b

% Part (e)

% Calculate the residual norm for the new solution: ||A*x_r - b||
residual_norm_xr = norm(A * xr - b)

% Calculate the norm of the new solution: ||x_r||
norm_xr = norm(xr)

% Part (f)

% Overall we want a small norm. Looking at the norm for xr and x_hat we find that xr has a
% much smaller norm (around 1,000,000 times less!). Our error has only increases a little bit based on the residual. So,
% xr is a much better solution since it only increases our error by a small amount and increases our stability tremendously.

diary off;
echo off;