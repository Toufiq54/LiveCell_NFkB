% This script is written to generate the CONFUSION MATRIX for differnt ML
% classifers.
clc
clear all
close all
% Get the data
datafolder1 = 'T:\LMBI\021Transcription_Systems_Dynamics_and_Biology\Toufiq\R studio project\DKin project2\Confusion matrix\confusion matrix 10fold_CV';
datafolder2 = 'T:\LMBI\021Transcription_Systems_Dynamics_and_Biology\Toufiq\R studio project\DKin project2\Confusion matrix\KernelKNN_10fold_CV_confusionMatrix';
outputFolder = 'T:\LMBI\021Transcription_Systems_Dynamics_and_Biology\Toufiq\R studio project\DKin project2\Figures'; 
addpath ('E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Scripts');
% Change the working directory
cd (datafolder1);
for i = 1:10
oconAC_LDA (:,:,i) = xlsread (['Confusion_LDA_RelA_&cRel_',num2str(i),'.CSV']);
oconA_LDA (:,:,i) = xlsread (['Confusion_LDA_RelA_',num2str(i),'.CSV']);
end
cd (datafolder2);
for i =1:10
oconAC_KNN (:,:,i) = xlsread (['Confusion_RelA&cRelKNN_canberra_k=7_',num2str(i),'.CSV']);
oconA_KNN (:,:,i) = xlsread (['Confusion_RelAKNN_canberra_k=7_',num2str(i),'.CSV']);
end

% Make the parcentage confusion matrix
for i = 1:10
conAC_KNN (:,:,i) = 100.*(oconAC_KNN(:,:,i)./((sum(oconAC_KNN(:,:,i)).*ones(size(oconAC_KNN(:,:,i))))));
conA_KNN (:,:,i) = 100.*(oconA_KNN(:,:,i)./((sum(oconA_KNN(:,:,i)).*ones(size(oconA_KNN(:,:,i))))));
conAC_LDA (:,:,i) = 100.*(oconAC_LDA(:,:,i)./((sum(oconAC_LDA(:,:,i)).*ones(size(oconAC_LDA(:,:,i))))));
conA_LDA (:,:,i) = 100.*(oconA_LDA(:,:,i)./((sum(oconA_LDA(:,:,i)).*ones(size(oconA_LDA(:,:,i))))));
end
%
% conAC_KNN = oconAC_KNN;
% conA_KNN = oconA_KNN;
% conAC_LDA = oconAC_LDA;
% conA_LDA = oconA_LDA;

% get the stat of confusion matrix
mconAC_KNN = mean(conAC_KNN,3); % mean
mconA_KNN = mean(conA_KNN,3);
mconAC_LDA = mean(conAC_LDA,3);
mconA_LDA = mean(conA_LDA,3);

sconAC_KNN = (std(conAC_KNN,0,3))./sqrt(10); % standard error 
sconA_KNN = (std(conA_KNN,0,3))./sqrt(10);
sconAC_LDA = (std(conAC_LDA,0,3))./sqrt(10);
sconA_LDA = (std(conA_LDA,0,3))./sqrt(10);

cuconAC_KNN = 1.96.*sconAC_KNN + mconAC_KNN;
cuconA_KNN = 1.96.*sconA_KNN + mconA_KNN;
cuconAC_LDA = 1.96.*sconAC_LDA + mconAC_LDA;
cuconA_LDA = 1.96.*sconA_LDA + mconA_LDA;

clconAC_KNN =  mconAC_KNN - 1.96.*sconAC_KNN;
clconA_KNN =  mconA_KNN -1.96.*sconA_KNN;
clconAC_LDA =  mconAC_LDA - 1.96.*sconAC_LDA;
clconA_LDA =  mconA_LDA - 1.96.*sconA_LDA;
%%
% Colormap for the heatmap
mycolormap = jet;%customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);

% Generate heatmap
set(gcf,'Units','inches',...
 'Position',[0 0 10 8])

hAxis1 = subplot (2,2,1);
xvar = {'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF'};
heatmap2 (mconA_KNN,xvar,xvar,'Gridlines','-')
colormap (mycolormap)
caxis([0 100])
set (gca,'FontSize',14)
% Add upper and lower bound in each cell of heatmap
% Add the significance values in heatmap

for i = 1:size(mconA_KNN,1)
  for j = 1:size(mconA_KNN,2)
      ind1 = round(1 + ((256-1)/(100-0))*(cuconA_KNN(i,j)));
      if ind1<1
          ind1=1;
      end
      
