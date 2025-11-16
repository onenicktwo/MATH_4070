clear all

echo on

dfile ='MATH_4070_HW_7_Problem_5_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 7
% Problem 5
% By Nicholas Morrow

A = [ 1, 2, 3, 4;
    0, 1, 5, 6;
    0, 0, 1, 7;
    0, 0, 0, 1 ];

% Let B = A - I
I = eye(size(A))
B = A - I

% Initialize the estimate for sqrt(A)
sqrt_A_est = zeros(size(A))

% We are given the summation at k = 100
N = 100;

% Initialize coefficient for k = 0
coeff = 1;

% Initialize the power of B for k=0, which is B^0 = I.
B_power = I;

% The power series for sqrt(A) is given by: sqrt(A) = sum_{k=0}^inf binom(1/2, k) * (A-I)^k
% Loop through k=0 to k=100
for k = 0:N
    % Add the k-th term to the sum
    sqrt_A_est = sqrt_A_est + coeff * B_power;

    % Update the binomial coefficient for the next iteration (k+1)
    % this is found by: c_{k+1} = c_k * (n - k) / (k + 1) for n=1/2.
    coeff = coeff * (0.5 - k) / (k + 1);

    % Update the power of B for the next iteration (k+1)
    B_power = B_power * B;
end

sqrt_A_est

% Find squared values
A_from_sqrt = sqrt_A_est^2

% Check similarity. All values are zero, so the matrices are the same.
error = A - A_from_sqrt

diary off;
echo off;