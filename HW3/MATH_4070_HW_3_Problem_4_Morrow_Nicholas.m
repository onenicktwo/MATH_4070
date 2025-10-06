clear all

echo on

dfile ='MATH_4070_HW_3_Problem_4_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 3
% Problem 4
% By Nicholas Morrow

% Weight w in pounds
w = [45; 60; 72; 85; 98];

% Systolic blood pressure p in mmHg
p = [90; 95; 100; 104; 110];

% Setup a least-squares problem Ax = b

% This is just to make it easier to match with equation in our notes
b = p

% We know x must be equal to [beta_0; beta_1], so A must have two columns. From the equation beta_0 * 1 + beta_1 * ln(w) = p, A
% has a column of ones and a column of ln(w) based on the values of w.
A = [ones(size(w)), log(w)]

% Now we solve Ax = b using the QR method
[Q, R] = qr(A);
Q
R

% Solve Rx = Q' * b for x = [beta_0; beta_1]
betas = R \ (Q' * b)
beta0 = betas(1)
beta1 = betas(2)

% Predict pressure for a 100 pound child
estimate = beta0 + beta1 * log(100)

diary off;
echo off;