%       rectangle('Position',[j-0.05,i-0.4,0.15,0.15],'FaceColor',mycolormap(ind1,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i-0.45,0.9,0.18],'FaceColor',mycolormap(ind1,:),'EdgeColor',mycolormap(ind1,:));
       ind2 = round(1 + ((256-1)/(100-0))*(clconA_KNN(i,j)));
        if ind2<1
          ind2=1;
        end
%        rectangle('Position',[j-0.05,i+0.3,0.15,0.15],'FaceColor',mycolormap(ind2,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i+0.28,0.9,0.18],'FaceColor',mycolormap(ind2,:),'EdgeColor',mycolormap(ind2,:));
       clear ind1 ind2
  end
end

    
       
       
hAxis2 = subplot (2,2,2);
xvar = {'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF'};
heatmap2 (mconAC_KNN,xvar,xvar,'Gridlines','-')
colormap (mycolormap)
caxis([0 100])
set (gca,'FontSize',14)
% Add the significance values in heatmap

for i = 1:size(mconAC_KNN,1)
  for j = 1:size(mconAC_KNN,2)
      ind1 = round(1 + ((256-1)/(100-0))*(cuconAC_KNN(i,j)));
      if ind1<1
          ind1=1;
      end
%       rectangle('Position',[j-0.05,i-0.4,0.15,0.15],'FaceColor',mycolormap(ind1,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i-0.45,0.9,0.18],'FaceColor',mycolormap(ind1,:),'EdgeColor',mycolormap(ind1,:));
       ind2 = round(1 + ((256-1)/(100-0))*(clconAC_KNN(i,j)));
        if ind2<1
          ind2=1;
        end
%        rectangle('Position',[j-0.05,i+0.3,0.15,0.15],'FaceColor',mycolormap(ind2,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i+0.28,0.9,0.18],'FaceColor',mycolormap(ind2,:),'EdgeColor',mycolormap(ind2,:));
  clear ind1 ind2
  end
end

hAxis3 = subplot (2,2,3);
xvar = {'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF'};
heatmap2 (mconA_LDA,xvar,xvar,'Gridlines','-')
colormap (mycolormap)
caxis([0 100])
set (gca,'FontSize',14)
% Add the significance values in heatmap
 
for i = 1:size(mconA_LDA,1)
  for j = 1:size(mconA_LDA,2)
      ind1 = round(1 + ((256-1)/(100-0))*(cuconA_LDA(i,j)));
      if ind1<1
          ind1=1;
      end
      %rectangle('Position',[j-0.05,i-0.4,0.15,0.15],'FaceColor',mycolormap(ind1,:),'EdgeColor',[.7 .7 .7]);
      rectangle('Position',[j-0.45,i-0.45,0.9,0.18],'FaceColor',mycolormap(ind1,:),'EdgeColor',mycolormap(ind1,:));
       ind2 = round(1 + ((256-1)/(100-0))*(clconA_LDA(i,j)));
        if ind2<1
          ind2=1;
        end
%        rectangle('Position',[j-0.05,i+0.3,0.15,0.15],'FaceColor',mycolormap(ind2,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i+0.28,0.9,0.18],'FaceColor',mycolormap(ind2,:),'EdgeColor',mycolormap(ind2,:));
  end
end

hAxis4 = subplot (2,2,4);
xvar = {'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF'};
heatmap2 (mconAC_LDA,xvar,xvar,'Gridlines','-')

colormap (mycolormap)
caxis([0 100])
set (gca,'FontSize',14)
% Add the significance values in heatmap
 
for i = 1:size(mconAC_LDA,1)
  for j = 1:size(mconAC_LDA,2)
      ind1 = round(1 + (((256-1)/(100-0))*(cuconAC_LDA(i,j))));
      if ind1<1
          ind1=1;
      end
%       rectangle('Position',[j-0.05,i-0.4,0.15,0.15],'FaceColor',mycolormap(ind1,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i-0.45,0.9,0.18],'FaceColor',mycolormap(ind1,:),'EdgeColor',mycolormap(ind1,:));
       ind2 = round(1 + (((256-1)/(100-0))*(clconAC_LDA(i,j))));
        if ind2<1
          ind2=1;
        end
%        rectangle('Position',[j-0.05,i+0.3,0.15,0.15],'FaceColor',mycolormap(ind2,:),'EdgeColor',[.7 .7 .7]);
        rectangle('Position',[j-0.45,i+0.28,0.9,0.18],'FaceColor',mycolormap(ind2,:),'EdgeColor',mycolormap(ind2,:));
  end
