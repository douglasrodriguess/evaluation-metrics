clear; clc; close all;
titulo_extrator = {'Accuracy (%)', 'Specificity (%)', 'Positive Predictive Values (PPV) (%)', 'Sensitivity (%)'};

dados(:,:, 1) = load('acuracia.txt');
dados(:,:, 2) = load('spe.txt');
dados(:,:, 3) = load('ppv.txt');
dados(:,:, 4) = load('sens.txt');

for i = 1 : size(dados,3)
   figure('name', titulo_extrator{i});

   values = dados(:,1,i)';
   errors = dados(:,2,i)';

   % bar(values, 'FaceColor', [.88 .88 .88], 'EdgeColor', [0 .9 .9], 'LineWidth', 1.5)
   % bar(values, 'FaceColor', [.50 .50 .50], 'EdgeColor', [0 .9 .9], 'LineWidth', 1.5)
    bar(values, 'FaceColor', [.6 .6 0], 'EdgeColor', [0.5 0.5 0.5], 'LineWidth', 1.5)
   l = {'Bray','Canb','Eucl', 'Gaus', 'Manh', 'Squa', 'Line', 'Rbf', 'Poly', 'Bayes', 'K1', 'K3', 'K5', 'M1', 'M2'};
   set(gca,'xticklabel', l,  'FontSize', 12);
   set(gca,'ygrid','on')
   
   ylabel(titulo_extrator{i}, 'FontSize', 20, 'interpreter','latex')
   xlabel('Classifiers', 'FontSize', 20, 'interpreter','latex')

   hold on
   xmax=0:(size(values,1)+max(size(values)));
   ymax = repmat(max(values(:)), 1, length(xmax));
   plot(xmax, ymax, '--', 'LineWidth',2, 'Color', [0,0.1,0.1])
    
   set(gcf,'units','normalized','outerposition',[0 0 1 1])
   h = errorbar(values, errors, '.', 'Color', [0,0,0]);
end