clear all

echo on

dfile ='MATH_4070_HW_1_Problem_5_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 2
% Problem 4
% By Nicholas Morrow

% Define the function to be approximated
f = @(t) exp(sin(t));

% Define the interval
t_0 = 0;
t_n = 2*pi;

% Define the degrees of the trigonometric polynomials
N_values = [1, 3, 5];
max_N = max(N_values);

% Create a grid of t-values for plotting, 1000 points
t_plot = linspace(t_0, t_n, 1000).';

% Prepare for looping over each N value, each col will have a polynomial
P_N = zeros(numel(t_plot), numel(N_values));

% first coefficient is the same for all N
a0 = (1/pi) * integral(@(t) f(t), t_0, t_n)

for i = 1:numel(N_values)
    % Prepare before summation
    N = N_values(i);
    ak = zeros(1,N);
    bk = zeros(1,N);
    % By def of degree-N real trigonometric polynomial, a0/2 will be included in each calculation
    polyVals = a0 / 2 * ones(size(t_plot));

    for k = 1:N
        % Fourier coeffs (1/pi)integ(f(t)cos(kt)dt) and (1/pi)integ(f(t)sin(kt)dt)
        ak(k) = (1/pi) * integral(@(t) f(t).*cos(k*t), t_0, t_n)
        bk(k) = (1/pi) * integral(@(t) f(t).*sin(k*t), t_0, t_n)

        polyVals = polyVals + ak(k)*cos(k*t_plot) + bk(k)*sin(k*t_plot);
    end

    % Store
    P_N(:,i) = polyVals;
end

% Plot
figure(1);

% Original function
plot(t_plot, f(t_plot), 'w');  hold on;

% Approximations
plot(t_plot, P_N(:,1), 'r--');   % N = 1
plot(t_plot, P_N(:,2), 'b-.');   % N = 3
plot(t_plot, P_N(:,3), 'g:');   % N = 5

% Extra thing(s) for plot
xlim([t_0 t_n]);
title('Approximation of f(t) = e^{sin(t)} by Trigonometric Polynomials');
xlabel('t');
ylabel('f(t), p_N(t)');
axis tight;


% Wasn't sure if I needed a creation line, uncomment to make the pdf if you want
% print(gcf,'-dpdf','MATH_4070_HW_2_Problem_4_Morrow_Nicholas_plot.pdf')

diary off
echo off