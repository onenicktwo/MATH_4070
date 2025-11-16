clear all

echo on

dfile ='MATH_4070_HW_7_Problem_6_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 7
% Problem 6
% By Nicholas Morrow

% We are given the system: 4x'(t) = C * x(t), which can be simplified to x'(t) = C/4 * x(t) => x'(t) = M * x(t)
C = [ 17, -86, 122, -50;
    -12,  50, -82,  28;
    -5,  22, -36,  12;
    16, -70, 106, -41 ];
M = C / 4

% Given initial condition
x0 = [-1; 2/3; 9/2; -6/7];

% Given time parameters
dt = 0.25;
N = 120;

% 4x120 solution matrix for storing the results
X = zeros(4, N);

% From in class, the solution to x'(t) = M*x(t) is x(t) = exp(tM) * x0.
% Loop k=1 to N to find a soln for each step
for k = 1:N
    % For each k, the time t is k * dt.
    t_k = k * dt;

    % Directly calculate the solution x(t) at this specific time t_k
    x = expm(t_k * M) * x0;

    % Store this solution vector in the k-th column of our result matrix.
    X(:, k) = x;
end

X

diary off;
echo off;