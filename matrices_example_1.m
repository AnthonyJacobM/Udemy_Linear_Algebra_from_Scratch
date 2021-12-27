function matrices_example_1
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on;
x = linspace(-10, 10, 1001); % generate 1001 linearly spaced points between -10 and 10
plot(x, (5 - 2 * x) / 3, 'b', 'LineWidth', 2); % plot equation 1
plot(x, x - 10, 'r', 'LineWidth', 2); % plot equation 2
plot(7,-3,'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10);
xlabel('x', 'Interpreter', 'latex', 'FontSize', 24);
ylabel('y', 'Interpreter', 'latex', 'FontSize', 24);
legend({'2x + 3y = 5', 'x - y = 10'}, 'Interpreter', 'latex');