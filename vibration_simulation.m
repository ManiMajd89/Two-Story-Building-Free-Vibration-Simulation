% Two-Story Building Free Vibration Simulation using IEM
% Author: Mani Majd
% Source: ESC103 Lab 3
% Date: November 2024
% Description:
%   Simulates free vibration for a two-story building using Improved Euler's Method (IEM).
%   Compares solutions for different time step sizes.

%% Problem Parameters
m1 = 0.0917; % Mass of the first floor (kN*sec^2/mm)
m2 = 0.0765; % Mass of the second floor (kN*sec^2/mm)
k1 = 4.66; % Stiffness of spring 1 (kN/mm)
k2 = 4.66; % Stiffness of spring 2 (kN/mm)

% State-space representation matrix
A = [
    0          , 1          , 0          , 0;
    (-k1-k2)/m1, 0          , k2/m1      , 0;
    0          , 0          , 0          , 1;
    k2/m2      , 0          , -k2/m2     , 0;
];

T = 10; % Total simulation time (seconds)
Z_0 = [100; 0; 50; 0]; % Initial conditions: [x1(0), x1'(0), x2(0), x2'(0)]

% Time step values and line types
N = [400, 500, 1000]; % Different time step counts
line_type = ["--", "-.", "-"]; % Line styles for plots

%% Solve and Plot for Different N
figure;
subplot(2, 1, 1);
hold on;
subplot(2, 1, 2);
hold on;

for i = 1:length(N)
    % Solve using Improved Euler's Method
    [t, x1, x2] = IEMsolver_2(A, Z_0, T, N(i));

    % Plot results
    subplot(2, 1, 1);
    plot(t, x1, line_type(i), 'LineWidth', 1, 'DisplayName', "N=" + num2str(N(i)));

    subplot(2, 1, 2);
    plot(t, x2, line_type(i), 'LineWidth', 1, 'DisplayName', "N=" + num2str(N(i)));
end

% Add labels, legends, and titles for the first subplot
subplot(2, 1, 1);
xlabel('Time (s)');
ylabel('Displacement x_1(t) (mm)');
title('IEM Solutions for x_1(t)');
legend('Location', 'bestoutside');
grid on;

% Add labels, legends, and titles for the second subplot
subplot(2, 1, 2);
xlabel('Time (s)');
ylabel('Displacement x_2(t) (mm)');
title('IEM Solutions for x_2(t)');
legend('Location', 'bestoutside');
grid on;

hold off;

%% Function Definition: Improved Euler's Method Solver
function [t, x1, x2] = IEMsolver_2(A, Z_0, T, N)
    dt = T / N; % Time step size
    t = 0:dt:T; % Time vector

    % Initialize solution matrix
    SOL = NaN(4, length(t));
    SOL(:, 1) = Z_0; % Initial condition

    % Iterate through time steps
    for i = 2:length(t)
        k1 = dt * A * SOL(:, i-1); % First slope
        k2 = dt * A * (SOL(:, i-1) + k1); % Second slope
        SOL(:, i) = SOL(:, i-1) + 0.5 * (k1 + k2); % Improved Euler's update
    end

    % Extract displacements for the first and second floors
    x1 = SOL(1, :); % Displacement of the first floor
    x2 = SOL(3, :); % Displacement of the second floor
end