function plot_linear_transformation
close all;
figure(1);
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

% Generate a 2 x 2 array of random integers
values_i = randi([-5,5], 2);
% Vectors are columns of array
xi = values_i(:,1); 
xi = [0; 0];
yi = values_i(:,2);
yi = xi;

% Generate values for distance
values_f = randi([-5, 5], 2);
xf = values_f(:,1);
yf = values_f(:,2);


% generate arrows
xlim([-6, 6]);
ylim([-6, 6]);
arrow(xi, xf-xi);
arrow(xi, yf-xi);
xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');

% Initialize Defaults for function
alpha = 1; theta = pi / 2;
function z =  Linear_Transformation(kind, x, alpha, theta)
    % performs Linear Transformation on a Vector
    % Inputs: 
    % kind: Rotation, Reflection-x, Reflection-y, Scale
    % alpha: Real Number -- Scales x
    % x: Column Vector w/ 2 Components
    % theta: Real Number -- Angle Rotated
    if strcmp(kind, 'Reflection-x')
        xnew = [x(1); -1 * x(2)];
    elseif strcmp(kind, 'Reflection-y')
        xnew = [-1 * x(1); x(2)];
    elseif strcmp(kind, 'Scale')
        xnew = [alpha * x(1); alpha * x(2)];
    elseif strcmp(kind, 'Rotation')
        xnew = [x(1) * cos(theta) - x(2) * sin(theta); x(1) * sin(theta) + x(2) * cos(theta)];
    elseif strcmp(kind, 'RotationCW')
        xnew = [x(2); -1 * x(1)];
    elseif strcmp(kind, 'RotationCCW')
        xnew = [-1 * x(2); x(1)];
    else 
        xnew = x;
    end
    z = xnew;
end

% perform Linear Transformation
% -----------------------------
% Ex 1: Scale by alpha
x = xf-xi;
y = yf - yi;
alpha = 1.5; beta = 0.50;
kind = 'Scale';
znew = Linear_Transformation(kind, x, alpha);
ynew = Linear_Transformation(kind, y, beta);

fprintf('Performed a Linear Transformation');
figure(2); hold on;
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

dis_max = max([norm(ynew), norm(znew)]);
xlim([-dis_max * 1.15, dis_max * 1.15]);
ylim([-dis_max * 1.15, dis_max * 1.15]);
arrow(xi, xf);
arrow(yi, yf);
arrow(xi, znew-xi);
arrow(yi, ynew-yi);
arrow(znew-xi,znew-xi + ynew);
arrow(ynew-yi, ynew-yi + znew);
arrow(xi, znew + ynew);

xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');        

% --------------------------
% Ex 3: Reflect across x-axis
x = xf-xi;
y = yf - yi;
alpha = 1.25; beta = 0.75;
kind = 'Reflection-x';
znew = Linear_Transformation(kind, x, alpha);
ynew = Linear_Transformation(kind, y, beta);

fprintf('Performed a Linear Transformation');
figure(3); hold on;
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

dis_max = max([norm(ynew), norm(znew)]);
xlim([-dis_max * 1.15, dis_max * 1.15]);
ylim([-dis_max * 1.15, dis_max * 1.15]);
arrow(xi, xf);
arrow(yi, yf);
arrow(xi, znew-xi);
arrow(yi, ynew-yi);
arrow(znew-xi,znew-xi + ynew);
arrow(ynew-yi, ynew-yi + znew);
arrow(xi, znew + ynew);

xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');        


% --------------------------
% Ex 4: Rotation 90 deg CW
x = xf-xi;
y = yf - yi;
alpha = 1.25; beta = 0.75;
theta = pi / 2;
kind = 'RotationCCW';
znew = Linear_Transformation(kind, x, alpha, theta);
ynew = Linear_Transformation(kind, y, beta, theta);

fprintf('Performed a Linear Transformation');
figure(4); hold on;
set(0,'DefaultAxesFontSize',24);set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

dis_max = max([norm(ynew), norm(znew)]);
xlim([-dis_max * 1.15, dis_max * 1.15]);
ylim([-dis_max * 1.15, dis_max * 1.15]);
arrow(xi, xf);
arrow(yi, yf);
arrow(xi, znew-xi);
arrow(yi, ynew-yi);
arrow(znew-xi,znew-xi + ynew);
arrow(ynew-yi, ynew-yi + znew);
arrow(xi, znew + ynew);

xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');        


% --------------------------
% Ex 5: Scaling the triangle
T = randi([-5, 5], 2, 4); % Generate a Random Triangle
T(:,1) = [0; 0]; % start: origin
T(:,end) = T(:,1); % finish: origin

% vertices
A = T(:,1);
B = T(:,2);
C = T(:,3);

% Sides
x = A - C;
y = B - A;
z = C - B;


alpha = 1.5;
beta = 0.75;
theta = pi / 2;
kind = 'Scale';
xt = Linear_Transformation(kind, x, alpha, theta);
yt = Linear_Transformation(kind, y, alpha, theta);
zt = Linear_Transformation(kind, z, alpha, theta);

xd = Linear_Transformation(kind, x, beta, theta);
yd = Linear_Transformation(kind, y, beta, theta);
zd = Linear_Transformation(kind, z, beta, theta);

