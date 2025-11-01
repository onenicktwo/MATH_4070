clear all

echo on

dfile ='MATH_4070_Midterm_Problem_5_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% Midterm
% Problem 5
% By Nicholas Morrow

load('Midterm_Data_2.mat')
B

% Decompose B into Symmetric Part: S = (B + B')/2 and Skew-Symmetric Part: K = (B - B')/2 such that B = S + K.
% Now, Q(x) = x' * (S+K) * x = x'*S*x + x'*K*x. We can now analyze both parts.
% x'*K*x is scalar. So, x'*K*x = (x'*K*x)' ==> x'*K*x = x'*(-K)*x, thus x'*K*x = 0 for all vectors x.
% So, Q(x) = x' * S * x. Thus, it only relies on the symmetric part of B.
S = (B + B') / 2

% If S has at least one negative eigenvalue, S is indefinite, and x'*S*x can be negative.
% Calculate the eigenvalues of the symmetric matrix S.
eigenvalues = eig(S)

% Find the minimum eigenvalue to find negative values.
[min_eig, min_idx] = min(eigenvalues)

% This eigenvalue is negative, so Q(x) could be negative. We can check this by finding the eigenvector x for this value.
[V, D] = eig(S)
x = V(:, min_idx)

% Calculate Q(x) to verify
Q_ans = x' * B * x

% This is negative, thus we found an x where Q(x) is negative.

diary off;
echo off;