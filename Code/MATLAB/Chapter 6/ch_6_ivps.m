function ch_6_ivps
close all;
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;
% drive the system:
t = linspace(0, 3, 11);
y0 = [1; -1];

% generate the solution to the system
function dydt = odefcn(t,y)
    dy1 = -2 * y(1) + 2 * y(2);
    dy2 = - y(1) -2 * y(2);
    dydt = [dy1; dy2];
end

[T, Y] = ode45(@odefcn, t, y0);



plot(T, Y(:,1), 'b-o'); % y1
plot(T, Y(:,2), 'r-o'); % y2


% --- Generate the Analytical Solution to the IVP
t = linspace(0, 3, 31);
% initial condition of the system
x0 = [1; -1];

% coefficient matrix
A = [-2 2; -1 -2];

% get eigvalues and eigvectors
[a_ew, a_ev] = eig(A);

% diagonal entries are the eigenvalues
ev = diag(a_ev);

% seperate columns of a_ew
v1 = a_ew(:,1);
v2 = a_ew(:,2);


% the solution is Y' = A * Y;
% the initial value problem
% is determined by augmenting the RHS with initial values and eigvectors on
% the left hand side
Anew = [v1, v2, x0];
Unew = rref(Anew);

% coefficient matrix is right hand side
C = Unew(:,end);
c1 = C(1);
c2 = C(2);


% solution: Y = C * x * exp(\lambda t);
Y = c1 * v1 * exp(ev(1) * t) + c2 * v2 * exp(ev(2) * t);

y1 = Y(1,:);
y2 = Y(2,:);

plot(t, real(y1), 'k:');
plot(t, real(y2), 'k:');

xlabel('t', 'Interpreter', 'latex');
ylabel('Y(t)', 'Interpreter', 'latex');

% display the analytic solution:
fprintf('Eigenvalues');
disp(diag(a_ev));
fprintf('Eigenvectors');
disp(a_ew);
fprintf('Coefficient');
disp(C);



figure(2);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;

% plot the quiver field
[X, Y] = meshgrid(linspace(-1.5, 1.5, 21), linspace(-1.5, 1.5, 21));
U = -2 * X + 2 * Y;
V = - X -2 * Y;
quiver(X, Y, U, V);

plot(y1, y2, 'k-o');
xlabel('$y_1$', 'Interpreter', 'latex');
ylabel('$y_2$', 'Interpreter', 'latex');
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);


% ------ Example 5 -------
% Higher order systems
figure(5);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;
% drive the system:
t = linspace(0, 3, 11);
y0 = [1; -1];

% generate the solution to the system
B = [0     0     1     0;
     0     0     0     1;
     2     1     1     1;
    -5     2     5    -1];

flag = 0;
while flag == 0
    B = randi([-5, 5], 3,3);
    B(1,:) = [0 0 randi([-5,5],1,1)];
    %B(2,:) = [0 randi([-5,5],1,1) 0];
    [ew, ev] = eigs(B);
    evals = diag(ev);
    if max(real(evals)) <= 0.05 && min(real(evals)) >= -0.25
        flag = 1;
        fprintf('Contractible\n');
    end
end
v1 = ew(:,1);
v2 = ew(:,2);
v3 = ew(:,3);
fprintf('Eigenvalues')
disp(evals);
fprintf('Eigenvectors');
disp(v1);
disp(v2);
disp(v3);
b11 = B(1,1);
b12 = B(1,2);
b13 = B(1,3);
b21 = B(2,1);
b22 = B(2,2);
b23 = B(2,3);
b31 = B(3,1);
b32 = B(3,2);
b33 = B(3,3);
fprintf('Coefficient Matrix: \n');
disp(B);


function dydt = odefcn_3(t,y)
    dy1 = b11 * y(1) + b12 * y(2) + b13 * y(3);
    dy2 = b21 * y(1) + b22 * y(2) + b23 * y(3);
    dy3 = b31 * y(1) + b32 * y(2) + b33 * y(3);
    dydt = [dy1; dy2; dy3];
