function plot_scalar_product
close all;
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

% Generate a 2 x 2 array of random integers
values = randi([-5, 5], 2, 2);
x = values(:,1);
y = values(:,2);
z = zeros(2,1);
dist_max = max([norm(x), norm(y), norm(z)]);

xlim([-dist_max * 1.5, dist_max * 1.5]);
ylim([-dist_max * 1.5, dist_max * 1.5]);

arrow(z, x);
arrow(x, x + (y-x));
arrow(z, y);
ux = x / norm(x);
uy = y / norm(y);
arrow(z, ux);
arrow(z, uy);
xlabel('x-axis', 'Interpreter', 'latex');
ylabel('y-axis', 'Interpreter', 'latex');

xline(0, 'k');
yline(0, 'k');


% Example 2: Projection
% ----------------
figure(2);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

x = [2; 3];
y = [5; 1];
% Uncomment below for random vectors.....
% values = randi([-5, 5], 2, 2);
% x = values(:,1);
% y = values(:,2);
z = zeros(2, 1);
ux = x / norm(x);
uy = y / norm(y);
theta = acos(dot(ux, uy));
%alpha = norm(x) * cos(theta); % scalar prj of x onto y
alpha = dot(x, y) / norm(y);
p = alpha * uy; % projection vector
drawbrace(p, z, 20, 'Color', 'b');
norm_max = max([norm(x), norm(y)]);
xlim([-1.25 * norm_max, 1.25 * norm_max]);
ylim([-1.25 * norm_max, 1.25 * norm_max]);
arrow(z, y);
arrow(z, x);
arrow(z, p);
arrow(p, x); % Orthogonal vector
% draw brace from z to p
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'Interpreter', 'latex');
ylabel('y-axis', 'Interpreter', 'latex');


% -----------------------------
% Example 3 -- Normal of the span of two vectors
% -----------------------------
figure();
% set(0,'DefaultAxesFontSize',24);
% set(gca,'FontSize',24); % increase font size
% set(0,'DefaultLineLineWidth', 1.25);
% box on; hold on; grid on;


P1 = [1; 1; 2];
P2 = [2; 3; 3];
P3 = [3; -3; 3];


x = P2 - P1; 
y = P3 - P1;
N = cross(x, y); % cross product orthogonal to x and y!

x0 = P1(1);
y0 = P1(2);
z0 = P1(3);
a = N(1); b = N(2); c = N(3);

xarray = linspace(-10, 10, 101);
yarray = linspace(-10, 10, 101);
zarray = -a/c * (xarray - x0) - b/c * (yarray - y0) + z0;

% plot the points 
plot3(P1(1), P1(2), P1(3), 'kx');
hold on;
%plot3(P2(1), P2(2), P2(3), 'kx');
%plot3(P3(1), P3(2), P3(3), 'kx');
plot3(xarray, yarray, zarray, 'b');

arrow(P1, P1 + P2);
arrow(P1, P1 + P3);
arrow(P1, P1 + N);

grid on; box on;
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');
zlabel('z-axis', 'interpreter', 'latex');


% Example 4: Pythagoren Law
% ----------------
figure(4);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;

x = [2; 0];
y = [0; 3];
z = zeros(2, 1);
ux = x / norm(x);
uy = y / norm(y);
norm_max = max([norm(x), norm(y)]);
xlim([-1.25 * norm_max, 1.25 * norm_max]);
ylim([-1.25 * norm_max, 1.25 * norm_max]);
arrow(z, x);
arrow(x, x+ y);
arrow(z, x + y);
% draw brace from z to p
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'Interpreter', 'latex');
ylabel('y-axis', 'Interpreter', 'latex');

% Example 5
% Frequency of Words & Word Search for a Database.
determinants = [0 6 3 0 1 0 1 1];
eigenvalues = [0 0 0 0 0 5 3 2];
linear = [5 4 4 5 4 0 3 3];
matrices = [6 5 3 3 4 4 3 2];
numerical = [0 0 0 0 3 0 4 3];
orthogonality = [0 0 0 0 4 6 0 2];
spaces = [0 0 5 2 3 3 0 1];
systems = [5 3 3 2 4 2 1 1];
transformations = [0 0 0 5 1 3 1 0];
vector = [0 4 4 3 4 1 0 3];

variable_labels = ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8"];
row_labels = ["Determinants", "Eigenvalues", "Lienar", "Matrices", "Numerical", "Orthogonality", "Spaces", "Systems", "Transformations", "Vector"];

% create a matrix containing the data
A = [determinants; eigenvalues; linear; matrices; numerical; orthogonality; spaces; systems; transformations; vector];

% convert the data to an organized table
T_freq = array2table(A, 'RowNames', row_labels, 'VariableNames', variable_labels);

% This table tells us the frequency of the ith keyword with respect to the
% jth Module