end


set (gca,'FontSize',14)
c=colorbar;
c.Position = [0.925 0.15 0.02 0.78];

% Save figure in the output directory
cd (outputFolder);
exportgraphics(gcf,['ConfusionMatrix_heatmap_10foldrandom_with_ligand_specific_train','.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,['ConfusionMatrix_heatmap_10foldrandom_with_ligand_specific_train' ,'.tif'],'Resolution',300);  % Saving as .tif file 
close

%% Calculate the F1-Score, Accuracy, Specificity, Recall, Precision for each ligand
for i = 1:10
[prec_knn_A(i,:), sens_knn_A(i,:),spec_knn_A(i,:),acc_knn_A(i,:),f1_knn_A(i,:)] = EvaluateConfusion (conA_KNN(:,:,i));
[prec_knn_AC(i,:), sens_knn_AC(i,:),spec_knn_AC(i,:),acc_knn_AC(i,:),f1_knn_AC(i,:)] = EvaluateConfusion (conAC_KNN(:,:,i));

[prec_lda_A(i,:), sens_lda_A(i,:),spec_lda_A(i,:),acc_lda_A(i,:),f1_lda_A(i,:)] = EvaluateConfusion (conA_LDA(:,:,i));
[prec_lda_AC(i,:), sens_lda_AC(i,:),spec_lda_AC(i,:),acc_lda_AC(i,:),f1_lda_AC(i,:)] = EvaluateConfusion (conAC_LDA(:,:,i));
end
%%
figure (4);
set(gcf,'Units','inches',...
 'Position',[0 0 6 3])

% bar(1:7,([mean(prec_knn_A);mean(prec_knn_AC);mean(prec_lda_A);mean(prec_lda_AC)])');
% axis ([0.4 7.5 0 1])


% calculate the errorbar
CI = [1.96.*(std(prec_knn_A))./(sqrt(10));(1.96.*(std(prec_knn_AC)))./(sqrt(10));1.96.*(std(prec_lda_A))./(sqrt(10));1.96.*(std(prec_knn_AC))./(sqrt(10))];
LB = ([mean(prec_knn_A);mean(prec_knn_AC);mean(prec_lda_A);mean(prec_lda_AC)])' - CI';
HB = ([mean(prec_knn_A);mean(prec_knn_AC);mean(prec_lda_A);mean(prec_lda_AC)])' + CI';
%errorbar_plot
y= ([mean(prec_knn_A);mean(prec_knn_AC);mean(prec_lda_A);mean(prec_lda_AC)])';
%Double with errorbar

b = bar(y,'grouped');
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(y);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',y,CI','k','linestyle','none');%Adding the errorbars
xticklabels ({'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF-\alpha'})
ylabel ('Precision');
set (gca,'FontSize',14)
xtickangle(45)
box off
axis ([0.5 7.5 0 1]);

% Save figure
cd (outputFolder);
exportgraphics(gcf,['Precision_knn_70_30_10foldrandom_wt_ligand_specific_train','.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,['Precision_knn_70_30_10foldrandom_wt_ligand_specific_train' ,'.tif'],'Resolution',300);  % Saving as .tif file 
close
%%

figure (5);
set(gcf,'Units','inches',...
 'Position',[0 0 6 3])

% calculate the errorbar
CI = [1.96.*(std(sens_knn_A))./(sqrt(10));(1.96.*(std(sens_knn_AC)))./(sqrt(10));1.96.*(std(sens_lda_A))./(sqrt(10));1.96.*(std(sens_knn_AC))./(sqrt(10))];
%errorbar_plot
y= ([mean(sens_knn_A);mean(sens_knn_AC);mean(sens_lda_A);mean(sens_lda_AC)])';
%Double with errorbar

b = bar(y,'grouped');
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(y);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',y,CI','k','linestyle','none');%Adding the errorbars
xticklabels ({'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF-\alpha'})
ylabel ('Sensitivity');
set (gca,'FontSize',14)
xtickangle(45)
box off
axis ([0.5 7.5 0 1]);
% Save figure
cd (outputFolder);
exportgraphics(gcf,['Sensitivity_knn_70_30_10foldrandom_wt_ligand_specific_train','.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,['Sensitivity_knn_70_30_10foldrandom_wt_ligand_specific_train' ,'.tif'],'Resolution',300);  % Saving as .tif file 
close
%%
figure (6);
set(gcf,'Units','inches',...
 'Position',[0 0 6 3])

% calculate the errorbar
CI = [1.96.*(std(spec_knn_A))./(sqrt(10));(1.96.*(std(spec_knn_AC)))./(sqrt(10));1.96.*(std(spec_lda_A))./(sqrt(10));1.96.*(std(spec_knn_AC))./(sqrt(10))];
%errorbar_plot
y= ([mean(spec_knn_A);mean(spec_knn_AC);mean(spec_lda_A);mean(spec_lda_AC)])';
%Double with errorbar

b = bar(y,'grouped');
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(y);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',y,CI','k','linestyle','none');%Adding the errorbars
xticklabels ({'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF-\alpha'})
ylabel ('Specificity');
set (gca,'FontSize',14)
xtickangle(45)
box off
axis ([0.5 7.5 0 1]);
% Save figure
cd (outputFolder);
exportgraphics(gcf,['Specificity_knn_70_30_10foldrandom_wt_ligand_specific_train','.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,['Specificity_knn_70_30_10foldrandom_wt_ligand_specific_train' ,'.tif'],'Resolution',300);  % Saving as .tif file 
close
%%
figure (7);
set(gcf,'Units','inches',...
 'Position',[0 0 6 3])

% calculate the errorbar
CI = [1.96.*(std(f1_knn_A))./(sqrt(10));(1.96.*(std(f1_knn_AC)))./(sqrt(10));1.96.*(std(f1_lda_A))./(sqrt(10));1.96.*(std(f1_knn_AC))./(sqrt(10))];
%errorbar_plot
y= ([mean(f1_knn_A);mean(f1_knn_AC);mean(f1_lda_A);mean(f1_lda_AC)])';
%Double with errorbar

b = bar(y,'grouped');
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(y);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',y,CI','k','linestyle','none');%Adding the errorbars
xticklabels ({'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK4','TNF-\alpha'})
ylabel ('F1-score');
set (gca,'FontSize',14)
xtickangle(45)
box off
axis ([0.5 7.5 0 1]);
% Save figure
cd (outputFolder);
exportgraphics(gcf,['F1_score_knn_70_30_10foldrandom_wt_ligand_specific_train','.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,['F1_score_knn_70_30_10foldrandom_wt_ligand_specific_train' ,'.tif'],'Resolution',300);  % Saving as .tif file 
close

%% Plot overall F1-score KNN (RelA, RelA+cRel), LDA(RelA, RelA+cRel)

clear CI y x ngroups nbars
figure (7);
set(gcf,'Units','inches',...
 'Position',[0 0 4 4])

% calculate the errorbar
CI = mean(([1.96.*(std(f1_knn_A))./(sqrt(10));(1.96.*(std(f1_knn_AC)))./(sqrt(10));1.96.*(std(f1_lda_A))./(sqrt(10));1.96.*(std(f1_knn_AC))./(sqrt(10))])',1);
se = mean(([(std(f1_knn_A))./(sqrt(10));((std(f1_knn_AC)))./(sqrt(10));(std(f1_lda_A))./(sqrt(10));(std(f1_knn_AC))./(sqrt(10))])',1);
sd = mean(([(std(f1_knn_A));((std(f1_knn_AC)));(std(f1_lda_A));(std(f1_knn_AC))])',1);

%errorbar_plot
y= mean(([mean(f1_knn_A);mean(f1_knn_AC);mean(f1_lda_A);mean(f1_lda_AC)])',1);
%Double with errorbar

b = bar(y);
b.FaceColor = 'flat';
b.CData(1,:) = [0/255 112/255 189/255];
b.CData(2,:) = [217/255 81/255 23/255];
b.CData(3,:) = [235/255 176/255 30/255];
b.CData(4,:) = [125/255 46/255 140/255];
hold on

errorbar(1:4,y,se','k','linestyle','none');%Adding the errorbars
xticklabels ({'KNN(RelA)','KNN(RelA+c-Rel)','LDA(RelA)','LDA(RelA+c-Rel)'})
ylabel ('F1-score');
set (gca,'FontSize',14)
xtickangle(45)
box off
% % Mann-Whitney U-test p value 
% p = ttest2 (mean(f1_knn_A)',mean(f1_knn_AC)')
% sigstar1({[1,2]},[p]);

axis ([0.5 4.5 .0 0.85]);
%% Save figure
cd (outputFolder);
exportgraphics(gcf,['Overall_F1_score_knn_70_30_10foldrandom_KNN_A_AC_LDA_A_AC','.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,['Overall_F1_score_knn_70_30_10foldrandom_KNN_A_AC_LDA_A_AC' ,'.tif'],'Resolution',300);  % Saving as .tif file 
close
