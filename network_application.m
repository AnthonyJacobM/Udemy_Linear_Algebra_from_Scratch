function network_application
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

% set Adjacency Matrix
Adj = [0 1 0 0 1; 1 0 1 1 0; 0 1 0 1 0; 0 1 1 0 1; 1 0 0 1 0];

% number of days
N = 10;

% loop through each day and count the cumulative sales
for i = 1:N
    Adj_i = Adj^i;
    Alice(i) = sum(Adj_i(1,:));
    Brandon(i) = sum(Adj_i(2,:));
    Candice(i) = sum(Adj_i(3,:));
    Dimitri(i) = sum(Adj_i(4,:));
    Elijah(i) = sum(Adj_i(5,:));
end

% plot the results
days = linspace(1, N, N);
hold on;
plot(days, Alice, 'mo', 'MarkerFaceColor', 'magenta');
plot(days, Brandon, 'bo', 'MarkerFaceColor', 'blue');
plot(days, Candice, 'go', 'MarkerFaceColor', 'green');
plot(days, Dimitri, 'ko', 'MarkerFaceColor', 'black');
plot(days, Elijah, 'ro', 'MarkerFaceColor', 'red');

% label the axis!
xlabel('Days', 'Interpreter', 'latex');
ylabel('Sales', 'Interpreter', 'latex');

% legend for plotting
legend({'Alice', 'Brandon', 'Candice', 'Dimitri', 'Elijah'}, 'location', 'northwest');
end