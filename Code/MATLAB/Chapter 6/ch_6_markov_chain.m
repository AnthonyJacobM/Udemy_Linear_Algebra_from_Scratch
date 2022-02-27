function ch_6_markov_chain

close all;
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;

% number of states
n = 2;
% generate strictly-positive matrix
A = randi([1, 10], 2,2);
% transition matrix is stochastic
P = [A(:,1) / sum(A(:,1)), A(:,2) / sum(A(:,2))];

% P = [0.2500    0.3750;
%     0.7500    0.6250];

u = randi([1, 10], 2,1);
% probability vector
p = u / sum(u);

% define number of iterates
N = 5;
ux = randi([1, 10], 2,1);
uy = randi([1, 10], 2,1);
uz = randi([1, 10], 2,1);
uw = randi([1, 10], 2,1);

x = zeros(n, N);
y = zeros(n, N);
z = zeros(n, N);
w = zeros(n, N);

x(:,1) = ux / sum(ux);
y(:,1) = uy / sum(uy);
z(:,1) = uz / sum(uz);
w(:,1) = uw / sum(uw);

for k = 2:N
    % generate random initial conditions
    x(:,k) = P * x(:,k-1);
    y(:,k) = P * y(:,k-1);
    z(:,k) = P * z(:,k-1);
    w(:,k) = P * w(:,k-1);
end

nt = linspace(0, N-1, N); % iterations array

% plot it!
plot(nt, x(1,:), 'b');
plot(nt, y(1,:), 'b-o');
plot(nt, z(1,:), 'b:o');
%plot(nt, w(1,:), 'b:');

plot(nt, x(2,:), 'r');
plot(nt, y(2,:), 'r-o');
plot(nt, z(2,:), 'r:o');
%plot(nt, w(2,:), 'r:');

xlabel('$k_{th} ~ Iteration$', 'Interpreter', 'latex');
ylabel('$x^{(k)}$', 'Interpreter', 'latex');