% if we want to obtain the relative frequency for each keyword we will need
% to normalize each column vector by the norm of the column.
Q = zeros(size(A));
% iterate over each column and normalize frequencye:
for j = 1:length(variable_labels)
    Q(:,j) = round(A(:,j) / norm(A(:,j)), 3);
end

% generate the table containing the relative frequency of the keywords for
% each corresponding database
T_rel_freq = array2table(Q, 'RowNames', row_labels, 'VariableNames', variable_labels);

% Let k ~ number of keywords to be chosen
k = 3; % from 1 to 10 theoretically

% choose k number from the number of keywords
keywords = unique([sort(randi([1, length(row_labels)], k, 1))]);

% ^^ are the corresponding rows of the matrix
% generate a vector whose ith entries are 1 / sqrt(k) whose e
% whose rows correspond to the keywords in keywords vector
x = zeros(length(row_labels), 1);
x(keywords) = round(1 / sqrt(length(keywords)), 3);

disp(size(x))
disp(size(Q))

% Let y = Q * x
% tells us the search optimality of the ith keyword in the jth Module
% y \in C(Q') --> y \in R(Q)
% yj corresponds to the ith row of Q
y = Q'* x; disp(size(y));

% Nmax = top N optimal modules for best search criteria for the k keywords
% Nmin = bottom N ...
Nmax = 3;
Nmin = 2;

% get indices of Nmax in search vector
[~, idx_max] = maxk(y, Nmax);
%... for Nmin
[~, idx_min] = mink(y, Nmin);

% Display results
fprintf('=======================================');
fprintf('\n Summary:');
fprintf('\n Search Vector: y = ');
disp(y);
fprintf('\n Top results for searching for the keywords: ');
disp(row_labels(keywords));
fprintf('\n Are the databases in the corresponding order: ');
disp(strcat('\n Top ', num2str(Nmax)));
disp(variable_labels(idx_max));
fprintf('\n Worst results for searching for the keywords: ');
disp(row_labels(keywords));
fprintf('\n Are the databases in the corresponding order: ');
disp(strcat('\n Worst ', num2str(Nmin)));
disp(variable_labels(idx_min));
fprintf('\n Remark: Not accounted for Polysomy and Synonymy');
fprintf('=======================================');

% export results to Latex
% create folder for Latex
%mkdir 5_1_Example_5
 
FolderDestination = '5_1_Example_5';
% % make a mfile in new path
addpath(FolderDestination);
f_path = fullfile(FolderDestination);
% % add variables into that m file 
% save(matfile);

% export data for LaTeX (optional for students);
table2latex(T_freq, strcat(f_path, '/Example_5_Table_Freq_Key_Words'));
table2latex(T_rel_freq, strcat(f_path, '/Example_5_Table_Rel_Freq_Key_Words'));
matrix2latex(A, strcat(f_path, '/Example_5_Matrix_Freq'));
matrix2latex(Q, strcat(f_path, '/Example_5_Matrix_Rel_Freq'));
matrix2latex(x, strcat(f_path, '/Example_5_Vector_x_search_vector'));
matrix2latex(y, strcat(f_path, '/Example_5_Vector_y_direction_vector'));



% ----------------------
% Example 6 -- Statistics, Correlation, and Covariance
row_labels = ["S1", "S2", "S3", "S4", "S5", "S6", "S7", "Average", "Variance"];
var_labels = ["Assignments", "Exams", "Final"];


% Create the Correlation Coefficient Matrix
C = U' * U;
C2 = V' * V;
Cov = X' * X / (length(X) - 1);

% visualize the correlation matrix as a heatmap
figure(8);
%set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
%set(0,'DefaultLineLineWidth', 1.25);
%box on; hold on; grid on;
imagesc(C); % Display correlation matrix as an image
set(gca, 'XTick', 1:length(C)); % center x-axis ticks on bins
set(gca, 'YTick', 1:length(C)); % center y-axis ticks on bins
set(gca, 'XTickLabel', var_labels); % set x-axis labels
set(gca, 'YTickLabel', var_labels); % set y-axis labels
title('Correlation', 'Interpreter', 'latex', 'FontSize', 18); % set title
colormap('PARULA'); % Choose jet or any other color scheme
%colorbar(gca, 'on'); % 

% Another way of obtaining it is:
% C_alt = corr(X);

% create a table
T = array2table(A, 'RowNames', row_labels, 'VariableNames', var_labels);

% create a folder
mkdir Example_6_Statistics
FolderDestination = 'Example_6_Statistics';
addpath(FolderDestination);
f_path = fullfile(FolderDestination);

% export the table
table2latex(T, strcat(f_path, '/Example_6_Table'));
matrix2latex(X, strcat(f_path, '/Example_6_Matrix_X'));
matrix2latex(U, strcat(f_path, '/Example_6_Matrix_U'));
matrix2latex(C, strcat(f_path, '/Example_6_Matrix_C'));
matrix2latex(Z, strcat(f_path, '/Example_6_Matrix_Z'));
matrix2latex(V, strcat(f_path, '/Example_6_Matrix_V'));
matrix2latex(C2, strcat(f_path, '/Example_6_Matrix_D'));
matrix2latex(Cov, strcat(f_path, '/Example_6_Matrix_Cov'));


% plot the data
figure();
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;
tiledlayout(2,1);

% generate a scatter plot :)
ax1 = nexttile;
box on; grid on;
s1 = scatter(ax1, X(:,1), X(:,2)); hold on;
s1.MarkerEdgeColor = 'b';
s1.MarkerFaceColor = 'k';
s1.SizeData = 50;
ylabel(var_labels(2), 'Interpreter', 'latex');
x = X(:,1);
y = X(:,2);
r = corr(x, y);
disp(r);
xbar = mean(x);
ybar = mean(y);
sy = sqrt(var(y));
sx = sqrt(var(x));
slope = r * sy / sx;
yint = ybar - slope * xbar;
yfit = slope * x + yint;
plot(x, yfit, 'r');



