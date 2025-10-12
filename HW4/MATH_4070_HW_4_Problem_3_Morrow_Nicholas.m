clear all

echo on

dfile ='MATH_4070_HW_4_Problem_3_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 4
% Problem 3
% By Nicholas Morrow

A = [-4 -5 3 -1;
    -3 0 0 -4;
    -1 -5 3 3;
    -5 3 -2 0];

% Part (a)

% Find pivot columns
[R, P] = rref(A);

% How many pivot columns?
length(P)

% rref tells us there are 4 pivot columns, thus rank(A) = 4

% Part (b)

% Find eigenvectors to make an S, then the diagonal matrix of the eigenvalues
[S, D] = eig(A)

% Check. Values match, thus S and D are correct
B = S * D * inv(S)
A

% Part (c)

% Gives 4 values. However, the last value shows 0, thus rank(A) = 3
diag(D)

% Part (d)

% ker(A) wants vectors x such that Ax = 0. Thus, we want an eigenvalue of 0.
% From eig(A) we know there is a 4th eigenvalue of 0 in the 4th column.
x = S(:,4)

% Using the hint
v = x / x(1)

% Verify is 0 vector. Answer is very small, assume 0.
A * v

% Part (e)

% Part (a) rref(A) suggests rank(A) = 4. A matrix with rank 4 is invertible and its kernel
% contains only the zero vector. Part (d) found an non-zero vector v in the kernal of A.
% The existence of that vector proves the kernal is non-trivial, which means A must be
% not invertible. Thus, A must have a rank less then 4.

diary off;
echo off;