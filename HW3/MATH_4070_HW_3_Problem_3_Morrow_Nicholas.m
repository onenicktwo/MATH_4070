clear all

echo on

dfile ='MATH_4070_HW_3_Problem_3_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 3
% Problem 3
% By Nicholas Morrow

% Matrix A for each part
A = [ 1  2  3  0;
    -1  1  0  2;
    3 -1  2 -2;
    0  1  1  3 ];

% Part (a)

% p gives the indices of the pivot columns.
[R, p] = rref(A);
p

% Create the basis matrix B using the pivot columns from A.
B = A(:, p)

% Part (b)

% Find Gram Matrix
G = B' * B
% Invert Gram Matrix
G_inv = inv(G)

% Calculate proj matrix = B * inv(G) * B'
Proj1 = B * G_inv * B'

% Part (c)

% QR factorization of A. Notice that we use the basis matrix instead. This ensures the resulting Q has columns that form an
% orthonormal basis for the correct subspace, im(A). Since we confirmed those columns are linearly independent.
% We know rankA = k, so we'll only use the first 3 columns (3 linearly independent columns). Thus, the resulting Q will only
% be 4x3 instead of 4x4. We could 4x4 as well, we'd just take the 3 columns instead.
[ONB, RB] = qr(B, 0);
ONB

% Part (d)

% Calculate the projection using the ONB. Since we are using an orthonormal basis, proj = ONB * ONB'.
Proj2 = ONB * ONB'

% Compare with the other projection
Diff = Proj1 - Proj2
max_abs_diff = max(abs(Diff), [], 'all')

% This is a very low error, so this projection is the same as in (b)

diary off;
echo off;