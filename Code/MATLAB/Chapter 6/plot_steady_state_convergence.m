function plot_steady_state_convergence
close all;
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;


% Example 1
A = [0.7 0.2; 0.3 0.8]; % Stochastic matrix
w0 = [8000; 2000]; % initial population
N = 50; % number of steps
w = zeros(2, N);
w(:,1) = w0;
disp(w)
% generate 2 random states
x1 = randi([0, 10000]);
y1 = randi([0, 10000]);
z1 = randi([0, 10000]);

x = zeros(2, N);
y = zeros(2, N);
z = zeros(2, N);
x(:,1) = [x1; 10000 - x1];
y(:,1) = [y1; 10000 - y1];
z(:,1) = [z1; 10000 - z1];

for i = 2:N
    w(:,i) = A^(i-1) * w(:,1);
    x(:,i) = A^(i-1) * x(:,1);
    y(:,i) = A^(i-1) * y(:,1);
    z(:,i) = A^(i-1) * z(:,1);
end
narray = linspace(1, length(w), length(w));
plot(narray, w(1,:), 'b-o');
plot(narray, w(2,:), 'r-o');
plot(narray, x(1,:), 'b-o');
plot(narray, x(2,:), 'r-o');
plot(narray, y(1,:), 'b-o');
plot(narray, y(2,:), 'r-o');
yline(6000, 'r--');
yline(4000, 'b:');
xlim([0, 10]);
xlabel('Years', 'Interpreter', 'latex');
ylabel('Population', 'Interpreter', 'latex');
