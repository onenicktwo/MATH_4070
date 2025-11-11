clear all

echo on

dfile ='MATH_4070_HW_6_Problem_5_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 6
% Problem 5
% By Nicholas Morrow

A = double(imread('barbara.pgm'));
[m,n] = size(A)

% Part (a)

% The Eckart-Young-Mirsky theorem states that the best rank-k approximation
% is found by truncating the Singular Value Decomposition (SVD).
[U, S, V] = svd(A);

% We are given rank 20
k = 20;

% Follow basic SVD calculation with truncated values: B = U_k * S_k * V_k'
B = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';

% Make image
B_clipped = max(0, min(B, 255));
B_image = uint8(B_clipped);
imwrite(B_image, 'barbara_rank20.pgm');

% Part (b)

% Distance matrix
D = A-B;

% (i) max norm: The largest element in magnitude in D.
norm_max = max(abs(D(:)))

% (ii) sum norm: The sum of absolute values of all elements in D.
norm_sum = sum(abs(D(:)))

% (iii) induced 1-norm: The maximum absolute column sum of D.
norm_induced_1 = norm(D, 1)

% (iv) induced infinity-norm: The maximum absolute row sum of D.
norm_induced_inf = norm(D, inf)

% (v) induced 2-norm (spectral norm): The largest singular value of D.
norm_induced_2 = norm(D, 2)

% (vi) nuclear norm: The sum of the singular values of D.
singular_values = diag(S);
% We only care about the k+1 and on, since this is the difference of A-B (B used rank k)
norm_nuclear = sum(singular_values(k+1:end))

% (vii) Frobenius norm: The square root of the sum of squared elements of D.
norm_frobenius = norm(D, 'fro')

% Part (c)

% The Schatten p-norm is the vector p-norm of its singular values.
% So, C = Schatten p-norm of D = vector p-norm of D's singular values.
% The vector p-norm is a non-increasing function of p for p >= 1.
% So we'll find the min at p = 1 or the nuclear norm
C = norm_nuclear

diary off;
echo off;