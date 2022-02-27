function pca_example
figure(1);
set(0,'DefaultAxesFontSize',20);set(gca,'FontSize',20);% increase font size
set(0,'DefaultLineLineWidth', 1.25);
box on; hold on; grid on;

X1 = [1 0.83 0.78 0.70 0.63];
X2 = [0.83 1 0.67 0.67 0.57];
X3 = [0.78 0.67 1 0.64 0.51];
X4 = [0.70 0.67 0.64 1 0.51];
X5 = [0.63 0.57 0.51 0.51 1];
% Generate the Spearman correlation Matrix
X = [X1; X2; X3; X4; X5];

[coeff,score,latent] = pca(X);
% coeff ~ principal component coefficients
% score ~ pc scores
% latent ~ variances of the components

% each column of the score corresponds to 1 principal component
Xcentered = score * coeff';

biplot(coeff(:,1:2),'scores',score(:,1:2),'varlabels',{'Classics', 'French', 'English', 'Math', 'Music'});
xline(0, 'k');
yline(0, 'k');
xlabel('Component 1', 'Interpreter', 'latex');
ylabel('Component 2', 'Interpreter', 'latex');
end