end

k = 1;
t = linspace(0, 20, 101);
y0 = rand(3,1);
[T, Y] = ode45(@odefcn_3, t, y0);
y1 = Y(:,1);
y2 = Y(:,2);
y3 = Y(:,3);
plot(T, y1, 'b-o'); hold on;
plot(T, y2, 'r-o');
plot(T, y3, 'k-o');
xlabel('$t$', 'Interpreter', 'latex');
ylabel('$Y(t)$', 'Interpreter', 'latex');

figure(6);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;
plot(real(evals(1)), imag(evals(1)), 'b*');
plot(real(evals(2)), imag(evals(2)), 'r*');
plot(real(evals(3)), imag(evals(3)), 'k*');
xlabel('$R(\lambda)$', 'Interpreter', 'latex');
ylabel('$Im(\lambda)$', 'Interpreter', 'latex');

figure(7);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;
plot(y1, y2, 'b*');

xlabel('$y_1$', 'Interpreter', 'latex');
ylabel('$y_2$', 'Interpreter', 'latex');
[X, Y] = meshgrid(linspace(min(y1) * 1.5, max(y1) * 1.5, 21), linspace(min(y2) * 1.5, max(y2) * 1.5, 21));

Y_ss = zeros(3,1);

U = b11 * X + b12 * Y + b13 * Y_ss(3);
V = b21 * X + b22 * Y + b23 * Y_ss(3);

plot(y1, y2, 'k-o');
quiver(X, Y, U, V, 'color', 'blue');
if real(evals(1)) > 0
    arrow(Y_ss(1:2), v1);
    arrow(Y_ss(1:2), -v1);
else
    arrow(v1, Y_ss(1:2));
    arrow(-v1, Y_ss(1:2));
end
%
if real(evals(2)) > 0
    arrow(Y_ss(1:2), v2);
    arrow(Y_ss(1:2), -v2);
else
    arrow(v2, Y_ss(1:2));
    arrow(-v2, Y_ss(1:2));
end

xlabel('$y_1$', 'Interpreter', 'latex');
ylabel('$y_2$', 'Interpreter', 'latex');



% -- Example 7 -- SHM
t = linspace(0, 10, 21);
k = abs(randn(1));
m = randi([1, 5], 1, 1);
Ashm = [0 1; -k/m 0];
a11 = Ashm(1,1);
a12 = Ashm(1,2);
a21 = Ashm(2,1);
a22 = Ashm(2,2);
function dydt = odefcn_shm(t,y)
    dy1 = a11 * y(1) + a12 * y(2);
    dy2 = a21 * y(1) + a22 * y(2);
    dydt = [dy1; dy2];
end


t = linspace(0, 20, 101);
y0 = [1, 1];
[T, Y] = ode45(@odefcn_shm, t, y0);
y1 = Y(:,1);
y2 = Y(:,2);

figure(8);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;

plot(T, y1, 'b-o');
plot(T, y2, 'r-o');
xlabel('t', 'Interpreter', 'latex');
ylabel('Y(t)', 'Interpreter', 'latex');

figure(9);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;


for x = 1:2
    for y = 1:2
        y0 = [x,y];
        y0 = randi([-3, 3], 2,1);
        disp(x); disp(y);
        [T, Y] = ode45(@odefcn_shm, t, y0);
        y1 = Y(:,1);
        y2 = Y(:,2);
        plot(y1, y2, 'k-o'); hold on;
    end
end


[X, Y] = meshgrid(linspace(-5, 5, 20), linspace(-5, 5, 20));
U = a11 * X + a12 * Y;
V = a21 * X + a22 * Y;
quiver(X, Y, U, V, 'b');

xlabel('$y_1$', 'Interpreter', 'latex');
ylabel('$y_2$', 'Interpreter', 'latex');

end