fprintf('Triangle Operation :)');
figure(5); hold on;
set(0,'DefaultAxesFontSize',24); set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

dis_max = max([norm(xt), norm(yt), norm(zt)]);
xlim([-dis_max * 1.15, dis_max * 1.15]);
ylim([-dis_max * 1.15, dis_max * 1.15]);

arrow(A, A + xt);
arrow(A + xt, A + xt + yt);
arrow(A + xt + yt, A + xt + yt + zt);

arrow(A, A + x);
arrow(A + x, A + x + y);
arrow(A + x + y, A + x + y + z);

arrow(A, A + xd);
arrow(A + xd, A + xd + yd);
arrow(A + xd + yd, A + xd + yd + zd);


xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');        


% --------------------------
% Ex 6: Reflecting a Triangle about y-axis
T = randi([-5, 5], 2, 4); % Generate a Random Triangle
T(:,1) = [0; 0]; % start: origin
T(:,end) = T(:,1); % finish: origin

alpha = 1;
beta = 1;
theta = pi / 2;

% vertices
A = T(:,1);
B = T(:,2);
C = T(:,3);

kind = 'Reflection-y';
At = Linear_Transformation(kind, A, alpha, theta);
Bt = Linear_Transformation(kind, B, alpha, theta);
Ct = Linear_Transformation(kind, C, alpha, theta);

kind = 'Reflection-x';
Ad = Linear_Transformation(kind, A, alpha, theta);
Bd = Linear_Transformation(kind, B, alpha, theta);
Cd = Linear_Transformation(kind, C, alpha, theta);


% Sides
x = A - C;
y = B - A;
z = C - B;


alpha = 1;
beta = 1;
theta = pi / 2;
kind = 'Reflection-y';
xt = Linear_Transformation(kind, x, alpha, theta);
yt = Linear_Transformation(kind, y, alpha, theta);
zt = Linear_Transformation(kind, z, alpha, theta);

kind = 'Reflection-x';
xd = Linear_Transformation(kind, x, alpha, theta);
yd = Linear_Transformation(kind, y, alpha, theta);
zd = Linear_Transformation(kind, z, alpha, theta);

fprintf('Triangle Operation :)');
figure(6); hold on;
set(0,'DefaultAxesFontSize',24); set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

dis_max = max([norm(xt), norm(yt), norm(zt)]);
xlim([-dis_max * 1.15, dis_max * 1.15]);
ylim([-dis_max * 1.15, dis_max * 1.15]);

arrow(At, At + xt);
arrow(At + xt, At + xt + yt);
arrow(At + xt + yt, At + xt + yt + zt);

arrow(A, A + x);
arrow(A + x, A + x + y);
arrow(A + x + y, A + x + y + z);

arrow(Ad, Ad + xd);
arrow(Ad + xd, Ad + xd + yd);
arrow(Ad + xd + yd, Ad + xd + yd + zd);


xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');        



% --------------------------
% Ex 7: Rotating a Triangle by angle of theta
T = randi([-5, 5], 2, 4); % Generate a Random Triangle
T(:,1) = [0; 0]; % start: origin
T(:,end) = T(:,1); % finish: origin

alpha = 1;
beta = 1;
theta = pi / 4;

% vertices
A = T(:,1);
B = T(:,2);
C = T(:,3);

kind = 'Rotation';
At = Linear_Transformation(kind, A, alpha, theta);
Bt = Linear_Transformation(kind, B, alpha, theta);
Ct = Linear_Transformation(kind, C, alpha, theta);

Ad = Linear_Transformation(kind, A, alpha, -theta);
Bd = Linear_Transformation(kind, B, alpha, -theta);
Cd = Linear_Transformation(kind, C, alpha, -theta);


% Sides
x = A - C;
y = B - A;
z = C - B;


alpha = 1;
beta = 1;
theta = pi / 2;
kind = 'Rotation';
xt = Linear_Transformation(kind, x, alpha, theta);
yt = Linear_Transformation(kind, y, alpha, theta);
zt = Linear_Transformation(kind, z, alpha, theta);

kind = 'Rotation';
xd = Linear_Transformation(kind, x, alpha, -theta);
yd = Linear_Transformation(kind, y, alpha, -theta);
zd = Linear_Transformation(kind, z, alpha, -theta);

fprintf('Triangle Operation :)');
figure(7); hold on;
set(0,'DefaultAxesFontSize',24); set(gca,'FontSize',24);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on;

dis_max = max([norm(xt), norm(yt), norm(zt)]);
xlim([-dis_max * 1.15, dis_max * 1.15]);
ylim([-dis_max * 1.15, dis_max * 1.15]);

arrow(At, At + xt);
arrow(At + xt, At + xt + yt);
arrow(At + xt + yt, At + xt + yt + zt);

arrow(A, A + x);
arrow(A + x, A + x + y);
arrow(A + x + y, A + x + y + z);

arrow(Ad, Ad + xd);
arrow(Ad + xd, Ad + xd + yd);
arrow(Ad + xd + yd, Ad + xd + yd + zd);


xline(0, 'k');
yline(0, 'k');
xlabel('x-axis', 'interpreter', 'latex');
ylabel('y-axis', 'interpreter', 'latex');        



end