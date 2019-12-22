
%title('Miles per Gallon by Vehicle Origin')
%xlabel('Country of Origin')
%ylabel('Miles per Gallon (MPG)')

%A=[94.15, 97.07, 96.48, 96.23, 97.22, 98.13, 97.98, 96.93, 97.07, 97.12, 95.88, 96.83, 97.60, 97.64, 82.56];
S1 = [3.95, 4, 4.05];
S2 = [3.95, 4, 4.05];
S3 = [2.089, 2.110, 2.1900];
S4 = [3.95, 4, 4.05];
S5 = [3.9, 4, 4.1];
S6 = [2.579, 2.6180, 2.6950];
S7 = [3.09, 3.1118, 3.1657];
S8 = [2.00500, 2.1552, 2.204];
S9 = [1.792, 1.8444, 1.999];
S10 = [3.9141 , 3.9872, 4.063];

bayes=[93.14, 94.15, 95.16]; %Ex: bayes=[desvio padrão, acurácia, desvio padrão]; 
knn1=[96.47, 97.07, 97.67];
knn3=[95.55, 96.48, 97.41];
knn5=[95.49, 96.23, 96.97];
opf1=[96.58, 97.22, 97.86];
opf2=[97.95, 98.13, 98.31];
opf3=[97.42, 97.98, 98.54];
opf4=[96.67, 96.93, 97.19];
opf5=[96.81, 97.07, 97.33];
mlp1=[96.19, 95.88, 96.57];
mlp2=[96.43, 97.12, 97.81];
svmLinear=[96.6, 96.83, 97.06];
svmRBF=[97.16, 97.60, 98.04];
svmPoly=[96.95, 97.64, 98.33];
svmSig=[81.87, 82.56, 83.25];

%A=[bayes,knn1,knn3,knn5,opf1,opf2,opf3,opf4,opf5,mlp1,mlp2,svmLinear,svmRBF,svmPoly]; 
A=[S1,S2,S3,S4,S5,S6,S7,S8,S9,S10]; 

%x='Bayes';
gA={'Bayes','Bayes','Bayes'};
gB={'KNN (1)','KNN (1)','KNN (1)'};
gC={'KNN (3)','KNN (3)','KNN (3)'};
gD={'KNN (5)','KNN (5)','KNN (5)'};
gE={'OPF (Squared)','OPF (Squared)','OPF (Squared)'};
gF={'OPF (Canberra)','OPF (Canberra)','OPF (Canberra)'};
gG={'OPF (Manhatan)','OPF (Manhatan)','OPF (Manhatan)'};
gH={'OPF (Gaussian)','OPF (Gaussian)','OPF (Gaussian)'};
gI={'OPF (Euclidean)','OPF (Euclidean)','OPF (Euclidean)'};
gJ={'MLP (1)','MLP (1)','MLP (1)'};
gK={'MLP (2)','MLP (2)','MLP (2)'};
gL={'SVM (Linear)','SVM (Linear)','SVM (Linear)'};
gM={'SVM (RBF)','SVM (RBF)','SVM (RBF)'};
gN={'SVM (Poly)','SVM (Poly)','SVM (Poly)'};
%gO={'SVM(Sigmoid)','SVM(Sigmoid)','SVM(Sigmoid)'};

hA={'S1','S1','S1'};
hB={'S2','S2','S2'};
hC={'S3','S3','S3'};
hD={'S4','S4','S4'};
hE={'S5','S5','S5'};
hF={'S6','S6','S6'};
hG={'S7','S7','S7'};
hH={'S8','S8','S8'};
hI={'S9','S9','S9'};
hJ={'S10','S10','S10'};

%group = [gA,gB,gC,gD,gE,gF,gG,gH,gI,gJ,gK,gL,gM,gN];
group = [hA,hB,hC,hD,hE,hF,hG,hH,hI,hJ];

boxplot(A,group,'factorseparator',1);
set(0,'DefaultAxesFontName', 'Times New Roman');
%xlabel('Classificadores');
ylabel('Medição do sonar (m)');
xlabel('Sensor');
title('Verificação do sonar de forma completa');
%grid minor;
%grid on;


 %get the text labels
textobjs=findobj(gca,'type','text');

%rotate the text
set(textobjs,'rotation',69);

%change the font size
set(textobjs,'fontsize',10);

%change the position of the text
offset_amount = [0 8 0];
temptextpositions = get(textobjs,'position');
for n = 1 : length(textobjs)
    set(textobjs(n),'position',get(textobjs(n),'position')+offset_amount);
end

%this makes it so that the labels will stay in the same relative position
%on the figure, scaling when the figure is resized
set(textobjs,'units','data');

%code from source 1. This does something conceptually equivalent to 
%removing the link that the text has to the boxplot, creating a copy of the
%text, and deleting the original text. (correct me if I'm wrong).
copyobj(textobjs,gca);
delete(textobjs);