ax2 = nexttile;
box on; grid on;
s2 = scatter(ax2, X(:,1), X(:,3)); hold on;
s2.MarkerEdgeColor = 'b';
s2.MarkerFaceColor = 'k';
s2.SizeData = 50;
xlabel(var_labels(1), 'Interpreter', 'latex');
ylabel(var_labels(3), 'Interpreter', 'latex');
x = X(:,1);
y = X(:,3);
r = corr(x, y);
xbar = mean(x);
ybar = mean(y);
sy = sqrt(var(y));
sx = sqrt(var(x));
slope = r * sy / sx;
yint = ybar - slope * xbar;
yfit = slope * x + yint;
plot(x, yfit, 'r');


% plot the data
figure();
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;
tiledlayout(2,1);

% generate a scatter plot :)
ax1 = nexttile;
box on; grid on;
s1 = scatter(ax1, Z(:,1), Z(:,2)); hold on;
s1.MarkerEdgeColor = 'b';
s1.MarkerFaceColor = 'k';
s1.SizeData = 50;
ylabel(var_labels(2), 'Interpreter', 'latex');
x = Z(:,1);
y = Z(:,2);
r = corr(x, y);
disp(r);
xbar = mean(x);
ybar = mean(y);
sy = sqrt(var(y));
sx = sqrt(var(x));
slope = r * sy / sx;
yint = ybar - slope * xbar;
yfit = slope * x + yint;
plot(x, yfit, 'r');



ax2 = nexttile;
box on; grid on;
s2 = scatter(ax2, Z(:,1), Z(:,3)); hold on;
s2.MarkerEdgeColor = 'b';
s2.MarkerFaceColor = 'k';
s2.SizeData = 50;
xlabel(var_labels(1), 'Interpreter', 'latex');
ylabel(var_labels(3), 'Interpreter', 'latex');
x = Z(:,1);
y = Z(:,3);
r = corr(x, y);
xbar = mean(x);
ybar = mean(y);
sy = sqrt(var(y));
sx = sqrt(var(x));
slope = r * sy / sx;
yint = ybar - slope * xbar;
yfit = slope * x + yint;
plot(x, yfit, 'r');

% ----------------------
% Example 7 -- Psychology
row_labels = ["Classics", "French", "English", "Math", "Music"];
var_labels = row_labels;
X1 = [1 0.83 0.78 0.70 0.63];
X2 = [0.83 1 0.67 0.67 0.57];
X3 = [0.78 0.67 1 0.64 0.51];
X4 = [0.70 0.67 0.64 1 0.51];
X5 = [0.63 0.57 0.51 0.51 1];
% Generate the Spearman correlation Matrix
C = [X1; X2; X3; X4; X5];
% Spearman observed a descending trend across the row and/or column of the
% matrix
% The Correlation matrix appears to be hierarchly classified
% according to its structure
% He hypothesized that the intellectual activity 
% have fundamental function in common
% verbal comprehension, spatial, perceptual, and associative memory
% all can be used to describe the hypothetical factors
% we will use Principal Component Analysis (PCA) to determine the weight of the
% underlying hypothetical factors
% Factor: C = U * W 
% where U corresponds to the factors
% W measures the extent each test dependds on the factors

% PCA will depend on C:
% Take: S = 1/(n-1) * C' C
S = C' * C / (length(C) - 1);

T = array2table(C, 'RowNames', row_labels, 'VariableNames', var_labels);

% export data
% create a folder
mkdir Example_7_Psychology
FolderDestination = 'Example_7_Psychology';
addpath(FolderDestination);
f_path = fullfile(FolderDestination);

% export the table
table2latex(T, strcat(f_path, '/Example_7_Psychology'));
end