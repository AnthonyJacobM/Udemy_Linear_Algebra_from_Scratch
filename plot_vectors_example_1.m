function plot_vectors_example_1
close all;
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

x1 = [0; 0];
x2 = [1; 2];

% plot a vector from the origin
xlim([-1.5, 2.5]);
ylim([-5, 7]);
arrow(x1, x2);
arrow(x1 + [1; 4], x2 + [1; 4]);
arrow(x1 + [-1; -4], x2 + [-1; -4]);
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');

% ---- 
% Example 2
figure(2);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

x1 = [0; 0];
x2 = [1; 2];

% plot a vector from the origin
xlim([-1, 1.5]);
ylim([-1, 3]);
arrow(x1, x2);
arrow([x1(1); x1(2)], [x2(1), 0]);
arrow([x1(1)+x2(1); x1(2)], [x2(1), x2(2)]);
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');

% ---
% Example 3
figure(3);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

x1 = [0; 0];
x2 = [1; 2];

% plot a vector from the origin
xlim([-3, 3]);
ylim([-3, 5]);
arrow(x1, 2 * x2);
arrow(x1, x2);
arrow(x1, -1 * x2);
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');

% ---
% Example 4
figure(4);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

x1 = [0; 0];
x2 = [1; 2];
x3 = [3; 1];

% plot a vector from the origin
xlim([-3, 5]);
ylim([-2, 4]);
arrow(x1, x2);
arrow(x2, x2+x3);
arrow(x1, x2 + x3);
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');


% ---
% Example 5
figure(5);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

x1 = [0; 0];
x2 = [1; 2];
x3 = [3; 1];

% plot a vector from the origin
xlim([-2, 5]);
ylim([-1, 4]);
arrow(x1, x2);
arrow(x1, x3);
arrow(x2, x2+x3);
arrow(x3, x3 + x2);
arrow(x1, x2 + x3);
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');