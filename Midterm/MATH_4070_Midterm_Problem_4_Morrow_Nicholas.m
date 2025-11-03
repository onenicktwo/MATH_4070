clear all

echo on

dfile ='MATH_4070_Midterm_Problem_4_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% Midterm
% Problem 4
% By Nicholas Morrow

load('Midterm_Data_1.mat')

[m, N_B] = size(B); % m = 100
[n, N_A] = size(A); % n = 150

% Part (a)
% To reiterate Problem 3: the unique least-squares estimate X_hat satisfies the normal equation X_hat * (A*A') = B*A'.
% The columns of X_hat', denoted x_hat_i, satisfy: (A*A') * x_hat_i = A * r_i where r_i is the i-th column of B'.

% Let C = A*A'. (Since we know the values of A are real)
C = A*A';

% Solve C * x_hat_i = A * r_i for each i=1,...,m using Cholesky.
R_chol = chol(C);

% Make X_hat_star,
X_hat_star = zeros(n, m);

% Loop through each column of X_hat' (each row of X_hat)
for i = 1:m
    % r_i is the i-th column of B'.
    r_i = B(i, :)';

    % Form the right-hand vector
    d_i = A * r_i;

    % Solve (R_chol' * R_chol) * x_i = d_i in two steps:
    y = R_chol' \ d_i;
    x_i = R_chol \ y;

    % Store the result as the i-th column of X_hat'
    X_hat_star(:, i) = x_i;
end

% The estimated matrix is the transpose of X_hat_star (since its all real values)
X = X_hat_star';

% Part (b)

% Make SVD of X
[U, S, V] = svd(X);

% Get singular values;
singular_values = diag(S)

% We can see a significant drop after the 4th value, so our rank must be 4
r = 4;

% Truncate the SVD
S_r = S;
S_r(r+1:end, :) = 0;
S_r(:, r+1:end);

% Reconstruct the matrix using the SVD
Y = U * S_r * V';

% Part (c)

% Get the QR decomposition
[Qy, Ry, p_y] = qr(Y, 'vector');

% Solve R*z = Q'*c. Let d = Q'*c
d = Qy' * c;

% We want a small norm sloution, so we'll get the first r components of z
z_r = Ry(1:r, 1:r) \ d(1:r);

% Construct z
z = zeros(n,1);
z(1:r) = z_r;

% Approximate x, by x = P*z
x_approx = zeros(n,1);
x_approx(p_y) = z;

% Quick verify
residual = norm(Y * x_approx - c)
solution = norm(x_approx)

diary off;
echo off;