% This script is written to plot the young and old BMDM data quantification
% in the same plot. The young will be black and white viollin plot and the
% the old will be red in color. 

% Written by: Shah Md Toufiqur Rahman
% Date: 8/31/2021
% Affiliation: NIA, Baltimore, MD, USA
% -------------------------------------------------------------------------
% ------------------ Meta data ibidi slide --------------------------------
% Stage position # 1 2 3 4 --> Young
%                  8 7 6 5 --> Old
% 1 & 8 LPS ultrapure
% 2 & 7 Flagellin
% 3 & 6 CpG
% 4 & 5 Poly(I:C)
% -------------------------------------------------------------------------
% Clear the workspace
clc
clear 
close all
% --------------------- GET THE DATA --------------------------------------
% Add important file and function directory
addpath ('E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Scripts');
% d1 = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)\output';           % directory of first data
d1 = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\primaryBMDM_comparison\1st expt';
% d2 = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\08-25-2021_primaryBMDM_Dkin_R848_Pam3CSK_TNFalpha_LPSenzo\output';   % directory of second data file
d2 = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\primaryBMDM_comparison\2nd expt';
% outputFolder = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)\Y & O comparison';
outputFolder = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\primaryBMDM_comparison\presentation_Young_analysis\shuffling analysis';
% --------------------- Data filename -------------------------------------

R1 = 'stage1To5RawData.mat';
R2 = 'stage6To10RawData.mat';
R3 = 'stage11To15RawData.mat';
R4 = 'stage16To20RawData.mat';

R5 = 'stage21To25RawData.mat';
R6 = 'stage26To30RawData.mat';
R7 = 'stage31To35RawData.mat';
R8 = 'stage36To40RawData.mat';

sR1 = 'stage1To5SmoothedData.mat';
sR2 = 'stage6To10SmoothedData.mat';
sR3 = 'stage11To15SmoothedData.mat';
sR4 = 'stage16To20SmoothedData.mat';

sR5 = 'stage21To25SmoothedData.mat';
sR6 = 'stage26To30SmoothedData.mat';
sR7 = 'stage31To35SmoothedData.mat';
sR8 = 'stage36To40SmoothedData.mat';
% ------------------------ Include metadata -------------------------------
Celltype = 'primaryBMDMDKin ';
stimulation = {'LPS-EB','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK', 'TNF\alpha','LPS Enzo'};
Signal = {'RelA ','cRel '};
FigType = {'rawTimeSeries ','smoothTimeSeries ', 'Heatmap ','AverageTimeSeries ','Quantification ','ScatterPlot ', 'CorrelatinMatrix '};
Analysis = {'Ratio','Nuclear'};
date = '8.25.2021_8.26.2021';
seq1 = [1 2 3 4];
seq2 = [8 7 6 5];
%%
% ------------------------- READ YOUNG DATA (ratio) ------------------------------=
for iA = 1:1
    if iA ==1  % ratio signal
       %%
        cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mNuc11 = load(R1).T1;
        mNuc12 = load(R1).T2;
        mCell_11 = load(R1).T7;
        mCell_12 = load(R1).T8;
        Time_line2 = load(R2).Time_line;
        mNuc21 = load(R2).T1;
        mNuc22 = load(R2).T2;
        mCell_21 = load(R2).T7;
        mCell_22 = load(R2).T8;
        Time_line3 = load(R3).Time_line;
        mNuc31 = load(R3).T1;
        mNuc32 = load(R3).T2;
        mCell_31 = load(R3).T7;
        mCell_32 = load(R3).T8;
        Time_line4 = load(R4).Time_line;
        mNuc41 = load(R4).T1;
        mNuc42 = load(R4).T2;
        mCell_41 = load(R4).T7;
        mCell_42 = load(R4).T8;
        Time_line5 = load(R5).Time_line;
        mNuc51 = load(R5).T1;
        mNuc52 = load(R5).T2;
        mCell_51 = load(R5).T7;
        mCell_52 = load(R5).T8;
        Time_line6 = load(R6).Time_line;
        mNuc61 = load(R6).T1;
        mNuc62 = load(R6).T2;
        mCell_61 = load(R6).T7;
        mCell_62 = load(R6).T8;
        Time_line7 = load(R7).Time_line;
        mNuc71 = load(R7).T1;
        mNuc72 = load(R7).T2;
        mCell_71 = load(R7).T7;
        mCell_72 = load(R7).T8;
        Time_line8 = load(R8).Time_line;
        mNuc81 = load(R8).T1;
        mNuc82 = load(R8).T2;
        mCell_81 = load(R8).T7;
        mCell_82 = load(R8).T8;

        smNuc11 = load(sR1).ST1;
        smNuc12 = load(sR1).ST2;
        smNuc21 = load(sR2).ST1;
        smNuc22 = load(sR2).ST2;
        smNuc31 = load(sR3).ST1;
        smNuc32 = load(sR3).ST2;
        smNuc41 = load(sR4).ST1;
        smNuc42 = load(sR4).ST2;
        smNuc51 = load(sR5).ST1;
        smNuc52 = load(sR5).ST2;
        smNuc61 = load(sR6).ST1;
        smNuc62 = load(sR6).ST2;
        smNuc71 = load(sR7).ST1;
        smNuc72 = load(sR7).ST2;
        smNuc81 = load(sR8).ST1;
        smNuc82 = load(sR8).ST2;
        
        smCell_11 = load(sR1).ST7;
        smCell_12 = load(sR1).ST8;
        smCell_21 = load(sR2).ST7;
        smCell_22 = load(sR2).ST8;
        smCell_31 = load(sR3).ST7;
        smCell_32 = load(sR3).ST8;
        smCell_41 = load(sR4).ST7;
        smCell_42 = load(sR4).ST8;
        smCell_51 = load(sR5).ST7;
        smCell_52 = load(sR5).ST8;
        smCell_61 = load(sR6).ST7;
        smCell_62 = load(sR6).ST8;
        smCell_71 = load(sR7).ST7;
        smCell_72 = load(sR7).ST8;
        smCell_81 = load(sR8).ST7;
        smCell_82 = load(sR8).ST8;

        
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mNuc91 = load(R1).T1;
        mNuc92 = load(R1).T2;
        Time_line10 = load(R2).Time_line;
        mNuc101 = load(R2).T1;
        mNuc102 = load(R2).T2;
        Time_line11 = load(R3).Time_line;
        mNuc111 = load(R3).T1;
        mNuc112 = load(R3).T2;
        Time_line12 = load(R4).Time_line;
        mNuc121 = load(R4).T1;
        mNuc122 = load(R4).T2;
        Time_line13 = load(R5).Time_line;
        mNuc131 = load(R5).T1;
        mNuc132 = load(R5).T2;
        Time_line14 = load(R6).Time_line;
        mNuc141 = load(R6).T1;
        mNuc142 = load(R6).T2;
        Time_line15 = load(R7).Time_line;
        mNuc151 = load(R7).T1;
        mNuc152 = load(R7).T2;
        Time_line16 = load(R8).Time_line;
        mNuc161 = load(R8).T1;
        mNuc162 = load(R8).T2;

        smNuc91 = load(sR1).ST1;
        smNuc92 = load(sR1).ST2;
        smNuc101 = load(sR2).ST1;
        smNuc102 = load(sR2).ST2;
        smNuc111 = load(sR3).ST1;
        smNuc112 = load(sR3).ST2;
        smNuc121 = load(sR4).ST1;
        smNuc122 = load(sR4).ST2;
        smNuc131 = load(sR5).ST1;
        smNuc132 = load(sR5).ST2;
        smNuc141 = load(sR6).ST1;
        smNuc142 = load(sR6).ST2;
        smNuc151 = load(sR7).ST1;
        smNuc152 = load(sR7).ST2;
        smNuc161 = load(sR8).ST1;
        smNuc162 = load(sR8).ST2;
        
        smCell_91 = load(sR1).ST7;
        smCell_92 = load(sR1).ST8;
        smCell_101 = load(sR2).ST7;
        smCell_102 = load(sR2).ST8;
        smCell_111 = load(sR3).ST7;
        smCell_112 = load(sR3).ST8;
        smCell_121 = load(sR4).ST7;
        smCell_122 = load(sR4).ST8;
        smCell_131 = load(sR5).ST7;
        smCell_132 = load(sR5).ST8;
        smCell_141 = load(sR6).ST7;
        smCell_142 = load(sR6).ST8;
        smCell_151 = load(sR7).ST7;
        smCell_152 = load(sR7).ST8;
        smCell_161 = load(sR8).ST7;
        smCell_162 = load(sR8).ST8;

        %%
        % File name
        rawFigName = ['Y_&_O',Celltype,Analysis{1},FigType{1},date];
        sFigName = ['Y_&_O',Celltype,Analysis{1},FigType{2},date];
        HFigName = ['Y_&_O',Celltype,Analysis{1},FigType{3},date];
        aFigName = ['Y_&_O',Celltype,Analysis{1},FigType{4},date];
        qAFigName = ['Y_&_O',Celltype,Analysis{1},FigType{5},Signal{1},date];
        qCFigName = ['Y_&_O',Celltype,Analysis{1},FigType{5},Signal{2},date];
        sAFigName = ['Y_&_O',Celltype,Analysis{1},FigType{6},Signal{1},date];
        sCFigName = ['Y_&_O',Celltype,Analysis{1},FigType{6},Signal{2},date];
        CorAFigName = ['Y_&_O',Celltype,Analysis{1},FigType{7},date];
        CorCFigName = ['Y_&_O',Celltype,Analysis{1},FigType{7},date];
        mincolor = 0;
        maxcolor = 2.0;
    elseif iA==2   % nuclar signal
        cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mNuc11 = load(R1).T5;
        mNuc12 = load(R1).T6;
        Time_line2 = load(R2).Time_line;
        mNuc21 = load(R2).T5;
        mNuc22 = load(R2).T6;
        Time_line3 = load(R3).Time_line;
        mNuc31 = load(R3).T5;
        mNuc32 = load(R3).T6;
        Time_line4 = load(R4).Time_line;
        mNuc41 = load(R4).T5;
        mNuc42 = load(R4).T6;
        Time_line5 = load(R5).Time_line;
        mNuc51 = load(R5).T5;
        mNuc52 = load(R5).T6;
        Time_line6 = load(R6).Time_line;
        mNuc61 = load(R6).T5;
        mNuc62 = load(R6).T6;
        Time_line7 = load(R7).Time_line;
        mNuc71 = load(R7).T5;
        mNuc72 = load(R7).T6;
        Time_line8 = load(R8).Time_line;
        mNuc81 = load(R8).T5;
        mNuc82 = load(R8).T6;

        smNuc11 = load(sR1).ST5;
        smNuc12 = load(sR1).ST6;
        smNuc21 = load(sR2).ST5;
        smNuc22 = load(sR2).ST6;
        smNuc31 = load(sR3).ST5;
        smNuc32 = load(sR3).ST6;
        smNuc41 = load(sR4).ST5;
        smNuc42 = load(sR4).ST6;
        smNuc51 = load(sR5).ST5;
        smNuc52 = load(sR5).ST6;
        smNuc61 = load(sR6).ST5;
        smNuc62 = load(sR6).ST6;
        smNuc71 = load(sR7).ST5;
        smNuc72 = load(sR7).ST6;
        smNuc81 = load(sR8).ST5;
        smNuc82 = load(sR8).ST6;
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mNuc91 = load(R1).T5;
        mNuc92 = load(R1).T6;
        Time_line10 = load(R2).Time_line;
        mNuc101 = load(R2).T5;
        mNuc102 = load(R2).T6;
        Time_line11 = load(R3).Time_line;
        mNuc111 = load(R3).T5;
        mNuc112 = load(R3).T6;
        Time_line12 = load(R4).Time_line;
        mNuc121 = load(R4).T5;
        mNuc122 = load(R4).T6;
        Time_line13 = load(R5).Time_line;
        mNuc131 = load(R5).T5;
        mNuc132 = load(R5).T6;
        Time_line14 = load(R6).Time_line;
        mNuc141 = load(R6).T5;
        mNuc142 = load(R6).T6;
        Time_line15 = load(R7).Time_line;
        mNuc151 = load(R7).T5;
        mNuc152 = load(R7).T6;
        Time_line16 = load(R8).Time_line;
        mNuc161 = load(R8).T5;
        mNuc162 = load(R8).T6;

        smNuc91 = load(sR1).ST5;
        smNuc92 = load(sR1).ST6;
        smNuc101 = load(sR2).ST5;
        smNuc102 = load(sR2).ST6;
        smNuc111 = load(sR3).ST5;
        smNuc112 = load(sR3).ST6;
        smNuc121 = load(sR4).ST5;
        smNuc122 = load(sR4).ST6;
        smNuc131 = load(sR5).ST5;
        smNuc132 = load(sR5).ST6;
        smNuc141 = load(sR6).ST5;
        smNuc142 = load(sR6).ST6;
        smNuc151 = load(sR7).ST5;
        smNuc152 = load(sR7).ST6;
        smNuc161 = load(sR8).ST5;
        smNuc162 = load(sR8).ST6;
        % File name
        rawFigName = ['Y_&_O',Celltype,Analysis{2},FigType{1},date];
        sFigName = ['Y_&_O',Celltype,Analysis{2},FigType{2},date];
        HFigName = ['Y_&_O',Celltype,Analysis{2},FigType{3},date];
        aFigName = ['Y_&_O',Celltype,Analysis{2},FigType{4},date];
        qAFigName = ['Y_&_O',Celltype,Analysis{2},FigType{5},Signal{1},date];
        qCFigName = ['Y_&_O',Celltype,Analysis{2},FigType{5},Signal{2},date];
        sAFigName = ['Y_&_O',Celltype,Analysis{2},FigType{6},Signal{1},date];
        sCFigName = ['Y_&_O',Celltype,Analysis{2},FigType{6},Signal{2},date];
        CorAFigName = ['Y_&_O',Celltype,Analysis{2},FigType{7},date];
        CorCFigName = ['Y_&_O',Celltype,Analysis{2},FigType{7},date];
        mincolor = 0;
        maxcolor = 2000;
    end
    %% Plotting the raw data fig#1
    fig1 = figure(1); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha                      
    hAxis(1)= subplot(7,2,1);  
    plot (Time_line12./60,mNuc121(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    % xticklabels()
    title('mEGFP RelA','FontSize',10,'FontWeight','normal')
   
    hAxis(2) = subplot(7,2,2); 
    plot (Time_line12./60,mNuc122(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
    % xticklabels()
    title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');

%     % For GFP RelA --> Old
%     hAxis(3) = subplot(7,2,3);  
%     plot (Time_line13./60,mNuc131(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
%     title('mEGFP RelA','FontSize',10,'FontWeight','normal')
% 
%     hAxis(4) = subplot(7,4,4);  
%     plot (Time_line13./60,mNuc132(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
%     title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');
    %----------------------------------------------------------------------
    hAxis(3)= subplot(7,2,3);  
    plot (Time_line2./60,mNuc21(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(4) = subplot(7,2,4); 
    plot (Time_line2./60,mNuc22(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(7) = subplot(7,4,7);  
%     plot (Time_line7./60,mNuc71(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(8) = subplot(7,4,8);  
%     plot (Time_line7./60,mNuc72(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
%   
    % ---------------------------------------------------------------------
    hAxis(5)= subplot(7,2,5);  
    plot (Time_line3./60,mNuc31(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(6) = subplot(7,2,6); 
    plot (Time_line3./60,mNuc32(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(11) = subplot(7,4,11);  
%     plot (Time_line6./60,mNuc61(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(12) = subplot(7,4,12);  
%     plot (Time_line6./60,mNuc62(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
  
    % ---------------------------------------------------------------------
    hAxis(7)= subplot(7,2,7);  
    plot (Time_line4./60,mNuc41(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(8) = subplot(7,2,8); 
    plot (Time_line4./60,mNuc42(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(15) = subplot(7,4,15);  
%     plot (Time_line5./60,mNuc51(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(16) = subplot(7,4,16);  
%     plot (Time_line5./60,mNuc52(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()

    % ---------------------------------------------------------------------
    hAxis(9)= subplot(7,2,9);  
    plot (Time_line9./60,mNuc91(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(10) = subplot(7,2,10); 
    plot (Time_line9./60,mNuc92(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(19) = subplot(7,4,19);  
%     plot (Time_line16./60,mNuc161(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(20) = subplot(7,4,20);  
%     plot (Time_line16./60,mNuc162(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
 
    % ---------------------------------------------------------------------
    hAxis(11)= subplot(7,2,11);  
    plot (Time_line10./60,mNuc101(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(12) = subplot(7,2,12); 
    plot (Time_line10./60,mNuc102(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(23) = subplot(7,4,23);  
%     plot (Time_line15./60,mNuc151(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(24) = subplot(7,4,24);  
%     plot (Time_line15./60,mNuc152(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
    % ---------------------------------------------------------------------
    
    hAxis(13)= subplot(7,2,13);  
    plot (Time_line11./60,mNuc111(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
    
   
    hAxis(14) = subplot(7,2,14); 
    plot (Time_line11./60,mNuc112(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(27) = subplot(7,4,27);  
%     plot (Time_line14./60,mNuc141(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
% %     xticks([]);
% %     yticks([]);
%   
% 
%     hAxis(28) = subplot(7,4,28);  
%     plot (Time_line14./60,mNuc142(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
% %     xticks([]);
% %     yticks([]);
%     % xticklabels()
    % ---------------------------------------------------------------------
%     hAxis(29)= subplot(8,4,29);  
%     plot (Time_line12./60,mNuc121(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     
%    
%     hAxis(30) = subplot(8,4,30); 
%     plot (Time_line12./60,mNuc122(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     yticks([]);
%   
% 
%     % For GFP RelA --> Old
%     hAxis(31) = subplot(8,4,31);  
%     plot (Time_line13./60,mNuc131(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     yticks([]);
%   
% 
%     hAxis(32) = subplot(8,4,32);  
%     plot (Time_line13./60,mNuc132(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     yticks([]);
    % xticklabels()
    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (7,2,hAxis,0.1,0.1,0.1,0.1,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig1,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Nuclear Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    % Add 7 conditions information
    h=text(1.025,0.82,'LPS Enzo','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.69,'Flagellin','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.58,'CpG','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.41,'Poly(I:C)','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.29,'R848','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.115,'Pam3CSK','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.01,'TNF\alpha','FontSize',10);
    set(h,'Rotation',90);
%     h=text(1.025,-0.04,'LPS Enzo','FontSize',10);
%     set(h,'Rotation',90);
    
    % Create textbox
%     annotation(fig1,'textbox',...
%         [0.126736111111111 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String',{'                    Young'},...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[0.8 0.8 0.8]);

% % Create textbox
%     annotation(fig1,'textbox',...
%         [0.529513888888888 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String','                    Old',...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[1 0 0]);
% % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,[rawFigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,[rawFigName,'.tif'],'Resolution',300);  % Saving as .tif file
    close
           
  %% Plotting the smoothed data fig#2
    fig2 = figure(2); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha                      
    hAxis(1)= subplot(7,2,1);  
    plot (Time_line12./60,smNuc121(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    % xticklabels()
    title('mEGFP RelA','FontSize',10,'FontWeight','normal')
   
    hAxis(2) = subplot(7,2,2); 
    plot (Time_line12./60,smNuc122(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
    % xticklabels()
    title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');

%     % For GFP RelA --> Old
%     hAxis(3) = subplot(7,4,3);  
%     plot (Time_line13./60,smNuc131(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
%     title('mEGFP RelA','FontSize',10,'FontWeight','normal')
% 
%     hAxis(4) = subplot(7,4,4);  
%     plot (Time_line13./60,smNuc132(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
%     title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');
    %----------------------------------------------------------------------
    hAxis(3)= subplot(7,2,3);  
    plot (Time_line2./60,smNuc21(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(4) = subplot(7,2,4); 
    plot (Time_line2./60,smNuc22(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(7) = subplot(7,4,7);  
%     plot (Time_line7./60,smNuc71(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(8) = subplot(7,4,8);  
%     plot (Time_line7./60,smNuc72(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
  
    % ---------------------------------------------------------------------
    hAxis(5)= subplot(7,2,5);  
    plot (Time_line3./60,smNuc31(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(6) = subplot(7,2,6); 
    plot (Time_line3./60,smNuc32(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(7) = subplot(7,2,7);  
%     plot (Time_line6./60,smNuc61(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(8) = subplot(7,2,8);  
%     plot (Time_line6./60,smNuc62(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
%   
    % ---------------------------------------------------------------------
    hAxis(7)= subplot(7,2,7);  
    plot (Time_line4./60,smNuc41(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(8) = subplot(7,2,8); 
    plot (Time_line4./60,smNuc42(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(15) = subplot(7,4,15);  
%     plot (Time_line5./60,smNuc51(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(16) = subplot(7,4,16);  
%     plot (Time_line5./60,smNuc52(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()

    % ---------------------------------------------------------------------
    hAxis(9)= subplot(7,2,9);  
    plot (Time_line9./60,smNuc91(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(10) = subplot(7,2,10); 
    plot (Time_line9./60,smNuc92(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(11) = subplot(7,2,11);  
%     plot (Time_line16./60,smNuc161(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(20) = subplot(7,4,20);  
%     plot (Time_line16./60,smNuc162(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
 
    % ---------------------------------------------------------------------
    hAxis(11)= subplot(7,2,11);  
    plot (Time_line10./60,smNuc101(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(12) = subplot(7,2,12); 
    plot (Time_line10./60,smNuc102(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(23) = subplot(7,4,23);  
%     plot (Time_line15./60,smNuc151(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%   
% 
%     hAxis(24) = subplot(7,4,24);  
%     plot (Time_line15./60,smNuc152(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
%     % xticklabels()
    % ---------------------------------------------------------------------
    
    hAxis(13)= subplot(7,2,13);  
    plot (Time_line11./60,smNuc111(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
    
   
    hAxis(14) = subplot(7,2,14); 
    plot (Time_line11./60,smNuc112(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 3500]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
%     yticks([]);
  

%     % For GFP RelA --> Old
%     hAxis(27) = subplot(7,4,27);  
%     plot (Time_line14./60,smNuc141(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
% %     xticks([]);
% %     yticks([]);
%   
% 
%     hAxis(28) = subplot(7,4,28);  
%     plot (Time_line14./60,smNuc142(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
% %     xticks([]);
% %     yticks([]);
%     % xticklabels()
    % ---------------------------------------------------------------------
%     hAxis(29)= subplot(8,4,29);  
%     plot (Time_line12./60,smNuc121(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     
%    
%     hAxis(30) = subplot(8,4,30); 
%     plot (Time_line12./60,smNuc122(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     yticks([]);
%   
% 
%     % For GFP RelA --> Old
%     hAxis(31) = subplot(8,4,31);  
%     plot (Time_line13./60,smNuc131(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     yticks([]);
%   
% 
%     hAxis(32) = subplot(8,4,32);  
%     plot (Time_line13./60,smNuc132(3:end,:))
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     % Set the axis
%     if iA==1
%         axis([-1,12,0 3]);
%     elseif iA==2
%         axis([-1,12,0 3500]);
%     end
%     % Set the ticks and ticklabels
%     xtic = -2:2:12;
%     xticks(xtic);
%     yticks([]);
    % xticklabels()
    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (7,2,hAxis,0.125,0.1,0.125,0.1,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig2,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Nuclear Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    % Add the condition information
    h=text(1.025,0.82,'LPS Enzo','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.69,'Flagellin','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.58,'CpG','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.41,'Poly(I:C)','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.29,'R848','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.115,'Pam3CSK','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.01,'TNF\alpha','FontSize',10);
    set(h,'Rotation',90);
    
%     % Create textbox
%     annotation(fig2,'textbox',...
%         [0.126736111111111 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String',{'                    Young'},...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[0.8 0.8 0.8]);
% 
% % Create textbox
%     annotation(fig2,'textbox',...
%         [0.529513888888888 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String','                    Old',...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[1 0 0]);
%     % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,[sFigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,[sFigName,'.tif'],'Resolution',300);  % Saving as .tif file
    close  
 
 %% Plotting the heatmap of smoothed data
     fig3 = figure(3); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha 
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
%       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
         mycolormap = 'jet';
     %      colorbar('southoutside');
     colormap(mycolormap);
%      axis off;
     
    hAxis(1)= subplot(7,2,1);  
    heatmap1((smNuc121(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title('mEGFP RelA','FontSize',10,'FontWeight','normal')
   
    hAxis(2) = subplot(7,2,2); 
    heatmap1((smNuc122(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');

    % For GFP RelA --> Old
%     hAxis(3) = subplot(7,4,3);  
%     heatmap1((smNuc131(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     title('mEGFP RelA','FontSize',10,'FontWeight','normal')
% 
%     hAxis(4) = subplot(7,4,4);  
%     heatmap1((smNuc132(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');
    
     colorbar(hAxis(2),'Position',...
    [0.91 0.095416666666666 0.005 0.0899999999999996]);
    %----------------------------------------------------------------------
    hAxis(3)= subplot(7,2,3);  
    heatmap1((smNuc21(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])

    hAxis(4) = subplot(7,2,4); 
    heatmap1((smNuc22(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
  

%     % For GFP RelA --> Old
%     hAxis(7) = subplot(7,4,7);  
%     heatmap1((smNuc71(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%      
% 
%     hAxis(8) = subplot(7,4,8);  
%     heatmap1((smNuc72(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     
     colorbar(hAxis(4),'Position',...
    [0.91 0.787152777777775 0.005 0.0900000000000003]);
  
    % ---------------------------------------------------------------------
    hAxis(5)= subplot(7,2,5);  
    heatmap1((smNuc31(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    
    hAxis(6) = subplot(7,2,6); 
    heatmap1((smNuc32(3:119,:))',[],[],[],...
    'ColorMap','jet','MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    
    % For GFP RelA --> Old
%     hAxis(11) = subplot(7,4,11);  
%     heatmap1((smNuc61(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     
%     hAxis(12) = subplot(7,4,12);  
%     heatmap1((smNuc62(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     
    colorbar(hAxis(6),'Position',...
    [0.91 0.672166666666662 0.005 0.0900000000000002])
      
    % ---------------------------------------------------------------------
    hAxis(7)= subplot(7,2,7);  
    heatmap1((smNuc41(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
       
    hAxis(8) = subplot(7,2,8); 
    heatmap1((smNuc42(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
     

%     % For GFP RelA --> Old
%     hAxis(15) = subplot(7,4,15);  
%     heatmap1((smNuc51(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%      
% 
%     hAxis(16) = subplot(7,4,16);  
%     heatmap1((smNuc52(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     
     colorbar(hAxis(8),'Position',...
    [0.91 0.554249999999996 0.005 0.09]);
    
  
    
    % ---------------------------------------------------------------------
    hAxis(9)= subplot(7,2,9);  
    heatmap1((smNuc91(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
       
    hAxis(10) = subplot(7,2,10); 
    heatmap1((smNuc92(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    
%  % For GFP RelA --> Old
%     hAxis(19) = subplot(7,4,19);  
%     heatmap1((smNuc161(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%   
% 
%     
%     hAxis(20) = subplot(7,4,20);  
%     heatmap1((smNuc162(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
     colorbar(hAxis(10),'Position',...
    [0.91 0.442327777777776 0.005 0.0899999999999999]);
    % ---------------------------------------------------------------------
    hAxis(11)= subplot(7,2,11);  
    heatmap1((smNuc101(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    
    hAxis(12) = subplot(7,2,12); 
    heatmap1((smNuc102(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    
%  % For GFP RelA --> Old
%     hAxis(23) = subplot(7,4,23);  
%     heatmap1((smNuc151(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     
%     hAxis(24) = subplot(7,4,24);  
%     heatmap1((smNuc152(3:end,:))',[],[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    colorbar(hAxis(12),'Position',...
    [0.91 0.327236111111108 0.005 0.09]);
    % ---------------------------------------------------------------------
    hAxis(13)= subplot(7,2,13);  
    heatmap1((smNuc111(3:119,:))',round(((1:size(smNuc111,1)-9).*7)./60,1),[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);

    hAxis(14) = subplot(7,2,14); 
    heatmap1((smNuc112(3:119,:))',round(((1:size(smNuc112,1)-9).*7)./60,1),[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);


%     % For GFP RelA --> Old
%     hAxis(27) = subplot(7,4,27);  
%     heatmap1((smNuc141(3:end,:))',round(((1:size(smNuc141,1)-9).*7)./60,1),[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     set (gca,'FontSize',6);
%     
%     hAxis(28) = subplot(7,4,28);  
%     heatmap1((smNuc142(3:end,:))',round(((1:size(smNuc142,1)-9).*7)./60,1),[],[],...
%     'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%     set (gca,'FontSize',6);
    colorbar(hAxis(14),'Position',...
    [0.91 0.212444444444442 0.005 0.0899999999999999]);
   
    % ---------------------------------------------------------------------
%     hAxis(29)= subplot(8,4,29);  
%     heatmap1((smNuc121(3:end,:))',round(((1:size(smNuc132,1)-9).*7)./60,1),[],[],...
%     'ColorMap','jet','MinColorValue', mincolor, 'MaxColorValue', maxcolor,'TickFontSize',5);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
%  
%        
%     hAxis(30) = subplot(8,4,30); 
%     heatmap1((smNuc122(3:end,:))',round(((1:size(smNuc132,1)-9).*7)./60,1),[],[],...
%     'ColorMap','jet','MinColorValue', mincolor, 'MaxColorValue', maxcolor,'TickFontSize',5);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
% 
%     
%     % For GFP RelA --> Old
%     hAxis(31) = subplot(8,4,31);  
%     heatmap1((smNuc131(3:end,:))',round(((1:size(smNuc132,1)-11).*7)./60,1),[],[],...
%     'ColorMap','jet','MinColorValue', mincolor, 'MaxColorValue', maxcolor,'TickFontSize',5);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
% 
%     
%     hAxis(32) = subplot(8,4,32);  
%     heatmap1((smNuc132(3:end,:))',round(((1:size(smNuc132,1)-11).*7)./60,1),[],[],...
%     'ColorMap','jet','MinColorValue', mincolor, 'MaxColorValue', maxcolor,'TickFontSize',5);
%     % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])

 

    
    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (7,2,hAxis,0.1,0.1,0.125,0.1,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig3,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    
    
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Nuclear Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    if iA==2
        xtxt=1.09;
    else
        xtxt=1.05;
    end
    % Add the condition information
    h=text(xtxt,0.82,'LPS Enzo','FontSize',10);
    set(h,'Rotation',90);
    h=text(xtxt,0.69,'Flagellin','FontSize',10);
    set(h,'Rotation',90);
    h=text(xtxt,0.58,'CpG','FontSize',10);
    set(h,'Rotation',90);
    h=text(xtxt,0.41,'Poly(I:C)','FontSize',10);
    set(h,'Rotation',90);
    h=text(xtxt,0.29,'R848','FontSize',10);
    set(h,'Rotation',90);
    h=text(xtxt,0.115,'Pam3CSK','FontSize',10);
    set(h,'Rotation',90);
    h=text(xtxt,0.01,'TNF\alpha','FontSize',10);
    set(h,'Rotation',90);
    
%     % Create textbox
%     annotation(fig3,'textbox',...
%         [0.126736111111111 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String',{'                    Young'},...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[0.8 0.8 0.8]);
% 
% % Create textbox
%     annotation(fig3,'textbox',...
%         [0.529513888888888 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String','                    Old',...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[1 0 0]);

    % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,[HFigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,[HFigName,'.tif'],'Resolution',300);  % Saving as .tif file
    close 
  %% Cell intensity plot
  iA = 2;
   fig2 = figure(2); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha                      
    hAxis(1)= subplot(7,2,1);  
    plot (Time_line12./60,smCell_121(3:end,:))
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 4 30])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    % xticklabels()
    title('mEGFP RelA','FontSize',10,'FontWeight','normal')
   
    hAxis(2) = subplot(7,2,2); 
    plot (Time_line12./60,smCell_122(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
    % xticklabels()
    title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');
 
    %----------------------------------------------------------------------
    hAxis(3)= subplot(7,2,3);  
    plot (Time_line2./60,smCell_21(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(4) = subplot(7,2,4); 
    plot (Time_line2./60,smCell_22(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
 
  
    % ---------------------------------------------------------------------
    hAxis(5)= subplot(7,2,5);  
    plot (Time_line3./60,smCell_31(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(6) = subplot(7,2,6); 
    plot (Time_line3./60,smCell_32(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
 
%   
    % ---------------------------------------------------------------------
    hAxis(7)= subplot(7,2,7);  
    plot (Time_line4./60,smCell_41(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(8) = subplot(7,2,8); 
    plot (Time_line4./60,smCell_42(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
 
    % ---------------------------------------------------------------------
    hAxis(9)= subplot(7,2,9);  
    plot (Time_line9./60,smCell_91(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(10) = subplot(7,2,10); 
    plot (Time_line9./60,smCell_92(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
 
 
    % ---------------------------------------------------------------------
    hAxis(11)= subplot(7,2,11);  
    plot (Time_line10./60,smCell_101(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(12) = subplot(7,2,12); 
    plot (Time_line10./60,smCell_102(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
  % ---------------------------------------------------------------------
    
    hAxis(13)= subplot(7,2,13);  
    plot (Time_line11./60,smCell_111(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
    
   
    hAxis(14) = subplot(7,2,14); 
    plot (Time_line11./60,smCell_112(3:end,:))
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
    yticks([]);


  


    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (7,2,hAxis,0.125,0.1,0.125,0.1,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig2,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Cell Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    % Add the condition information
    h=text(1.025,0.82,'LPS Enzo','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.69,'Flagellin','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.58,'CpG','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.41,'Poly(I:C)','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.29,'R848','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.115,'Pam3CSK','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.01,'TNF\alpha','FontSize',10);
    set(h,'Rotation',90);
    
%     % Create textbox
%     annotation(fig2,'textbox',...
%         [0.126736111111111 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String',{'                    Young'},...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[0.8 0.8 0.8]);
% 
% % Create textbox
%     annotation(fig2,'textbox',...
%         [0.529513888888888 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String','                    Old',...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[1 0 0]);
%% Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Cell Intensity_Young','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Cell Intensity_Young','.tif'],'Resolution',300);  % Saving as .tif file
    close  
 %%
 
  %% Cell intensity plot with mean
  iA = 2;
   fig2 = figure(2); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha                      
    hAxis(1)= subplot(7,2,1);  
    plot (Time_line12./60,smCell_121(3:end,:))
    hold on
    plot ((mean(Time_line12,2))./60,mean(smCell_121(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 4 30])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    % xticklabels()
    title('mEGFP RelA','FontSize',10,'FontWeight','normal')
   
    hAxis(2) = subplot(7,2,2); 
    plot (Time_line12./60,smCell_122(3:end,:))
    hold on
    plot ((mean(Time_line12,2))./60,mean(smCell_122(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
    % xticklabels()
    title ('mScarlet c-Rel','FontSize',10,'FontWeight','normal');
 
    %----------------------------------------------------------------------
    hAxis(3)= subplot(7,2,3);  
    plot (Time_line2./60,smCell_21(3:end,:))
    hold on
    plot ((mean(Time_line2,2))./60,mean(smCell_21(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(4) = subplot(7,2,4); 
    plot (Time_line2./60,smCell_22(3:end,:))
    hold on
    plot ((mean(Time_line2,2))./60,mean(smCell_22(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
 
  
    % ---------------------------------------------------------------------
    hAxis(5)= subplot(7,2,5);  
    plot (Time_line3./60,smCell_31(3:end,:))
    hold on
    plot ((mean(Time_line3,2))./60,mean(smCell_31(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(6) = subplot(7,2,6); 
    plot (Time_line3./60,smCell_32(3:end,:))
    hold on
    plot ((mean(Time_line3,2))./60,mean(smCell_32(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
 
%   
    % ---------------------------------------------------------------------
    hAxis(7)= subplot(7,2,7);  
    plot (Time_line4./60,smCell_41(3:end,:))
    hold on
    plot ((mean(Time_line4,2))./60,mean(smCell_41(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(8) = subplot(7,2,8); 
    plot (Time_line4./60,smCell_42(3:end,:))
    hold on
    plot ((mean(Time_line4,2))./60,mean(smCell_42(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
 
    % ---------------------------------------------------------------------
    hAxis(9)= subplot(7,2,9);  
    plot (Time_line9./60,smCell_91(3:end,:))
    hold on
    plot ((mean(Time_line9,2))./60,mean(smCell_91(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(10) = subplot(7,2,10); 
    plot (Time_line9./60,smCell_92(3:end,:))
    hold on
    plot ((mean(Time_line9,2))./60,mean(smCell_92(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
 
 
    % ---------------------------------------------------------------------
    hAxis(11)= subplot(7,2,11);  
    plot (Time_line10./60,smCell_101(3:end,:))
    hold on
    plot ((mean(Time_line10,2))./60,mean(smCell_101(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    
   
    hAxis(12) = subplot(7,2,12); 
    plot (Time_line10./60,smCell_102(3:end,:))
    hold on
    plot ((mean(Time_line10,2))./60,mean(smCell_102(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
    xticks([]);
    yticks([]);
  
 
  % ---------------------------------------------------------------------
    
    hAxis(13)= subplot(7,2,13);  
    plot (Time_line11./60,smCell_111(3:end,:))
    hold on
    plot ((mean(Time_line11,2))./60,mean(smCell_111(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
    
   
    hAxis(14) = subplot(7,2,14); 
    plot (Time_line11./60,smCell_112(3:end,:))
    hold on
    plot ((mean(Time_line11,2))./60,mean(smCell_112(3:end,:),2),'r-','LineWidth',3.5)
    % Set the figure size
%     set(gcf,'Units','inches',...
%      'Position',[0 0 6 6])
    % Set the axis
    if iA==1
        axis([-1,12,0 3]);
    elseif iA==2
        axis([-1,12,0 4000]);
    end
    % Set the ticks and ticklabels
    xtic = -2:2:12;
%     xticks([]);
    yticks([]);


  


    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (7,2,hAxis,0.125,0.1,0.125,0.1,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig2,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Cell Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    % Add the condition information
    h=text(1.025,0.82,'LPS Enzo','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.69,'Flagellin','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.58,'CpG','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.41,'Poly(I:C)','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.29,'R848','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.115,'Pam3CSK','FontSize',10);
    set(h,'Rotation',90);
    h=text(1.025,0.01,'TNF\alpha','FontSize',10);
    set(h,'Rotation',90);
    
%     % Create textbox
%     annotation(fig2,'textbox',...
%         [0.126736111111111 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String',{'                    Young'},...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[0.8 0.8 0.8]);
% 
% % Create textbox
%     annotation(fig2,'textbox',...
%         [0.529513888888888 0.925347222222222 0.371527777777778 0.0451388888888888],...
%         'String','                    Old',...
%         'LineStyle','none',...
%         'FontSize',12,...
%         'FitBoxToText','off',...
%         'BackgroundColor',[1 0 0]);
% % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Cell Intensity_Young_with_mean','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Cell Intensity_Young_with_mean','.tif'],'Resolution',300);  % Saving as .tif file
    close 
%% Save the Cell Intensity data in Excell file
cd (outputFolder);
xlswrite ('Cell_Intensity_Young_LPS.xlsx',Time_line12,'Time(min)');
xlswrite ('Cell_Intensity_Young_LPS.xlsx',smCell_121,'RelA');
xlswrite ('Cell_Intensity_Young_LPS.xlsx',smCell_122,'c-Rel');

xlswrite ('Cell_Intensity_Young_Flagellin.xlsx',Time_line2,'Time(min)');
xlswrite ('Cell_Intensity_Young_Flagellin.xlsx',smCell_21,'RelA');
xlswrite ('Cell_Intensity_Young_Flagellin.xlsx',smCell_22,'c-Rel');

xlswrite ('Cell_Intensity_Young_CpG.xlsx',Time_line3,'Time(min)');
xlswrite ('Cell_Intensity_Young_CpG.xlsx',smCell_31,'RelA');
xlswrite ('Cell_Intensity_Young_CpG.xlsx',smCell_32,'c-Rel');

xlswrite ('Cell_Intensity_Young_Poly_IC.xlsx',Time_line4,'Time(min)');
xlswrite ('Cell_Intensity_Young_Poly_IC.xlsx',smCell_41,'RelA');
xlswrite ('Cell_Intensity_Young_Poly_IC.xlsx',smCell_42,'c-Rel');

xlswrite ('Cell_Intensity_Young_R848.xlsx',Time_line9,'Time(min)');
xlswrite ('Cell_Intensity_Young_R848.xlsx',smCell_91,'RelA');
xlswrite ('Cell_Intensity_Young_R848.xlsx',smCell_92,'c-Rel');

xlswrite ('Cell_Intensity_Young_Pam.xlsx',Time_line10,'Time(min)');
xlswrite ('Cell_Intensity_Young_Pam.xlsx',smCell_101,'RelA');
xlswrite ('Cell_Intensity_Young_Pam.xlsx',smCell_102,'c-Rel');

xlswrite ('Cell_Intensity_Young_TNF.xlsx',Time_line11,'Time(min)');
xlswrite ('Cell_Intensity_Young_TNF.xlsx',smCell_111,'RelA');
xlswrite ('Cell_Intensity_Young_TNF.xlsx',smCell_112,'c-Rel');
    
%%     Calculate maximum slope of mean smoothed Cell intensity
 % for LPS Enzo
 MSlope11 = max(diff(smCell_121(3:end,:),[],1));
 MSlope12 = max(diff(smCell_122(3:end,:),[],1));
  % for Flagellin
 MSlope71 = max(diff(smCell_21(3:end,:),[],1));
 MSlope72 = max(diff(smCell_22(3:end,:),[],1));
  % for CpG
 MSlope61 = max(diff(smCell_31(3:end,:),[],1));
 MSlope62 = max(diff(smCell_32(3:end,:),[],1));
  % for Poly(I:C)
 MSlope51 = max(diff(smCell_41(3:end,:),[],1));
 MSlope52 = max(diff(smCell_42(3:end,:),[],1));
  % for R848
 MSlope161 = max(diff(smCell_91(3:end,:),[],1));
 MSlope162 = max(diff(smCell_92(3:end,:),[],1));
  % for Pam3CSK
 MSlope151 = max(diff(smCell_101(3:end,:),[],1));
 MSlope152 = max(diff(smCell_102(3:end,:),[],1));
  % for TNF-alpha
 MSlope141 = max(diff(smCell_111(3:end,:),[],1));
 MSlope142 = max(diff(smCell_112(3:end,:),[],1));
    % Plot the violin plot of maximum induction
     set(gcf,'Units','inches',...
     'Position',[0 0 14 6])
 mx1 = max ([length(MSlope11),length(MSlope71),length(MSlope61),length(MSlope51),length(MSlope161),length(MSlope151),length(MSlope141)]);
        data = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data (1:length(MSlope11),1,1) = MSlope11';
        data (1:length(MSlope12),1,2) = MSlope12';
        
        data (1:length(MSlope71),2,1) = MSlope71';
        data (1:length(MSlope72),2,2) = MSlope72';
        
        data (1:length(MSlope61),3,1) = MSlope61';
        data (1:length(MSlope62),3,2) = MSlope62';
        
        data (1:length(MSlope51),4,1) = MSlope51';
        data (1:length(MSlope52),4,2) = MSlope52';
        
        data (1:length(MSlope161),5,1) = MSlope161';
        data (1:length(MSlope162),5,2) = MSlope162';
        
        data (1:length(MSlope151),6,1) = MSlope151';
        data (1:length(MSlope152),6,2) = MSlope152';
        
        data (1:length(MSlope141),7,1) = MSlope141';
        data (1:length(MSlope142),7,2) = MSlope142';
        
        st = {' ',' ',' ',' ',' ',' ',' '};        
        h = iosr.statistics.boxPlot(st,data,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 8,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Maximum Slope (Induction rate)','FontSize',12)
        if iA ==2
            ax=gca;
            ax.YAxis.Exponent=3;
        end

        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data(:,1,1),data(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data(:,2,1),data(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data(:,3,1),data(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data(:,4,1),data(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data(:,5,1),data(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data(:,6,1),data(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data(:,7,1),data(:,7,2));
        sigstar({[6.75,7.25]},[p])
        
        
         xticklabels({'LPS','Flagellin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
        xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 10;
    
          cd (outputFolder);
    exportgraphics(gcf,['Induction rate_Young','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Induction rate_Young','.tif'],'Resolution',300);  % Saving as .tif file
    close 
    
 %% Plotting the Quantification of RelA
 St_Frame1 = 9;
 frequency1 = 7;
 St_Frame2 = 11;
 frequency2 = 7;
 st = {' ',' ',' ',' ',' ',' ',' '};
 fig4 = figure(4);
 set(gcf,'Units','inches',...
     'Position',[0 0 14 6])
 
 hAxis(1) = subplot(3,3,1);
        [PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,smNuc11(3:end,:),St_Frame1,frequency1);
        [PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line2,smNuc21(3:end,:),St_Frame1,frequency1);
        [PeakValue3,PeakTime3,AUC3,NOC3,Act_Duration3,rSlope3,fSlope3,OsPrd3] = Extract8Variable (Time_line3,smNuc31(3:end,:),St_Frame1,frequency1);
        [PeakValue4,PeakTime4,AUC4,NOC4,Act_Duration4,rSlope4,fSlope4,OsPrd4] = Extract8Variable (Time_line4,smNuc41(3:end,:),St_Frame1,frequency1);
        [PeakValue5,PeakTime5,AUC5,NOC5,Act_Duration5,rSlope5,fSlope5,OsPrd5] = Extract8Variable (Time_line5,smNuc51(3:end,:),St_Frame1,frequency1);
        [PeakValue6,PeakTime6,AUC6,NOC6,Act_Duration6,rSlope6,fSlope6,OsPrd6] = Extract8Variable (Time_line6,smNuc61(3:end,:),St_Frame1,frequency1);
        [PeakValue7,PeakTime7,AUC7,NOC7,Act_Duration7,rSlope7,fSlope7,OsPrd7] = Extract8Variable (Time_line7,smNuc71(3:end,:),St_Frame1,frequency1);
        [PeakValue8,PeakTime8,AUC8,NOC8,Act_Duration8,rSlope8,fSlope8,OsPrd8] = Extract8Variable (Time_line8,smNuc81(3:end,:),St_Frame1,frequency1);
        
        [PeakValue9,PeakTime9,AUC9,NOC9,Act_Duration9,rSlope9,fSlope9,OsPrd9] = Extract8Variable (Time_line9,smNuc91(3:end,:),St_Frame1,frequency1);
        [PeakValue10,PeakTime10,AUC10,NOC10,Act_Duration10,rSlope10,fSlope10,OsPrd10] = Extract8Variable (Time_line10,smNuc101(3:end,:),St_Frame2,frequency2);
        [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line11,smNuc111(3:end,:),St_Frame2,frequency2);
        [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc121(3:end,:),St_Frame2,frequency2);
        [PeakValue13,PeakTime13,AUC13,NOC13,Act_Duration13,rSlope13,fSlope13,OsPrd13] = Extract8Variable (Time_line13,smNuc131(3:end,:),St_Frame2,frequency2);
        [PeakValue14,PeakTime14,AUC14,NOC14,Act_Duration14,rSlope14,fSlope14,OsPrd14] = Extract8Variable (Time_line14,smNuc141(3:end,:),St_Frame2,frequency2);
        [PeakValue15,PeakTime15,AUC15,NOC15,Act_Duration15,rSlope15,fSlope15,OsPrd15] = Extract8Variable (Time_line15,smNuc151(3:end,:),St_Frame2,frequency2);
        [PeakValue16,PeakTime16,AUC16,NOC16,Act_Duration16,rSlope16,fSlope16,OsPrd16] = Extract8Variable (Time_line16,smNuc161(3:end,:),St_Frame2,frequency2);
        
        % Make data matrix for the Violin plot Monolayer Vs Single Cell
        mx1 = max ([length(PeakValue12),length(PeakValue13),length(PeakValue2),length(PeakValue7),length(PeakValue3),length(PeakValue6),length(PeakValue4),length(PeakValue5),length(PeakValue9),length(PeakValue16),length(PeakValue10),length(PeakValue15),length(PeakValue11),length(PeakValue14)]);
        data1 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data1 (1:length(PeakValue12),1,1) = PeakValue12';
        data1 (1:length(PeakValue13),1,2) = PeakValue13';
        data1 (1:length(PeakValue2),2,1) = PeakValue2';
        data1 (1:length(PeakValue7),2,2) = PeakValue7';
        data1 (1:length(PeakValue3),3,1) = PeakValue3';
        data1 (1:length(PeakValue6),3,2) = PeakValue6';
        data1 (1:length(PeakValue4),4,1) = PeakValue4';
        data1 (1:length(PeakValue5),4,2) = PeakValue5';
        data1 (1:length(PeakValue9),5,1) = PeakValue9';
        data1 (1:length(PeakValue16),5,2) = PeakValue16';
        data1 (1:length(PeakValue10),6,1) = PeakValue10';
        data1 (1:length(PeakValue15),6,2) = PeakValue15';
        data1 (1:length(PeakValue11),7,1) = PeakValue11';
        data1 (1:length(PeakValue14),7,2) = PeakValue14';
%         data1 (1:length(PeakValue12),8,1) = PeakValue12';
%         data1 (1:length(PeakValue13),8,2) = PeakValue13';
        
        h = iosr.statistics.boxPlot(st,data1,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'Y','O'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Amplitude','FontSize',12)
        if iA ==2
            ax=gca;
            ax.YAxis.Exponent=3;
        end

        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data1(:,1,1),data1(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data1(:,2,1),data1(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data1(:,3,1),data1(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data1(:,4,1),data1(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data1(:,5,1),data1(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data1(:,6,1),data1(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data1(:,7,1),data1(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        hAxis(2) = subplot(3,3,2);
        mx1 = max ([length(PeakTime12),length(PeakTime13),length(PeakTime2),length(PeakTime7),length(PeakTime3),length(PeakTime6),length(PeakTime4),length(PeakTime5),length(PeakTime9),length(PeakTime16),length(PeakTime10),length(PeakTime15),length(PeakTime11),length(PeakTime14)]);
        data2 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data2 (1:length(PeakTime12),1,1) = PeakTime12';
        data2 (1:length(PeakTime13),1,2) = PeakTime13';
        data2 (1:length(PeakTime2),2,1) = PeakTime2';
        data2 (1:length(PeakTime7),2,2) = PeakTime7';
        data2 (1:length(PeakTime3),3,1) = PeakTime3';
        data2 (1:length(PeakTime6),3,2) = PeakTime6';
        data2 (1:length(PeakTime4),4,1) = PeakTime4';
        data2 (1:length(PeakTime5),4,2) = PeakTime5';
        data2 (1:length(PeakTime9),5,1) = PeakTime9';
        data2 (1:length(PeakTime16),5,2) = PeakTime16';
        data2 (1:length(PeakTime10),6,1) = PeakTime10';
        data2 (1:length(PeakTime15),6,2) = PeakTime15';
        data2 (1:length(PeakTime11),7,1) = PeakTime11';
        data2 (1:length(PeakTime14),7,2) = PeakTime14';
%         data2 (1:length(PeakTime12),8,1) = PeakTime12';
%         data2 (1:length(PeakTime13),8,2) = PeakTime13';
        
        h = iosr.statistics.boxPlot(st,data2,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'Y','O'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Time to peak (hr)','FontSize',12)
        ylim([0 5]);
%         axis([0.4 3.6 0 6])
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        % Mann-Whitney U-test p value 
        p = ranksum (data2(:,1,1),data2(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data2(:,2,1),data2(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data2(:,3,1),data2(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data2(:,4,1),data2(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data2(:,5,1),data2(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data2(:,6,1),data2(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data2(:,7,1),data2(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        hAxis(3) = subplot(3,3,3);
        mx1 = max ([length(AUC12),length(AUC13),length(AUC2),length(AUC7),length(AUC3),length(AUC6),length(AUC4),length(AUC5),length(AUC9),length(AUC16),length(AUC10),length(AUC15),length(AUC11),length(AUC14)]);
        data3 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data3 (1:length(AUC12),1,1) = AUC12';
        data3 (1:length(AUC13),1,2) = AUC13';
        data3 (1:length(AUC2),2,1) = AUC2';
        data3 (1:length(AUC7),2,2) = AUC7';
        data3 (1:length(AUC3),3,1) = AUC3';
        data3 (1:length(AUC6),3,2) = AUC6';
        data3 (1:length(AUC4),4,1) = AUC4';
        data3 (1:length(AUC5),4,2) = AUC5';
        data3 (1:length(AUC9),5,1) = AUC9';
        data3 (1:length(AUC16),5,2) = AUC16';
        data3 (1:length(AUC10),6,1) = AUC10';
        data3 (1:length(AUC15),6,2) = AUC15';
        data3 (1:length(AUC11),7,1) = AUC11';
        data3 (1:length(AUC14),7,2) = AUC14';
%         data3 (1:length(AUC12),8,1) = AUC12';
%         data3 (1:length(AUC13),8,2) = AUC13';
        
        h = iosr.statistics.boxPlot(st,data3,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'Y','O'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',6,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('AUC','FontSize',12)
%         axis([0.4 3.6 0 6])
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data3(:,1,1),data3(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data3(:,2,1),data3(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data3(:,3,1),data3(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data3(:,4,1),data3(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data3(:,5,1),data3(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data3(:,6,1),data3(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data3(:,7,1),data3(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        basal = mean(smNuc11(3:St_Frame1,:),1);
        smNuc11 = smNuc11./basal;
        basal = mean(smNuc21(3:St_Frame1,:),1);
        smNuc21 = smNuc21./basal;
        basal = mean(smNuc31(3:St_Frame1,:),1);
        smNuc31 = smNuc31./basal;
        basal = mean(smNuc41(3:St_Frame1,:),1);
        smNuc41 = smNuc41./basal;
        basal = mean(smNuc51(3:St_Frame1,:),1);
        smNuc51 = smNuc51./basal;
        basal = mean(smNuc61(3:St_Frame1,:),1);
        smNuc61 = smNuc61./basal;
        basal = mean(smNuc71(3:St_Frame1,:),1);
        smNuc71 = smNuc71./basal;
        basal = mean(smNuc81(3:St_Frame1,:),1);
        smNuc81 = smNuc81./basal;
        
        basal = mean(smNuc91(3:St_Frame2,:),1);
        smNuc91 = smNuc91./basal;
        basal = mean(smNuc101(3:St_Frame2,:),1);
        smNuc101 = smNuc101./basal;
        basal = mean(smNuc111(3:St_Frame2,:),1);
        smNuc111 = smNuc111./basal;
        basal = mean(smNuc121(3:St_Frame2,:),1);
        smNuc121 = smNuc121./basal;
        basal = mean(smNuc131(3:St_Frame2,:),1);
        smNuc131 = smNuc131./basal;
        basal = mean(smNuc141(3:St_Frame2,:),1);
        smNuc141 = smNuc141./basal;
        basal = mean(smNuc151(3:St_Frame2,:),1);
        smNuc151 = smNuc151./basal;
        basal = mean(smNuc161(3:St_Frame2,:),1);
        smNuc161 = smNuc161./basal;

        % Use the Quantification of 8 parameters
        [PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,smNuc11(3:end,:),St_Frame1,frequency1);
        [PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line2,smNuc21(3:end,:),St_Frame1,frequency1);
        [PeakValue3,PeakTime3,AUC3,NOC3,Act_Duration3,rSlope3,fSlope3,OsPrd3] = Extract8Variable (Time_line3,smNuc31(3:end,:),St_Frame1,frequency1);
        [PeakValue4,PeakTime4,AUC4,NOC4,Act_Duration4,rSlope4,fSlope4,OsPrd4] = Extract8Variable (Time_line4,smNuc41(3:end,:),St_Frame1,frequency1);
        [PeakValue5,PeakTime5,AUC5,NOC5,Act_Duration5,rSlope5,fSlope5,OsPrd5] = Extract8Variable (Time_line5,smNuc51(3:end,:),St_Frame1,frequency1);
        [PeakValue6,PeakTime6,AUC6,NOC6,Act_Duration6,rSlope6,fSlope6,OsPrd6] = Extract8Variable (Time_line6,smNuc61(3:end,:),St_Frame1,frequency1);
        [PeakValue7,PeakTime7,AUC7,NOC7,Act_Duration7,rSlope7,fSlope7,OsPrd7] = Extract8Variable (Time_line7,smNuc71(3:end,:),St_Frame1,frequency1);
        [PeakValue8,PeakTime8,AUC8,NOC8,Act_Duration8,rSlope8,fSlope8,OsPrd8] = Extract8Variable (Time_line8,smNuc81(3:end,:),St_Frame1,frequency1);
        
        [PeakValue9,PeakTime9,AUC9,NOC9,Act_Duration9,rSlope9,fSlope9,OsPrd9] = Extract8Variable (Time_line9,smNuc91(3:end,:),St_Frame1,frequency1);
        [PeakValue10,PeakTime10,AUC10,NOC10,Act_Duration10,rSlope10,fSlope10,OsPrd10] = Extract8Variable (Time_line10,smNuc101(3:end,:),St_Frame2,frequency2);
        [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line11,smNuc111(3:end,:),St_Frame2,frequency2);
        [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc121(3:end,:),St_Frame2,frequency2);
        [PeakValue13,PeakTime13,AUC13,NOC13,Act_Duration13,rSlope13,fSlope13,OsPrd13] = Extract8Variable (Time_line13,smNuc131(3:end,:),St_Frame2,frequency2);
        [PeakValue14,PeakTime14,AUC14,NOC14,Act_Duration14,rSlope14,fSlope14,OsPrd14] = Extract8Variable (Time_line14,smNuc141(3:end,:),St_Frame2,frequency2);
        [PeakValue15,PeakTime15,AUC15,NOC15,Act_Duration15,rSlope15,fSlope15,OsPrd15] = Extract8Variable (Time_line15,smNuc151(3:end,:),St_Frame2,frequency2);
        [PeakValue16,PeakTime16,AUC16,NOC16,Act_Duration16,rSlope16,fSlope16,OsPrd16] = Extract8Variable (Time_line16,smNuc161(3:end,:),St_Frame2,frequency2);

        hAxis(4) = subplot(3,3,4);
        mx1 = max ([length(AUC12),length(AUC13),length(AUC2),length(AUC7),length(AUC3),length(AUC6),length(AUC4),length(AUC5),length(AUC9),length(AUC16),length(AUC10),length(AUC15),length(AUC11),length(AUC14)]);
        data4 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data4 (1:length(AUC12),1,1) = AUC12';
        data4 (1:length(AUC13),1,2) = AUC13';
        data4 (1:length(AUC2),2,1) = AUC2';
        data4 (1:length(AUC7),2,2) = AUC7';
        data4 (1:length(AUC3),3,1) = AUC3';
        data4 (1:length(AUC6),3,2) = AUC6';
        data4 (1:length(AUC4),4,1) = AUC4';
        data4 (1:length(AUC5),4,2) = AUC5';
        data4 (1:length(AUC9),5,1) = AUC9';
        data4 (1:length(AUC16),5,2) = AUC16';
        data4 (1:length(AUC10),6,1) = AUC10';
        data4 (1:length(AUC15),6,2) = AUC15';
        data4 (1:length(AUC11),7,1) = AUC11';
        data4 (1:length(AUC14),7,2) = AUC14';
%         data4 (1:length(AUC12),8,1) = AUC12';
%         data4 (1:length(AUC13),8,2) = AUC13';
        
        % Convert zero values to nan
%         data4 (data4==0)=nan;
        h = iosr.statistics.boxPlot(st,data4,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('AUC (fold change)','FontSize',12)
                ax=gca;
                ax.YAxis.Exponent=2;
                %title ('','FontSize',14);
                % Adding xtick label
        %         xticklabels({'Monolayer','Single Cell'});
        %         xtickangle(45)
        %         hAxes = gca;
        %         hAxes.XAxis.FontSize = 14;
        %         turn off the tick label
                set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data4(:,1,1),data4(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data4(:,2,1),data4(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data4(:,3,1),data4(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data4(:,4,1),data4(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data4(:,5,1),data4(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data4(:,6,1),data4(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data4(:,7,1),data4(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        hAxis(5) = subplot(3,3,5);
        mx1 = max ([length(NOC12),length(NOC13),length(NOC2),length(NOC7),length(NOC3),length(NOC6),length(NOC4),length(NOC5),length(NOC9),length(NOC16),length(NOC10),length(NOC15),length(NOC11),length(NOC14)]);
        data5 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data5 (1:length(NOC12),1,1) = NOC12';
        data5 (1:length(NOC13),1,2) = NOC13';
        data5 (1:length(NOC2),2,1) = NOC2';
        data5 (1:length(NOC7),2,2) = NOC7';
        data5 (1:length(NOC3),3,1) = NOC3';
        data5 (1:length(NOC6),3,2) = NOC6';
        data5 (1:length(NOC4),4,1) = NOC4';
        data5 (1:length(NOC5),4,2) = NOC5';
        data5 (1:length(NOC9),5,1) = NOC9';
        data5 (1:length(NOC16),5,2) = NOC16';
        data5 (1:length(NOC10),6,1) = NOC10';
        data5 (1:length(NOC15),6,2) = NOC15';
        data5 (1:length(NOC11),7,1) = NOC11';
        data5 (1:length(NOC14),7,2) = NOC14';
%         data5 (1:length(NOC12),8,1) = NOC12';
%         data5 (1:length(NOC13),8,2) = NOC13';
        
        % Convert zero values to nan
%         data5 (data5==0)=nan;
        h = iosr.statistics.boxPlot(st,data5,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,... 
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Cycle number','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
        %         xticklabels({'Monolayer','Single Cell'});
        %         xtickangle(45)
        %         hAxes = gca;
        %         hAxes.XAxis.FontSize = 14;
        %         turn off the tick label
                set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data5(:,1,1),data5(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data5(:,2,1),data5(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data5(:,3,1),data5(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data5(:,4,1),data5(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data5(:,5,1),data5(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data5(:,6,1),data5(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data5(:,7,1),data5(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        hAxis(6) = subplot(3,3,6);
        mx1 = max ([length(Act_Duration12),length(Act_Duration13),length(Act_Duration2),length(Act_Duration7),length(Act_Duration3),length(Act_Duration6),length(Act_Duration4),length(Act_Duration5),length(Act_Duration9),length(Act_Duration16),length(Act_Duration10),length(Act_Duration15),length(Act_Duration11),length(Act_Duration14)]);
        data6 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data6 (1:length(Act_Duration12),1,1) = Act_Duration12';
        data6 (1:length(Act_Duration13),1,2) = Act_Duration13';
        data6 (1:length(Act_Duration2),2,1) = Act_Duration2';
        data6 (1:length(Act_Duration7),2,2) = Act_Duration7';
        data6 (1:length(Act_Duration3),3,1) = Act_Duration3';
        data6 (1:length(Act_Duration6),3,2) = Act_Duration6';
        data6 (1:length(Act_Duration4),4,1) = Act_Duration4';
        data6 (1:length(Act_Duration5),4,2) = Act_Duration5';
        data6 (1:length(Act_Duration9),5,1) = Act_Duration9';
        data6 (1:length(Act_Duration16),5,2) = Act_Duration16';
        data6 (1:length(Act_Duration10),6,1) = Act_Duration10';
        data6 (1:length(Act_Duration15),6,2) = Act_Duration15';
        data6 (1:length(Act_Duration11),7,1) = Act_Duration11';
        data6 (1:length(Act_Duration14),7,2) = Act_Duration14';
%         data6 (1:length(Act_Duration12),8,1) = Act_Duration12';
%         data6 (1:length(Act_Duration13),8,2) = Act_Duration13';

 
        
        % Convert zero values to nan
%         data6 (data6==0)=nan;
        h = iosr.statistics.boxPlot(st,data6,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Duration (hr)','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
        %         xticklabels({'Monolayer','Single Cell'});
        %         xtickangle(45)
        %         hAxes = gca;
        %         hAxes.XAxis.FontSize = 14;
        %         turn off the tick label
                set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data6(:,1,1),data6(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data6(:,2,1),data6(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data6(:,3,1),data6(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data6(:,4,1),data6(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data6(:,5,1),data6(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data6(:,6,1),data6(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data6(:,7,1),data6(:,7,2));
        sigstar({[6.75,7.25]},[p])
         %-------------------------------------------------------------------------
         hAxis(7) = subplot(3,3,7);
        mx1 = max ([length(rSlope12),length(rSlope13),length(rSlope2),length(rSlope7),length(rSlope3),length(rSlope6),length(rSlope4),length(rSlope5),length(rSlope9),length(rSlope16),length(rSlope10),length(rSlope15),length(rSlope11),length(rSlope14)]);
        data7 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data7 (1:length(rSlope12),1,1) = rSlope12';
        data7 (1:length(rSlope13),1,2) = rSlope13';
        data7 (1:length(rSlope2),2,1) = rSlope2';
        data7 (1:length(rSlope7),2,2) = rSlope7';
        data7 (1:length(rSlope3),3,1) = rSlope3';
        data7 (1:length(rSlope6),3,2) = rSlope6';
        data7 (1:length(rSlope4),4,1) = rSlope4';
        data7 (1:length(rSlope5),4,2) = rSlope5';
        data7 (1:length(rSlope9),5,1) = rSlope9';
        data7 (1:length(rSlope16),5,2) = rSlope16';
        data7 (1:length(rSlope10),6,1) = rSlope10';
        data7 (1:length(rSlope15),6,2) = rSlope15';
        data7 (1:length(rSlope11),7,1) = rSlope11';
        data7 (1:length(rSlope14),7,2) = rSlope14';
%         data7 (1:length(rSlope12),8,1) = rSlope12';
%         data7 (1:length(rSlope13),8,2) = rSlope13';
 
        
        % Convert zero values to nan
%         data7 (data7==0)=nan;
        h = iosr.statistics.boxPlot(st,data7,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('1st Rising Slope','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data7(:,1,1),data7(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data7(:,2,1),data7(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data7(:,3,1),data7(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data7(:,4,1),data7(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data7(:,5,1),data7(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data7(:,6,1),data7(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data7(:,7,1),data7(:,7,2));
        sigstar({[6.75,7.25]},[p])
         %-------------------------------------------------------------------------
        hAxis(8) = subplot(3,3,8);
        mx1 = max ([length(fSlope12),length(fSlope13),length(fSlope2),length(fSlope7),length(fSlope3),length(fSlope6),length(fSlope4),length(fSlope5),length(fSlope9),length(fSlope16),length(fSlope10),length(fSlope15),length(fSlope11),length(fSlope14)]);
        data8 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data8 (1:length(fSlope12),1,1) = fSlope12';
        data8 (1:length(fSlope13),1,2) = fSlope13';
        data8 (1:length(fSlope2),2,1) = fSlope2';
        data8 (1:length(fSlope7),2,2) = fSlope7';
        data8 (1:length(fSlope3),3,1) = fSlope3';
        data8 (1:length(fSlope6),3,2) = fSlope6';
        data8 (1:length(fSlope4),4,1) = fSlope4';
        data8 (1:length(fSlope5),4,2) = fSlope5';
        data8 (1:length(fSlope9),5,1) = fSlope9';
        data8 (1:length(fSlope16),5,2) = fSlope16';
        data8 (1:length(fSlope10),6,1) = fSlope10';
        data8 (1:length(fSlope15),6,2) = fSlope15';
        data8 (1:length(fSlope11),7,1) = fSlope11';
        data8 (1:length(fSlope14),7,2) = fSlope14';
%         data8 (1:length(fSlope12),8,1) = fSlope12';
%         data8 (1:length(fSlope13),8,2) = fSlope13';

       
        % Convert zero values to nan
%         data8 (data8==0)=nan;
        h = iosr.statistics.boxPlot(st,data8,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Attenuation rate','FontSize',12)
                ylim([-.15, 0.2])
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data8(:,1,1),data8(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data8(:,2,1),data8(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data8(:,3,1),data8(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data8(:,4,1),data8(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data8(:,5,1),data8(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data8(:,6,1),data8(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data8(:,7,1),data8(:,7,2));
        sigstar({[6.75,7.25]},[p])
        % -------------------------------------------------------------------------
        hAxis(9) = subplot(3,3,9);
        mx1 = max ([length(OsPrd12),length(OsPrd13),length(OsPrd2),length(OsPrd7),length(OsPrd3),length(OsPrd6),length(OsPrd4),length(OsPrd5),length(OsPrd9),length(OsPrd16),length(OsPrd10),length(OsPrd15),length(OsPrd11),length(OsPrd14)]);
        data9 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data9 (1:length(OsPrd1),1,1) = OsPrd1';
        data9 (1:length(OsPrd8),1,2) = OsPrd8';
        data9 (1:length(OsPrd2),2,1) = OsPrd2';
        data9 (1:length(OsPrd7),2,2) = OsPrd7';
        data9 (1:length(OsPrd3),3,1) = OsPrd3';
        data9 (1:length(OsPrd6),3,2) = OsPrd6';
        data9 (1:length(OsPrd4),4,1) = OsPrd4';
        data9 (1:length(OsPrd5),4,2) = OsPrd5';
        data9 (1:length(OsPrd9),5,1) = OsPrd9';
        data9 (1:length(OsPrd16),5,2) = OsPrd16';
        data9 (1:length(OsPrd10),6,1) = OsPrd10';
        data9 (1:length(OsPrd15),6,2) = OsPrd15';
        data9 (1:length(OsPrd11),7,1) = OsPrd11';
        data9 (1:length(OsPrd14),7,2) = OsPrd14';
%         data9 (1:length(OsPrd12),8,1) = OsPrd12';
%         data9 (1:length(OsPrd13),8,2) = OsPrd13';

        
        % Convert zero values to nan
%         data9 (data9==0)=nan;
        h = iosr.statistics.boxPlot(st,data9,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Period (hr)','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data9(:,1,1),data9(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data9(:,2,1),data9(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data9(:,3,1),data9(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data9(:,4,1),data9(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data9(:,5,1),data9(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data9(:,6,1),data9(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data9(:,7,1),data9(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        NarrowSubplot (3,3,hAxis,0.05,0.2,0.135,0.1,0.08,0.04);
      
        % SAVING figure in the output directory
        cd (outputFolder);
        exportgraphics(gcf,[qAFigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
        exportgraphics(gcf,[qAFigName,'.tif'],'Resolution',300);  % Saving as .tif file
        close
%% Plotting the quantification for c-Rel
 St_Frame1 = 9;
 frequency1 = 7;
 St_Frame2 = 11;
 frequency2 = 7;
 st = {' ',' ',' ',' ',' ',' ',' '};
 fig4 = figure(4);
 set(gcf,'Units','inches',...
     'Position',[0 0 14 6])
 
 hAxis(1) = subplot(3,3,1);
        [PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,smNuc12(3:end,:),St_Frame1,frequency1);
        [PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line2,smNuc22(3:end,:),St_Frame1,frequency1);
        [PeakValue3,PeakTime3,AUC3,NOC3,Act_Duration3,rSlope3,fSlope3,OsPrd3] = Extract8Variable (Time_line3,smNuc32(3:end,:),St_Frame1,frequency1);
        [PeakValue4,PeakTime4,AUC4,NOC4,Act_Duration4,rSlope4,fSlope4,OsPrd4] = Extract8Variable (Time_line4,smNuc42(3:end,:),St_Frame1,frequency1);
        [PeakValue5,PeakTime5,AUC5,NOC5,Act_Duration5,rSlope5,fSlope5,OsPrd5] = Extract8Variable (Time_line5,smNuc52(3:end,:),St_Frame1,frequency1);
        [PeakValue6,PeakTime6,AUC6,NOC6,Act_Duration6,rSlope6,fSlope6,OsPrd6] = Extract8Variable (Time_line6,smNuc62(3:end,:),St_Frame1,frequency1);
        [PeakValue7,PeakTime7,AUC7,NOC7,Act_Duration7,rSlope7,fSlope7,OsPrd7] = Extract8Variable (Time_line7,smNuc72(3:end,:),St_Frame1,frequency1);
        [PeakValue8,PeakTime8,AUC8,NOC8,Act_Duration8,rSlope8,fSlope8,OsPrd8] = Extract8Variable (Time_line8,smNuc82(3:end,:),St_Frame1,frequency1);
        
        [PeakValue9,PeakTime9,AUC9,NOC9,Act_Duration9,rSlope9,fSlope9,OsPrd9] = Extract8Variable (Time_line9,smNuc92(3:end,:),St_Frame1,frequency1);
        [PeakValue10,PeakTime10,AUC10,NOC10,Act_Duration10,rSlope10,fSlope10,OsPrd10] = Extract8Variable (Time_line10,smNuc102(3:end,:),St_Frame2,frequency2);
        [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line11,smNuc112(3:end,:),St_Frame2,frequency2);
        [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc122(3:end,:),St_Frame2,frequency2);
        [PeakValue13,PeakTime13,AUC13,NOC13,Act_Duration13,rSlope13,fSlope13,OsPrd13] = Extract8Variable (Time_line13,smNuc132(3:end,:),St_Frame2,frequency2);
        [PeakValue14,PeakTime14,AUC14,NOC14,Act_Duration14,rSlope14,fSlope14,OsPrd14] = Extract8Variable (Time_line14,smNuc142(3:end,:),St_Frame2,frequency2);
        [PeakValue15,PeakTime15,AUC15,NOC15,Act_Duration15,rSlope15,fSlope15,OsPrd15] = Extract8Variable (Time_line15,smNuc152(3:end,:),St_Frame2,frequency2);
        [PeakValue16,PeakTime16,AUC16,NOC16,Act_Duration16,rSlope16,fSlope16,OsPrd16] = Extract8Variable (Time_line16,smNuc162(3:end,:),St_Frame2,frequency2);
        
        % Make data matrix for the Violin plot Monolayer Vs Single Cell
        mx1 = max ([length(PeakValue12),length(PeakValue13),length(PeakValue2),length(PeakValue7),length(PeakValue3),length(PeakValue6),length(PeakValue4),length(PeakValue5),length(PeakValue9),length(PeakValue16),length(PeakValue10),length(PeakValue15),length(PeakValue11),length(PeakValue14)]);
        data1 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data1 (1:length(PeakValue12),1,1) = PeakValue12';
        data1 (1:length(PeakValue13),1,2) = PeakValue13';
        data1 (1:length(PeakValue2),2,1) = PeakValue2';
        data1 (1:length(PeakValue7),2,2) = PeakValue7';
        data1 (1:length(PeakValue3),3,1) = PeakValue3';
        data1 (1:length(PeakValue6),3,2) = PeakValue6';
        data1 (1:length(PeakValue4),4,1) = PeakValue4';
        data1 (1:length(PeakValue5),4,2) = PeakValue5';
        data1 (1:length(PeakValue9),5,1) = PeakValue9';
        data1 (1:length(PeakValue16),5,2) = PeakValue16';
        data1 (1:length(PeakValue10),6,1) = PeakValue10';
        data1 (1:length(PeakValue15),6,2) = PeakValue15';
        data1 (1:length(PeakValue11),7,1) = PeakValue11';
        data1 (1:length(PeakValue14),7,2) = PeakValue14';
%         data1 (1:length(PeakValue12),8,1) = PeakValue12';
%         data1 (1:length(PeakValue13),8,2) = PeakValue13';
        
        h = iosr.statistics.boxPlot(st,data1,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'Y','O'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Amplitude','FontSize',12)
%         ax=gca;
%         ax.YAxis.Exponent=3;

        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data1(:,1,1),data1(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data1(:,2,1),data1(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data1(:,3,1),data1(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data1(:,4,1),data1(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data1(:,5,1),data1(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data1(:,6,1),data1(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data1(:,7,1),data1(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        hAxis(2) = subplot(3,3,2);
        mx1 = max ([length(PeakTime12),length(PeakTime13),length(PeakTime2),length(PeakTime7),length(PeakTime3),length(PeakTime6),length(PeakTime4),length(PeakTime5),length(PeakTime9),length(PeakTime16),length(PeakTime10),length(PeakTime15),length(PeakTime11),length(PeakTime14)]);
        data2 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data2 (1:length(PeakTime12),1,1) = PeakTime12';
        data2 (1:length(PeakTime13),1,2) = PeakTime13';
        data2 (1:length(PeakTime2),2,1) = PeakTime2';
        data2 (1:length(PeakTime7),2,2) = PeakTime7';
        data2 (1:length(PeakTime3),3,1) = PeakTime3';
        data2 (1:length(PeakTime6),3,2) = PeakTime6';
        data2 (1:length(PeakTime4),4,1) = PeakTime4';
        data2 (1:length(PeakTime5),4,2) = PeakTime5';
        data2 (1:length(PeakTime9),5,1) = PeakTime9';
        data2 (1:length(PeakTime16),5,2) = PeakTime16';
        data2 (1:length(PeakTime10),6,1) = PeakTime10';
        data2 (1:length(PeakTime15),6,2) = PeakTime15';
        data2 (1:length(PeakTime11),7,1) = PeakTime11';
        data2 (1:length(PeakTime14),7,2) = PeakTime14';
%         data2 (1:length(PeakTime12),8,1) = PeakTime12';
%         data2 (1:length(PeakTime13),8,2) = PeakTime13';
        
        h = iosr.statistics.boxPlot(st,data2,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'Y','O'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000],[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Time to peak (hr)','FontSize',12)
                
        ylim([0,8]);
%         axis([0.4 3.6 0 6])
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data2(:,1,1),data2(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data2(:,2,1),data2(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data2(:,3,1),data2(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data2(:,4,1),data2(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data2(:,5,1),data2(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data2(:,6,1),data2(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data2(:,7,1),data2(:,7,2));
        sigstar({[6.75,7.25]},[p])

        %------------------------------------------------------------------
        hAxis(3) = subplot(3,3,3);
        mx1 = max ([length(AUC12),length(AUC13),length(AUC2),length(AUC7),length(AUC3),length(AUC6),length(AUC4),length(AUC5),length(AUC9),length(AUC16),length(AUC10),length(AUC15),length(AUC11),length(AUC14)]);
        data3 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data3 (1:length(AUC12),1,1) = AUC12';
        data3 (1:length(AUC13),1,2) = AUC13';
        data3 (1:length(AUC2),2,1) = AUC2';
        data3 (1:length(AUC7),2,2) = AUC7';
        data3 (1:length(AUC3),3,1) = AUC3';
        data3 (1:length(AUC6),3,2) = AUC6';
        data3 (1:length(AUC4),4,1) = AUC4';
        data3 (1:length(AUC5),4,2) = AUC5';
        data3 (1:length(AUC9),5,1) = AUC9';
        data3 (1:length(AUC16),5,2) = AUC16';
        data3 (1:length(AUC10),6,1) = AUC10';
        data3 (1:length(AUC15),6,2) = AUC15';
        data3 (1:length(AUC11),7,1) = AUC11';
        data3 (1:length(AUC14),7,2) = AUC14';
%         data3 (1:length(AUC12),8,1) = AUC12';
%         data3 (1:length(AUC13),8,2) = AUC13';
        
        h = iosr.statistics.boxPlot(st,data3,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'Y','O'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('AUC','FontSize',12)
%         axis([0.4 3.6 0 6])
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
%         hAxes = gca;
%         hAxes.XAxis.FontSize = 14;
%         turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data3(:,1,1),data3(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data3(:,2,1),data3(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data3(:,3,1),data3(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data3(:,4,1),data3(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data3(:,5,1),data3(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data3(:,6,1),data3(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data3(:,7,1),data3(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        basal = mean(smNuc12(3:St_Frame1,:),1);
        smNuc12 = smNuc12./basal;
        basal = mean(smNuc22(3:St_Frame1,:),1);
        smNuc22 = smNuc22./basal;
        basal = mean(smNuc32(3:St_Frame1,:),1);
        smNuc32 = smNuc32./basal;
        basal = mean(smNuc42(3:St_Frame1,:),1);
        smNuc42 = smNuc42./basal;
        basal = mean(smNuc52(3:St_Frame1,:),1);
        smNuc52 = smNuc52./basal;
        basal = mean(smNuc62(3:St_Frame1,:),1);
        smNuc62 = smNuc62./basal;
        basal = mean(smNuc72(3:St_Frame1,:),1);
        smNuc72 = smNuc72./basal;
        basal = mean(smNuc82(3:St_Frame1,:),1);
        smNuc82 = smNuc82./basal;
        
        basal = mean(smNuc92(3:St_Frame2,:),1);
        smNuc92 = smNuc92./basal;
        basal = mean(smNuc102(3:St_Frame2,:),1);
        smNuc102 = smNuc102./basal;
        basal = mean(smNuc112(3:St_Frame2,:),1);
        smNuc112 = smNuc112./basal;
        basal = mean(smNuc122(3:St_Frame2,:),1);
        smNuc122 = smNuc122./basal;
        basal = mean(smNuc132(3:St_Frame2,:),1);
        smNuc132 = smNuc132./basal;
        basal = mean(smNuc142(3:St_Frame2,:),1);
        smNuc142 = smNuc142./basal;
        basal = mean(smNuc152(3:St_Frame2,:),1);
        smNuc152 = smNuc152./basal;
        basal = mean(smNuc162(3:St_Frame2,:),1);
        smNuc162 = smNuc162./basal;

        % Use the Quantification of 8 parameters
        [PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,smNuc12(3:end,:),St_Frame1,frequency1);
        [PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line2,smNuc22(3:end,:),St_Frame1,frequency1);
        [PeakValue3,PeakTime3,AUC3,NOC3,Act_Duration3,rSlope3,fSlope3,OsPrd3] = Extract8Variable (Time_line3,smNuc32(3:end,:),St_Frame1,frequency1);
        [PeakValue4,PeakTime4,AUC4,NOC4,Act_Duration4,rSlope4,fSlope4,OsPrd4] = Extract8Variable (Time_line4,smNuc42(3:end,:),St_Frame1,frequency1);
        [PeakValue5,PeakTime5,AUC5,NOC5,Act_Duration5,rSlope5,fSlope5,OsPrd5] = Extract8Variable (Time_line5,smNuc52(3:end,:),St_Frame1,frequency1);
        [PeakValue6,PeakTime6,AUC6,NOC6,Act_Duration6,rSlope6,fSlope6,OsPrd6] = Extract8Variable (Time_line6,smNuc62(3:end,:),St_Frame1,frequency1);
        [PeakValue7,PeakTime7,AUC7,NOC7,Act_Duration7,rSlope7,fSlope7,OsPrd7] = Extract8Variable (Time_line7,smNuc72(3:end,:),St_Frame1,frequency1);
        [PeakValue8,PeakTime8,AUC8,NOC8,Act_Duration8,rSlope8,fSlope8,OsPrd8] = Extract8Variable (Time_line8,smNuc82(3:end,:),St_Frame1,frequency1);
        
        [PeakValue9,PeakTime9,AUC9,NOC9,Act_Duration9,rSlope9,fSlope9,OsPrd9] = Extract8Variable (Time_line9,smNuc92(3:end,:),St_Frame1,frequency1);
        [PeakValue10,PeakTime10,AUC10,NOC10,Act_Duration10,rSlope10,fSlope10,OsPrd10] = Extract8Variable (Time_line10,smNuc102(3:end,:),St_Frame2,frequency2);
        [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line11,smNuc112(3:end,:),St_Frame2,frequency2);
        [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc122(3:end,:),St_Frame2,frequency2);
        [PeakValue13,PeakTime13,AUC13,NOC13,Act_Duration13,rSlope13,fSlope13,OsPrd13] = Extract8Variable (Time_line13,smNuc132(3:end,:),St_Frame2,frequency2);
        [PeakValue14,PeakTime14,AUC14,NOC14,Act_Duration14,rSlope14,fSlope14,OsPrd14] = Extract8Variable (Time_line14,smNuc142(3:end,:),St_Frame2,frequency2);
        [PeakValue15,PeakTime15,AUC15,NOC15,Act_Duration15,rSlope15,fSlope15,OsPrd15] = Extract8Variable (Time_line15,smNuc152(3:end,:),St_Frame2,frequency2);
        [PeakValue16,PeakTime16,AUC16,NOC16,Act_Duration16,rSlope16,fSlope16,OsPrd16] = Extract8Variable (Time_line16,smNuc162(3:end,:),St_Frame2,frequency2);

        hAxis(4) = subplot(3,3,4);
        mx1 = max ([length(AUC12),length(AUC13),length(AUC2),length(AUC7),length(AUC3),length(AUC6),length(AUC4),length(AUC5),length(AUC9),length(AUC16),length(AUC10),length(AUC15),length(AUC11),length(AUC14)]);
        data4 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data4 (1:length(AUC12),1,1) = AUC12';
        data4 (1:length(AUC13),1,2) = AUC13';
        data4 (1:length(AUC2),2,1) = AUC2';
        data4 (1:length(AUC7),2,2) = AUC7';
        data4 (1:length(AUC3),3,1) = AUC3';
        data4 (1:length(AUC6),3,2) = AUC6';
        data4 (1:length(AUC4),4,1) = AUC4';
        data4 (1:length(AUC5),4,2) = AUC5';
        data4 (1:length(AUC9),5,1) = AUC9';
        data4 (1:length(AUC16),5,2) = AUC16';
        data4 (1:length(AUC10),6,1) = AUC10';
        data4 (1:length(AUC15),6,2) = AUC15';
        data4 (1:length(AUC11),7,1) = AUC11';
        data4 (1:length(AUC14),7,2) = AUC14';
%         data4 (1:length(AUC12),8,1) = AUC12';
%         data4 (1:length(AUC13),8,2) = AUC13';
        
        % Convert zero values to nan
%         data4 (data4==0)=nan;
        h = iosr.statistics.boxPlot(st,data4,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('AUC (fold change)','FontSize',12)
                ax=gca;
                ax.YAxis.Exponent=2;
                %title ('','FontSize',14);
                % Adding xtick label
        %         xticklabels({'Monolayer','Single Cell'});
        %         xtickangle(45)
        %         hAxes = gca;
        %         hAxes.XAxis.FontSize = 14;
        %         turn off the tick label
                set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data4(:,1,1),data4(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data4(:,2,1),data4(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data4(:,3,1),data4(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data4(:,4,1),data4(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data4(:,5,1),data4(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data4(:,6,1),data4(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data4(:,7,1),data4(:,7,2));
        sigstar({[6.75,7.25]},[p])
        
        %------------------------------------------------------------------
        hAxis(5) = subplot(3,3,5);
        mx1 = max ([length(NOC12),length(NOC13),length(NOC2),length(NOC7),length(NOC3),length(NOC6),length(NOC4),length(NOC5),length(NOC9),length(NOC16),length(NOC10),length(NOC15),length(NOC11),length(NOC14)]);
        data5 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data5 (1:length(NOC12),1,1) = NOC12';
        data5 (1:length(NOC13),1,2) = NOC13';
        data5 (1:length(NOC2),2,1) = NOC2';
        data5 (1:length(NOC7),2,2) = NOC7';
        data5 (1:length(NOC3),3,1) = NOC3';
        data5 (1:length(NOC6),3,2) = NOC6';
        data5 (1:length(NOC4),4,1) = NOC4';
        data5 (1:length(NOC5),4,2) = NOC5';
        data5 (1:length(NOC9),5,1) = NOC9';
        data5 (1:length(NOC16),5,2) = NOC16';
        data5 (1:length(NOC10),6,1) = NOC10';
        data5 (1:length(NOC15),6,2) = NOC15';
        data5 (1:length(NOC11),7,1) = NOC11';
        data5 (1:length(NOC14),7,2) = NOC14';
%         data5 (1:length(NOC12),8,1) = NOC12';
%         data5 (1:length(NOC13),8,2) = NOC13';
        
        % Convert zero values to nan
%         data5 (data5==0)=nan;
        h = iosr.statistics.boxPlot(st,data5,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Cycle number','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
        %         xticklabels({'Monolayer','Single Cell'});
        %         xtickangle(45)
        %         hAxes = gca;
        %         hAxes.XAxis.FontSize = 14;
        %         turn off the tick label
                set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data5(:,1,1),data5(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data5(:,2,1),data5(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data5(:,3,1),data5(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data5(:,4,1),data5(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data5(:,5,1),data5(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data5(:,6,1),data5(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data5(:,7,1),data5(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        hAxis(6) = subplot(3,3,6);
        mx1 = max ([length(Act_Duration12),length(Act_Duration13),length(Act_Duration2),length(Act_Duration7),length(Act_Duration3),length(Act_Duration6),length(Act_Duration4),length(Act_Duration5),length(Act_Duration9),length(Act_Duration16),length(Act_Duration10),length(Act_Duration15),length(Act_Duration11),length(Act_Duration14)]);
        data6 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data6 (1:length(Act_Duration12),1,1) = Act_Duration12';
        data6 (1:length(Act_Duration13),1,2) = Act_Duration13';
        data6 (1:length(Act_Duration2),2,1) = Act_Duration2';
        data6 (1:length(Act_Duration7),2,2) = Act_Duration7';
        data6 (1:length(Act_Duration3),3,1) = Act_Duration3';
        data6 (1:length(Act_Duration6),3,2) = Act_Duration6';
        data6 (1:length(Act_Duration4),4,1) = Act_Duration4';
        data6 (1:length(Act_Duration5),4,2) = Act_Duration5';
        data6 (1:length(Act_Duration9),5,1) = Act_Duration9';
        data6 (1:length(Act_Duration16),5,2) = Act_Duration16';
        data6 (1:length(Act_Duration10),6,1) = Act_Duration10';
        data6 (1:length(Act_Duration15),6,2) = Act_Duration15';
        data6 (1:length(Act_Duration11),7,1) = Act_Duration11';
        data6 (1:length(Act_Duration14),7,2) = Act_Duration14';
%         data6 (1:length(Act_Duration12),8,1) = Act_Duration12';
%         data6 (1:length(Act_Duration13),8,2) = Act_Duration13';

 
        
        % Convert zero values to nan
%         data6 (data6==0)=nan;
        h = iosr.statistics.boxPlot(st,data6,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Duration (hr)','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
        %         xticklabels({'Monolayer','Single Cell'});
        %         xtickangle(45)
        %         hAxes = gca;
        %         hAxes.XAxis.FontSize = 14;
        %         turn off the tick label
                set(gca,'xticklabel',{[]})
                box off
                
                % Mann-Whitney U-test p value 
        p = ranksum (data6(:,1,1),data6(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data6(:,2,1),data6(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data6(:,3,1),data6(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data6(:,4,1),data6(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data6(:,5,1),data6(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data6(:,6,1),data6(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data6(:,7,1),data6(:,7,2));
        sigstar({[6.75,7.25]},[p])
                
         %-------------------------------------------------------------------------
         hAxis(7) = subplot(3,3,7);
        mx1 = max ([length(rSlope12),length(rSlope13),length(rSlope2),length(rSlope7),length(rSlope3),length(rSlope6),length(rSlope4),length(rSlope5),length(rSlope9),length(rSlope16),length(rSlope10),length(rSlope15),length(rSlope11),length(rSlope14)]);
        data7 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data7 (1:length(rSlope12),1,1) = rSlope12';
        data7 (1:length(rSlope13),1,2) = rSlope13';
        data7 (1:length(rSlope2),2,1) = rSlope2';
        data7 (1:length(rSlope7),2,2) = rSlope7';
        data7 (1:length(rSlope3),3,1) = rSlope3';
        data7 (1:length(rSlope6),3,2) = rSlope6';
        data7 (1:length(rSlope4),4,1) = rSlope4';
        data7 (1:length(rSlope5),4,2) = rSlope5';
        data7 (1:length(rSlope9),5,1) = rSlope9';
        data7 (1:length(rSlope16),5,2) = rSlope16';
        data7 (1:length(rSlope10),6,1) = rSlope10';
        data7 (1:length(rSlope15),6,2) = rSlope15';
        data7 (1:length(rSlope11),7,1) = rSlope11';
        data7 (1:length(rSlope14),7,2) = rSlope14';
%         data7 (1:length(rSlope12),8,1) = rSlope12';
%         data7 (1:length(rSlope13),8,2) = rSlope13';
 
        
        % Convert zero values to nan
%         data7 (data7==0)=nan;
        h = iosr.statistics.boxPlot(st,data7,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,... 
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('1st Rising Slope','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
        % Mann-Whitney U-test p value 
        p = ranksum (data7(:,1,1),data7(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data7(:,2,1),data7(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data7(:,3,1),data7(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data7(:,4,1),data7(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data7(:,5,1),data7(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data7(:,6,1),data7(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data7(:,7,1),data7(:,7,2));
        sigstar({[6.75,7.25]},[p])
         %-------------------------------------------------------------------------
        hAxis(8) = subplot(3,3,8);
        mx1 = max ([length(fSlope12),length(fSlope13),length(fSlope2),length(fSlope7),length(fSlope3),length(fSlope6),length(fSlope4),length(fSlope5),length(fSlope9),length(fSlope16),length(fSlope10),length(fSlope15),length(fSlope11),length(fSlope14)]);
        data8 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data8 (1:length(fSlope12),1,1) = fSlope12';
        data8 (1:length(fSlope13),1,2) = fSlope13';
        data8 (1:length(fSlope2),2,1) = fSlope2';
        data8 (1:length(fSlope7),2,2) = fSlope7';
        data8 (1:length(fSlope3),3,1) = fSlope3';
        data8 (1:length(fSlope6),3,2) = fSlope6';
        data8 (1:length(fSlope4),4,1) = fSlope4';
        data8 (1:length(fSlope5),4,2) = fSlope5';
        data8 (1:length(fSlope9),5,1) = fSlope9';
        data8 (1:length(fSlope16),5,2) = fSlope16';
        data8 (1:length(fSlope10),6,1) = fSlope10';
        data8 (1:length(fSlope15),6,2) = fSlope15';
        data8 (1:length(fSlope11),7,1) = fSlope11';
        data8 (1:length(fSlope14),7,2) = fSlope14';
%         data8 (1:length(fSlope12),8,1) = fSlope12';
%         data8 (1:length(fSlope13),8,2) = fSlope13';

       
        % Convert zero values to nan
%         data8 (data8==0)=nan;
        h = iosr.statistics.boxPlot(st,data8,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Attenuation rate','FontSize',12)
                ylim([-.2 0.2])
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
                % Mann-Whitney U-test p value 
        p = ranksum (data8(:,1,1),data8(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data8(:,2,1),data8(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data8(:,3,1),data8(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data8(:,4,1),data8(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data8(:,5,1),data8(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data8(:,6,1),data8(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data8(:,7,1),data8(:,7,2));
        sigstar({[6.75,7.25]},[p])
        % -------------------------------------------------------------------------
        hAxis(9) = subplot(3,3,9);
        mx1 = max ([length(OsPrd12),length(OsPrd13),length(OsPrd2),length(OsPrd7),length(OsPrd3),length(OsPrd6),length(OsPrd4),length(OsPrd5),length(OsPrd9),length(OsPrd16),length(OsPrd10),length(OsPrd15),length(OsPrd11),length(OsPrd14)]);
        data9 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data9 (1:length(OsPrd12),1,1) = OsPrd12';
        data9 (1:length(OsPrd13),1,2) = OsPrd13';
        data9 (1:length(OsPrd2),2,1) = OsPrd2';
        data9 (1:length(OsPrd7),2,2) = OsPrd7';
        data9 (1:length(OsPrd3),3,1) = OsPrd3';
        data9 (1:length(OsPrd6),3,2) = OsPrd6';
        data9 (1:length(OsPrd4),4,1) = OsPrd4';
        data9 (1:length(OsPrd5),4,2) = OsPrd5';
        data9 (1:length(OsPrd9),5,1) = OsPrd9';
        data9 (1:length(OsPrd16),5,2) = OsPrd16';
        data9 (1:length(OsPrd10),6,1) = OsPrd10';
        data9 (1:length(OsPrd15),6,2) = OsPrd15';
        data9 (1:length(OsPrd11),7,1) = OsPrd11';
        data9 (1:length(OsPrd14),7,2) = OsPrd14';
%         data9 (1:length(OsPrd12),8,1) = OsPrd12';
%         data9 (1:length(OsPrd13),8,2) = OsPrd13';

        
        % Convert zero values to nan
%         data9 (data9==0)=nan;
        h = iosr.statistics.boxPlot(st,data9,...
                    'style','hierarchy',...
                    'xSeparator',false,...
                    'symbolColor','k',...
                    'medianColor','k',...
                    'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
                    'groupLabels',{{'Y','O'}},...
                    'showScatter',true,...
                    'showMean',true,...
                    'meanMarker','+',...
                    'meanColor', 'magenta',...
                    'limit',[5,95],...
                    'boxWidth',0.150,...                 % % The width of the boxes.
                    'showScatter',true,...
                    'scatterMarker', '.',...
                    'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0]},...
                    'scatterLayer', 'top',...
                    'scatterSize', 6,...
                    'violinWidth', 'auto',...
                    'showViolin',  true,...
                    'violinColor',[1,1,1],...
                    'showOutliers', true,...
                    'outlierSize',3,...
                    'violinBinWidth', 'auto');
                % Adding ylabel and titile
                box on
                ylabel ('Period (hr)','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
                % Mann-Whitney U-test p value 
        p = ranksum (data9(:,1,1),data9(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data9(:,2,1),data9(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data9(:,3,1),data9(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data9(:,4,1),data9(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data9(:,5,1),data9(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data9(:,6,1),data9(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data9(:,7,1),data9(:,7,2));
        sigstar({[6.75,7.25]},[p])
        %------------------------------------------------------------------
        NarrowSubplot (3,3,hAxis,0.05,0.2,0.135,0.1,0.08,0.04);
        % SAVING figure in the output directory
        cd (outputFolder);
        exportgraphics(gcf,[qCFigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
        exportgraphics(gcf,[qCFigName,'.tif'],'Resolution',300);  % Saving as .tif file
        close
    
    
end 

%% Basal expression of RelA and c-Rel between Young and Old

for iA = 1:1
    if iA ==1  % ratio signal
        cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mC11 = load(R1).T7;
        mC12 = load(R1).T8;
        Time_line2 = load(R2).Time_line;
        mC21 = load(R2).T7;
        mC22 = load(R2).T8;
        Time_line3 = load(R3).Time_line;
        mC31 = load(R3).T7;
        mC32 = load(R3).T8;
        Time_line4 = load(R4).Time_line;
        mC41 = load(R4).T7;
        mC42 = load(R4).T8;
        Time_line5 = load(R5).Time_line;
        mC51 = load(R5).T7;
        mC52 = load(R5).T8;
        Time_line6 = load(R6).Time_line;
        mC61 = load(R6).T7;
        mC62 = load(R6).T8;
        Time_line7 = load(R7).Time_line;
        mC71 = load(R7).T7;
        mC72 = load(R7).T8;
        Time_line8 = load(R8).Time_line;
        mC81 = load(R8).T7;
        mC82 = load(R8).T8;
 
        smC11 = load(sR1).ST7;
        smC12 = load(sR1).ST8;
        smC21 = load(sR2).ST7;
        smC22 = load(sR2).ST8;
        smC31 = load(sR3).ST7;
        smC32 = load(sR3).ST8;
        smC41 = load(sR4).ST7;
        smC42 = load(sR4).ST8;
        smC51 = load(sR5).ST7;
        smC52 = load(sR5).ST8;
        smC61 = load(sR6).ST7;
        smC62 = load(sR6).ST8;
        smC71 = load(sR7).ST7;
        smC72 = load(sR7).ST8;
        smC81 = load(sR8).ST7;
        smC82 = load(sR8).ST8;
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mC91 = load(R1).T7;
        mC92 = load(R1).T8;
        Time_line10 = load(R2).Time_line;
        mC101 = load(R2).T7;
        mC102 = load(R2).T8;
        Time_line11 = load(R3).Time_line;
        mC111 = load(R3).T7;
        mC112 = load(R3).T8;
        Time_line12 = load(R4).Time_line;
        mC121 = load(R4).T7;
        mC122 = load(R4).T8;
        Time_line13 = load(R5).Time_line;
        mC131 = load(R5).T7;
        mC132 = load(R5).T8;
        Time_line14 = load(R6).Time_line;
        mC141 = load(R6).T7;
        mC142 = load(R6).T8;
        Time_line15 = load(R7).Time_line;
        mC151 = load(R7).T7;
        mC152 = load(R7).T8;
        Time_line16 = load(R8).Time_line;
        mC161 = load(R8).T7;
        mC162 = load(R8).T8;
 
        smC91 = load(sR1).ST7;
        smC92 = load(sR1).ST8;
        smC101 = load(sR2).ST7;
        smC102 = load(sR2).ST8;
        smC111 = load(sR3).ST7;
        smC112 = load(sR3).ST8;
        smC121 = load(sR4).ST7;
        smC122 = load(sR4).ST8;
        smC131 = load(sR5).ST7;
        smC132 = load(sR5).ST8;
        smC141 = load(sR6).ST7;
        smC142 = load(sR6).ST8;
        smC151 = load(sR7).ST7;
        smC152 = load(sR7).ST8;
        smC161 = load(sR8).ST7;
        smC162 = load(sR8).ST8;
        
      
    elseif iA==2   % nuclar signal
        cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mC11 = load(R1).T5;
        mC12 = load(R1).T6;
        Time_line2 = load(R2).Time_line;
        mC21 = load(R2).T5;
        mC22 = load(R2).T6;
        Time_line3 = load(R3).Time_line;
        mC31 = load(R3).T5;
        mC32 = load(R3).T6;
        Time_line4 = load(R4).Time_line;
        mC41 = load(R4).T5;
        mC42 = load(R4).T6;
        Time_line5 = load(R5).Time_line;
        mC51 = load(R5).T5;
        mC52 = load(R5).T6;
        Time_line6 = load(R6).Time_line;
        mC61 = load(R6).T5;
        mC62 = load(R6).T6;
        Time_line7 = load(R7).Time_line;
        mC71 = load(R7).T5;
        mC72 = load(R7).T6;
        Time_line8 = load(R8).Time_line;
        mC81 = load(R8).T5;
        mC82 = load(R8).T6;
 
        smC11 = load(sR1).ST5;
        smC12 = load(sR1).ST6;
        smC21 = load(sR2).ST5;
        smC22 = load(sR2).ST6;
        smC31 = load(sR3).ST5;
        smC32 = load(sR3).ST6;
        smC41 = load(sR4).ST5;
        smC42 = load(sR4).ST6;
        smC51 = load(sR5).ST5;
        smC52 = load(sR5).ST6;
        smC61 = load(sR6).ST5;
        smC62 = load(sR6).ST6;
        smC71 = load(sR7).ST5;
        smC72 = load(sR7).ST6;
        smC81 = load(sR8).ST5;
        smC82 = load(sR8).ST6;
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mC91 = load(R1).T5;
        mC92 = load(R1).T6;
        Time_line10 = load(R2).Time_line;
        mC101 = load(R2).T5;
        mC102 = load(R2).T6;
        Time_line11 = load(R3).Time_line;
        mC111 = load(R3).T5;
        mC112 = load(R3).T6;
        Time_line12 = load(R4).Time_line;
        mC121 = load(R4).T5;
        mC122 = load(R4).T6;
        Time_line13 = load(R5).Time_line;
        mC131 = load(R5).T5;
        mC132 = load(R5).T6;
        Time_line14 = load(R6).Time_line;
        mC141 = load(R6).T5;
        mC142 = load(R6).T6;
        Time_line15 = load(R7).Time_line;
        mC151 = load(R7).T5;
        mC152 = load(R7).T6;
        Time_line16 = load(R8).Time_line;
        mC161 = load(R8).T5;
        mC162 = load(R8).T6;
 
        smC91 = load(sR1).ST5;
        smC92 = load(sR1).ST6;
        smC101 = load(sR2).ST5;
        smC102 = load(sR2).ST6;
        smC111 = load(sR3).ST5;
        smC112 = load(sR3).ST6;
        smC121 = load(sR4).ST5;
        smC122 = load(sR4).ST6;
        smC131 = load(sR5).ST5;
        smC132 = load(sR5).ST6;
        smC141 = load(sR6).ST5;
        smC142 = load(sR6).ST6;
        smC151 = load(sR7).ST5;
        smC152 = load(sR7).ST6;
        smC161 = load(sR8).ST5;
        smC162 = load(sR8).ST6;
        
    end
    
     st = {' ',' ',' ',' ',' ',' ',' '};
     fig4 = figure(5);
     set(gcf,'Units','inches',...
         'Position',[0 0 14 6])
     
        mx1 = max ([length(smC121(1,:)),length(smC131(1,:)),length(smC21(1,:)),length(smC71(1,:)),length(smC31(1,:)),length(smC61(1,:)),length(smC41(1,:)),length(smC51(1,:)),length(smC91(1,:)),length(smC161(1,:)),length(smC101(1,:)),length(smC151(1,:)),length(smC111(1,:)),length(smC141(1,:))]);
        data = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
        data (1:length(smC121(1,:)),1,1) = (smC121(3,:))';
        data (1:length(smC131(1,:)),1,2) = (smC131(3,:))';
        data (1:length(smC122(1,:)),1,3) = (smC122(3,:))';
        data (1:length(smC132(1,:)),1,4) = (smC132(3,:))';
        
        data (1:length(smC21(1,:)),2,1) = (smC21(3,:))';
        data (1:length(smC71(1,:)),2,2) = (smC71(3,:))';
        data (1:length(smC22(1,:)),2,3) = (smC22(3,:))';
        data (1:length(smC72(1,:)),2,4) = (smC72(3,:))';
        
        data (1:length(smC31(1,:)),3,1) = (smC31(3,:))';
        data (1:length(smC61(1,:)),3,2) = (smC61(3,:))';
        data (1:length(smC32(1,:)),3,3) = (smC32(3,:))';
        data (1:length(smC62(1,:)),3,4) = (smC62(3,:))';
        
        data (1:length(smC41(1,:)),4,1) = (smC41(3,:))';
        data (1:length(smC51(1,:)),4,2) = (smC51(3,:))';
        data (1:length(smC42(1,:)),4,3) = (smC42(3,:))';
        data (1:length(smC52(1,:)),4,4) = (smC52(3,:))';
        
        data (1:length(smC91(1,:)),5,1) = (smC91(1,:))';
        data (1:length(smC161(1,:)),5,2) = (smC161(1,:))';
        data (1:length(smC92(1,:)),5,3) = (smC92(1,:))';
        data (1:length(smC162(1,:)),5,4) = (smC162(1,:))';
        
        
        data (1:length(smC101(1,:)),6,1) = (smC101(3,:))';
        data (1:length(smC151(1,:)),6,2) = (smC151(3,:))';
        data (1:length(smC102(1,:)),6,3) = (smC102(3,:))';
        data (1:length(smC152(1,:)),6,4) = (smC152(3,:))';  
        
        data (1:length(smC111(1,:)),7,1) = (smC111(3,:))';
        data (1:length(smC141(1,:)),7,2) = (smC141(3,:))';
        data (1:length(smC112(1,:)),7,3) = (smC112(3,:))';
        data (1:length(smC142(1,:)),7,4) = (smC142(3,:))';

        
            h = iosr.statistics.boxPlot(st,data,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8];[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'YA','OA','YC','OC'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'magenta',...
            'limit',[5,95],...
            'boxWidth',0.10,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[1 0 0];[0.5000, 0.5000,0.5000];[1 0 0]},...
            'scatterLayer', 'top',...
            'scatterSize', 6,...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,...
            'outlierSize',3,...
            'violinBinWidth', 'auto');
        
        % Adding ylabel and titile
                box on
                ylabel ('Mean Cell Intensity','FontSize',12)
                %title ('','FontSize',14);
                % Adding xtick label
                xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF alpha'});
                xtickangle(45)
                hAxes = gca;
                hAxes.XAxis.FontSize = 10;
        %         turn off the tick label
        %         set(gca,'xticklabel',{[]})
                box off
                % Mann-Whitney U-test p value 
        p = ranksum (data(:,1,1),data(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data(:,2,1),data(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data(:,3,1),data(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data(:,4,1),data(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data(:,5,1),data(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data(:,6,1),data(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data(:,7,1),data(:,7,2));
        sigstar({[6.75,7.25]},[p])

end
 
%% Plotting the correlation matrix between the RelA and c-Rel for the Young 
frequency = 7;
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);

 for stID = 1:7
 figure (stID+5);
 if stID ==1
     StimulationName = 'LPS Enzo';
     Time_line1 = Time_line12;
     rNC1 = smNuc121;            % Rel-A data 
     rNC2 = smNuc122;            % c-Rel data
     St_Frame = 9;
 elseif stID ==2
     StimulationName = 'Flagellin';
     Time_line1 = Time_line2;
     rNC1 = smNuc21;            % Rel-A data 
     rNC2 = smNuc22;            % c-Rel data
     St_Frame = 9;
 elseif stID==3
     StimulationName = 'CpG';
     Time_line1 = Time_line3;
     rNC1 = smNuc31;            % Rel-A data 
     rNC2 = smNuc32;            % c-Rel data
     St_Frame = 9;
 elseif stID ==4
     StimulationName = 'Poly(I_C)';
     Time_line1 = Time_line4;
     rNC1 = smNuc41;            % Rel-A data 
     rNC2 = smNuc42;            % c-Rel data
     St_Frame = 9;
 elseif stID ==5
     StimulationName = 'R848';
     Time_line1 = Time_line9;
     rNC1 = smNuc91;            % Rel-A data 
     rNC2 = smNuc92;            % c-Rel data
     St_Frame = 9;
 elseif stID ==6
     StimulationName = 'Pam3CSK';
     Time_line1 = Time_line10;
     rNC1 = smNuc101;            % Rel-A data 
     rNC2 = smNuc102;            % c-Rel data
     St_Frame = 9;
 else
     StimulationName = 'TNF-α';
     Time_line1 = Time_line11;
     rNC1 = smNuc111;            % Rel-A data 
     rNC2 = smNuc112;            % c-Rel data
     St_Frame = 11;
 end 
set(gcf,'Units','inches',...
 'Position',[0 0 14 6])

% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(rNC2(3:St_Frame+1,:),1);
rNC2 = rNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

xvar = {'PeakValue Rel-A','PeakTime Rel-A','AUC Rel-A','AUC(fold change) Rel-A','NumCycle Rel-A','Duration Rel-A','rSlope Rel-A','fSlope Rel-A','Period Rel-A','PeakValue c-Rel','PeakTime c-Rel','AUC c-Rel','AUC(fold change) c-Rel','NumCycle c-Rel','Duration c-Rel','rSlope c-Rel','fSlope c-Rel','Period c-Rel'};

heatmap2(r,xvar,xvar,'Gridlines','-')
colormap (mycolormap)


% Add the significance values in heatmap
for i = 1:size(r,1)
  for j = 1:size(r,2)
       if ~isnan(p(i,j))==1
          if p(i,j)<=0.05 && p(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif p(i,j)<=0.001 && p(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif p(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end

colorbar
caxis ([-.5 1])
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM';
% StimulationName = 'LPS_ultrapure';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'RatioSignal';
ExptDate = '9.27.2021';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-',ExptDate];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close
end
%% Plotting the correlation matrix between the RelA and c-Rel for the Young combining all ligand response
frequency = 7;
St_Frame = 9;

cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mNuc11 = load(R1).T1;
        mNuc12 = load(R1).T2;
        Time_line2 = load(R2).Time_line;
        mNuc21 = load(R2).T1;
        mNuc22 = load(R2).T2;
        Time_line3 = load(R3).Time_line;
        mNuc31 = load(R3).T1;
        mNuc32 = load(R3).T2;
        Time_line4 = load(R4).Time_line;
        mNuc41 = load(R4).T1;
        mNuc42 = load(R4).T2;
        Time_line5 = load(R5).Time_line;
        mNuc51 = load(R5).T1;
        mNuc52 = load(R5).T2;
        Time_line6 = load(R6).Time_line;
        mNuc61 = load(R6).T1;
        mNuc62 = load(R6).T2;
        Time_line7 = load(R7).Time_line;
        mNuc71 = load(R7).T1;
        mNuc72 = load(R7).T2;
        Time_line8 = load(R8).Time_line;
        mNuc81 = load(R8).T1;
        mNuc82 = load(R8).T2;

        smNuc11 = load(sR1).ST1;
        smNuc12 = load(sR1).ST2;
        smNuc21 = load(sR2).ST1;
        smNuc22 = load(sR2).ST2;
        smNuc31 = load(sR3).ST1;
        smNuc32 = load(sR3).ST2;
        smNuc41 = load(sR4).ST1;
        smNuc42 = load(sR4).ST2;
        smNuc51 = load(sR5).ST1;
        smNuc52 = load(sR5).ST2;
        smNuc61 = load(sR6).ST1;
        smNuc62 = load(sR6).ST2;
        smNuc71 = load(sR7).ST1;
        smNuc72 = load(sR7).ST2;
        smNuc81 = load(sR8).ST1;
        smNuc82 = load(sR8).ST2;
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mNuc91 = load(R1).T1;
        mNuc92 = load(R1).T2;
        Time_line10 = load(R2).Time_line;
        mNuc101 = load(R2).T1;
        mNuc102 = load(R2).T2;
        Time_line11 = load(R3).Time_line;
        mNuc111 = load(R3).T1;
        mNuc112 = load(R3).T2;
        Time_line12 = load(R4).Time_line;
        mNuc121 = load(R4).T1;
        mNuc122 = load(R4).T2;
        Time_line13 = load(R5).Time_line;
        mNuc131 = load(R5).T1;
        mNuc132 = load(R5).T2;
        Time_line14 = load(R6).Time_line;
        mNuc141 = load(R6).T1;
        mNuc142 = load(R6).T2;
        Time_line15 = load(R7).Time_line;
        mNuc151 = load(R7).T1;
        mNuc152 = load(R7).T2;
        Time_line16 = load(R8).Time_line;
        mNuc161 = load(R8).T1;
        mNuc162 = load(R8).T2;

        smNuc91 = load(sR1).ST1;
        smNuc92 = load(sR1).ST2;
        smNuc101 = load(sR2).ST1;
        smNuc102 = load(sR2).ST2;
        smNuc111 = load(sR3).ST1;
        smNuc112 = load(sR3).ST2;
        smNuc121 = load(sR4).ST1;
        smNuc122 = load(sR4).ST2;
        smNuc131 = load(sR5).ST1;
        smNuc132 = load(sR5).ST2;
        smNuc141 = load(sR6).ST1;
        smNuc142 = load(sR6).ST2;
        smNuc151 = load(sR7).ST1;
        smNuc152 = load(sR7).ST2;
        smNuc161 = load(sR8).ST1;
        smNuc162 = load(sR8).ST2;
        
clear Time_line rRelA rcRel
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);
Time_line11 (1:2,:)=[];

Time_line = [Time_line12(1:117,:),Time_line2(1:117,:),Time_line3(1:117,:),Time_line4(1:117,:),Time_line9(1:117,:),Time_line10(1:117,:),Time_line11];

smNuc111(3:4,:)=[];
rRelA = [smNuc121(1:119,:),smNuc21(1:119,:),smNuc31(1:119,:),smNuc41(1:119,:),smNuc91(1:119,:),smNuc101(1:119,:),smNuc111];
smNuc112(3:4,:)=[];
rcRel = [smNuc122(1:119,:),smNuc22(1:119,:),smNuc32(1:119,:),smNuc42(1:119,:),smNuc92(1:119,:),smNuc102(1:119,:),smNuc112];


set(gcf,'Units','inches',...
 'Position',[0 0 14 6])

% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line,rRelA(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line,rcRel(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rRelA(3:St_Frame+1,:),1);
rRelA = rRelA./basal;
basal = mean(rcRel(3:St_Frame+1,:),1);
rcRel = rcRel./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line,rRelA(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line,rcRel(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

xvar = {'PeakValue Rel-A','PeakTime Rel-A','AUC Rel-A','AUC(fold change) Rel-A','NumCycle Rel-A','Duration Rel-A','rSlope Rel-A','fSlope Rel-A','Period Rel-A','PeakValue c-Rel','PeakTime c-Rel','AUC c-Rel','AUC(fold change) c-Rel','NumCycle c-Rel','Duration c-Rel','rSlope c-Rel','fSlope c-Rel','Period c-Rel'};

heatmap2(r,xvar,xvar,'Gridlines','-')
colormap (mycolormap)


% Add the significance values in heatmap
for i = 1:size(r,1)
  for j = 1:size(r,2)
       if ~isnan(p(i,j))==1
          if p(i,j)<=0.05 && p(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif p(i,j)<=0.001 && p(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif p(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end

colorbar
caxis ([-.5 1])
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM';
StimulationName = 'All_ligands';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'RatioSignal';
ExptDate = '9.27.2021';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-',ExptDate];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close
%% %% Plotting the correlation matrix between the RelA and c-Rel for the Young (Permutate single cell response) 
clear PeakValue11 PeakTime11 AUC11 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2

frequency = 7;
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);

 for stID = 1:7
 figure (stID+5);
 if stID ==1
     StimulationName = 'LPS Enzo';
     Time_line1 = Time_line12;
     rNC1 = smNuc121;            % Rel-A data 
     rNC2 = smNuc122;            % c-Rel data
     St_Frame = 9;
 elseif stID ==2
     StimulationName = 'Flagellin';
     Time_line1 = Time_line2;
     rNC1 = smNuc21;            % Rel-A data 
     rNC2 = smNuc22;            % c-Rel data
     St_Frame = 9;
 elseif stID==3
     StimulationName = 'CpG';
     Time_line1 = Time_line3;
     rNC1 = smNuc31;            % Rel-A data 
     rNC2 = smNuc32;            % c-Rel data
     St_Frame = 9;
 elseif stID ==4
     StimulationName = 'Poly(I_C)';
     Time_line1 = Time_line4;
     rNC1 = smNuc41;            % Rel-A data 
     rNC2 = smNuc42;            % c-Rel data
     St_Frame = 9;
 elseif stID ==5
     StimulationName = 'R848';
     Time_line1 = Time_line9;
     rNC1 = smNuc91;            % Rel-A data 
     rNC2 = smNuc92;            % c-Rel data
     St_Frame = 9;
 elseif stID ==6
     StimulationName = 'Pam3CSK';
     Time_line1 = Time_line10;
     rNC1 = smNuc101;            % Rel-A data 
     rNC2 = smNuc102;            % c-Rel data
     St_Frame = 9;
 else
     StimulationName = 'TNF-α';
     Time_line1 = Time_line11;
     rNC1 = smNuc111;            % Rel-A data 
     rNC2 = smNuc112;            % c-Rel data
     St_Frame = 11;
 end 
set(gcf,'Units','inches',...
 'Position',[0 0 14 6])

% Randomly shuffle the cRel signal
shuffle = randsample(1:size(rNC2,2),size(rNC2,2)) ;
SrNC2 = rNC2(:,shuffle) ;

% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,SrNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(SrNC2(3:St_Frame+1,:),1);
SrNC2 = SrNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,SrNC2(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

xvar = {'PeakValue Rel-A','PeakTime Rel-A','AUC Rel-A','AUC(fold change) Rel-A','NumCycle Rel-A','Duration Rel-A','rSlope Rel-A','fSlope Rel-A','Period Rel-A','PeakValue c-Rel','PeakTime c-Rel','AUC c-Rel','AUC(fold change) c-Rel','NumCycle c-Rel','Duration c-Rel','rSlope c-Rel','fSlope c-Rel','Period c-Rel'};

heatmap2(r,xvar,xvar,'Gridlines','-')
colormap (mycolormap)


% Add the significance values in heatmap
for i = 1:size(r,1)
  for j = 1:size(r,2)
       if ~isnan(p(i,j))==1
          if p(i,j)<=0.05 && p(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif p(i,j)<=0.001 && p(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif p(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end

colorbar
caxis ([-.5 1])
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM_Shuffle';
% StimulationName = 'LPS_ultrapure';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'RatioSignal';
ExptDate = '9.27.2021';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-',ExptDate];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close

 end
%% Permutation Test 
clear PeakValue11 PeakTime11 AUC11 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2

frequency = 7;
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);

 for stID = 1:7
 figure (stID);
 if stID ==1
     StimulationName = 'LPS Enzo';
     Time_line1 = Time_line12;
     rNC1 = smNuc121;            % Rel-A data 
     rNC2 = smNuc122;            % c-Rel data
     St_Frame = 9;
 elseif stID ==2
     StimulationName = 'Flagellin';
     Time_line1 = Time_line2;
     rNC1 = smNuc21;            % Rel-A data 
     rNC2 = smNuc22;            % c-Rel data
     St_Frame = 9;
 elseif stID==3
     StimulationName = 'CpG';
     Time_line1 = Time_line3;
     rNC1 = smNuc31;            % Rel-A data 
     rNC2 = smNuc32;            % c-Rel data
     St_Frame = 9;
 elseif stID ==4
     StimulationName = 'Poly(I_C)';
     Time_line1 = Time_line4;
     rNC1 = smNuc41;            % Rel-A data 
     rNC2 = smNuc42;            % c-Rel data
     St_Frame = 9;
 elseif stID ==5
     StimulationName = 'R848';
     Time_line1 = Time_line9;
     rNC1 = smNuc91;            % Rel-A data 
     rNC2 = smNuc92;            % c-Rel data
     St_Frame = 9;
 elseif stID ==6
     StimulationName = 'Pam3CSK';
     Time_line1 = Time_line10;
     rNC1 = smNuc101;            % Rel-A data 
     rNC2 = smNuc102;            % c-Rel data
     St_Frame = 9;
 else
     StimulationName = 'TNF-α';
     Time_line1 = Time_line11;
     rNC1 = smNuc111;            % Rel-A data 
     rNC2 = smNuc112;            % c-Rel data
     St_Frame = 11;
 end 


% Calculate the cross correlation before shuffling
% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(rNC2(3:St_Frame+1,:),1);
rNC2 = rNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

% Get the rectangele cross-correlation matrix
cr = r (10:end,1:9);
cp = p (10:end,1:9);



for si = 1:100
% Randomly shuffle the cRel signal
shuffle = randsample(1:size(rNC2,2),size(rNC2,2)) ;
SrNC2 = rNC2(:,shuffle) ;

% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,SrNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(SrNC2(3:St_Frame+1,:),1);
SrNC2 = SrNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,SrNC2(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

% Get the rectangele cross-correlation matrix
ccr(:,:,si) = r (10:end,1:9);
ccp (:,:,si) = p (10:end,1:9);

end

% Calculate the p-value based on Mia's suggestion
for si = 1:1000
    pp (:,:,si)= double(abs(ccr(:,:,si))> abs (cr));
end
pvalue = sum(pp,3)/100;
%
set(gcf,'Units','inches',...
 'Position',[0 0 14 10])
hAxis(1) =subplot (2,1,1);
xvar = {'PeakValue c-Rel','PeakTime c-Rel','AUC c-Rel','AUC(fold change) c-Rel','Number of cycle c-Rel','Duration c-Rel','1^s^t rising slope c-Rel','Attenuation rate c-Rel','Period of oscillation c-Rel'};
yvar = {'PeakValue Rel-A','PeakTime Rel-A','AUC Rel-A','AUC(fold change) Rel-A','Number of cycle Rel-A','Duration Rel-A','1^s^t rising slope Rel-A','Attenuation rate Rel-A','Period of oscillation Rel-A'};
heatmap2(cr,[],yvar,'GridLines', '-');
caxis ([-0.25,0.75])
colormap (mycolormap)
colorbar


title ('Before Shuffle');
% Add the significance values in heatmap
for i = 1:size(cr,1)
  for j = 1:size(cr,2)
       if ~isnan(cp(i,j))==1
          if cp(i,j)<=0.05 && cp(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif cp(i,j)<=0.001 && cp(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif cp(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end

hAxis(2) = subplot (2,1,2);
heatmap2(mean(ccr,3),xvar,yvar,...
    'Colormap', 'mycolormap', 'Colorbar', true, 'GridLines', '-',...
    'MinColorValue',-0.25,'MaxColorValue',0.75)
colormap (mycolormap)
caxis ([-0.25,0.75])
colorbar

title ('After Shuffle');
% Add the significance values in heatmap
for i = 1:size(ccr,1)
  for j = 1:size(ccr,2)
       if ~isnan(pvalue(i,j))==1
          if pvalue(i,j)<=0.05 && pvalue(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif pvalue(i,j)<=0.001 && pvalue(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif pvalue(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end
NarrowSubplot (2,1,hAxis,0.05,0.2,0.135,0.115,0.05,0.04);
      
%
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM_Shuffle';
% StimulationName = 'LPS_ultrapure';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'RatioSignal';
ExptDate = '9.27.2021';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-','100 shuffle',ExptDate];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close

 end 
 %% Permulation test and mark the cell that pass the significant p-values
clear PeakValue1 PeakTime1 AUC11 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2
clear PeakValue11 PeakTime11 AUC11 NOC11 Act_Duration11 rSlope11 fSlope11 OsPrd11
clear PeakValue22 PeakTime22 AUC22 NOC22 Act_Duration22 rSlope22 fSlope22 OsPrd22
clear r p cr cp ccr ccp pvalue pp
frequency = 7;
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);

%--------------------------------------------------------------------------
for stID = 1:7
 figure (stID);
 if stID ==1
     StimulationName = 'LPS Enzo';
     Time_line1 = Time_line12;
     rNC1 = smNuc121;            % Rel-A data 
     rNC2 = smNuc122;            % c-Rel data
     St_Frame = 9;
 elseif stID ==2
     StimulationName = 'Flagellin';
     Time_line1 = Time_line2;
     rNC1 = smNuc21;            % Rel-A data 
     rNC2 = smNuc22;            % c-Rel data
     St_Frame = 9;
 elseif stID==3
     StimulationName = 'CpG';
     Time_line1 = Time_line3;
     rNC1 = smNuc31;            % Rel-A data 
     rNC2 = smNuc32;            % c-Rel data
     St_Frame = 9;
 elseif stID ==4
     StimulationName = 'Poly(I_C)';
     Time_line1 = Time_line4;
     rNC1 = smNuc41;            % Rel-A data 
     rNC2 = smNuc42;            % c-Rel data
     St_Frame = 9;
 elseif stID ==5
     StimulationName = 'R848';
     Time_line1 = Time_line9;
     rNC1 = smNuc91;            % Rel-A data 
     rNC2 = smNuc92;            % c-Rel data
     St_Frame = 9;
 elseif stID ==6
     StimulationName = 'Pam3CSK';
     Time_line1 = Time_line10;
     rNC1 = smNuc101;            % Rel-A data 
     rNC2 = smNuc102;            % c-Rel data
     St_Frame = 9;
 else
     StimulationName = 'TNF-α';
     Time_line1 = Time_line11;
     rNC1 = smNuc111;            % Rel-A data 
     rNC2 = smNuc112;            % c-Rel data
     St_Frame = 11;
 end
    
% Calculate the cross correlation before shuffling
% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(rNC2(3:St_Frame+1,:),1);
rNC2 = rNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue22,PeakTime22,AUC22,NOC22,Act_Duration22,rSlope22,fSlope22,OsPrd22] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);
 
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];
 
% Calculate the correlation matrix and p-value
[r, p]= corrcoef (dataMatrix,'Rows','complete');
% Make the lower triangle matrix
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;
 
% Get the rectangele cross-correlation matrix
cr = r (10:end,1:9);
cp = p (10:end,1:9);
 
 
 
for si = 1:100
% Randomly shuffle the cRel signal
shuffle = randsample(1:size(rNC2,2),size(rNC2,2)) ;
SrNC2 = rNC2(:,shuffle) ;
 
% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,SrNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(SrNC2(3:St_Frame+1,:),1);
SrNC2 = SrNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue22,PeakTime22,AUC22,NOC22,Act_Duration22,rSlope22,fSlope22,OsPrd22] = Extract8Variable (Time_line1,SrNC2(3:end,:),St_Frame,frequency);
 
%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];
 
[sr, sp]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(sr));
idx = tril(ii);
sr(~idx) = NaN;
sp(~idx) = NaN;
 
% Get the rectangele cross-correlation matrix
ccr(:,:,si) = sr ;%(10:end,1:9);
ccp (:,:,si) = sp ;%(10:end,1:9);
 
end
 
% Calculate the p-value based on Mia's suggestion
for si = 1:100
    pp (:,:,si)= double(abs(ccr(:,:,si))> abs (r));
end
pvalue = sum(pp,3)/100;
 
 
% Plot the original correlation matrix heatmap
% Set the figure
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
yvar = {'Amplitude Rel-A','Time to peak Rel-A','AUC Rel-A','AUC(fold change) Rel-A','Number of cycle Rel-A','Duration Rel-A','Slope of 1^s^t rise Rel-A','Attenuation rate Rel-A','Period Rel-A','Amplitude c-Rel','Time to peak c-Rel','AUC c-Rel','AUC(fold change) c-Rel','Number of cycle c-Rel','Duration c-Rel','Slope of 1^s^t ris c-Rel','Attenuation rate c-Rel','Period c-Rel'};
xvar = {'Amplitude Rel-A','Time to peak Rel-A','AUC Rel-A','AUC(fold change) Rel-A','Number of cycle Rel-A','Duration Rel-A','Slope of 1^s^t rise Rel-A','Attenuation rate Rel-A','Period Rel-A','Amplitude c-Rel','Time to peak c-Rel','AUC c-Rel','AUC(fold change) c-Rel','Number of cycle c-Rel','Duration c-Rel','Slope of 1^s^t ris c-Rel','Attenuation rate c-Rel','Period c-Rel'};
% heatmap1(cr,[],yvar, 'GridLines', '-');
heatmap2((r),xvar,yvar,...
    'Colormap', mycolormap, 'Colorbar', true, 'GridLines', '-',...
    'MinColorValue',-0.5,'MaxColorValue',1.0)
caxis ([-0.5 1])
colormap (mycolormap)
colorbar
% Add the significance values in heatmap
for i = 1:size(r,1)
  for j = 1:size(r,2)
       if ~isnan(p(i,j))==1
          if p(i,j)<=0.05 && p(i,j)>=0.01 
              text(j,i-.25,'*');
          elseif p(i,j)<=0.01 && p(i,j)>=0.001
               text(j-.01,i-.25,'**');
          elseif p(i,j)<=0.001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end
 
 
% mark the edge of cell having significant p-value
[row,col] = find ((pvalue(10:end,1:9))<0.001);
row = row +9;
for k =1:length(row)
    rectangle('Position',[(col(k)-.5), (row(k)-.5), 1, 1],'LineWidth',2,'EdgeColor',[0 1 1])
end
    
      
%
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM_Shuffle';
% StimulationName = 'LPS_ultrapure';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'ratio';
% ExptDate = '08.02.2022';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-','100 shuffle_pvalue'];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close
 
clear PeakValue1 PeakTime1 AUC1 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2
clear PeakValue11 PeakTime11 AUC11 NOC11 Act_Duration11 rSlope11 fSlope11 OsPrd11
clear PeakValue22 PeakTime22 AUC22 NOC22 Act_Duration22 rSlope22 fSlope22 OsPrd22
clear rNC1 rNC2 Time_line dataMatrix
clear r p cr cp ccr ccp pvalue pp row col
end



 %% Difference correlation matrix 
 clear PeakValue11 PeakTime11 AUC11 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2

frequency = 7;
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);

 for stID = 1:7
 figure (stID+5);
 if stID ==1
     StimulationName = 'LPS Enzo';
     Time_line1 = Time_line12;
     rNC1 = smNuc121;            % Rel-A data 
     rNC2 = smNuc122;            % c-Rel data
     St_Frame = 9;
 elseif stID ==2
     StimulationName = 'Flagellin';
     Time_line1 = Time_line2;
     rNC1 = smNuc21;            % Rel-A data 
     rNC2 = smNuc22;            % c-Rel data
     St_Frame = 9;
 elseif stID==3
     StimulationName = 'CpG';
     Time_line1 = Time_line3;
     rNC1 = smNuc31;            % Rel-A data 
     rNC2 = smNuc32;            % c-Rel data
     St_Frame = 9;
 elseif stID ==4
     StimulationName = 'Poly(I_C)';
     Time_line1 = Time_line4;
     rNC1 = smNuc41;            % Rel-A data 
     rNC2 = smNuc42;            % c-Rel data
     St_Frame = 9;
 elseif stID ==5
     StimulationName = 'R848';
     Time_line1 = Time_line9;
     rNC1 = smNuc91;            % Rel-A data 
     rNC2 = smNuc92;            % c-Rel data
     St_Frame = 9;
 elseif stID ==6
     StimulationName = 'Pam3CSK';
     Time_line1 = Time_line10;
     rNC1 = smNuc101;            % Rel-A data 
     rNC2 = smNuc102;            % c-Rel data
     St_Frame = 9;
 else
     StimulationName = 'TNF-α';
     Time_line1 = Time_line11;
     rNC1 = smNuc111;            % Rel-A data 
     rNC2 = smNuc112;            % c-Rel data
     St_Frame = 11;
 end 
set(gcf,'Units','inches',...
 'Position',[0 0 14 6])


% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(rNC2(3:St_Frame+1,:),1);
rNC2 = rNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

% All lignad correlation cofficient calculation
%--------------------------------------------------------------------------
frequency = 7;
St_Frame = 9;

cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mNuc11 = load(R1).T1;
        mNuc12 = load(R1).T2;
        Time_line2 = load(R2).Time_line;
        mNuc21 = load(R2).T1;
        mNuc22 = load(R2).T2;
        Time_line3 = load(R3).Time_line;
        mNuc31 = load(R3).T1;
        mNuc32 = load(R3).T2;
        Time_line4 = load(R4).Time_line;
        mNuc41 = load(R4).T1;
        mNuc42 = load(R4).T2;
        Time_line5 = load(R5).Time_line;
        mNuc51 = load(R5).T1;
        mNuc52 = load(R5).T2;
        Time_line6 = load(R6).Time_line;
        mNuc61 = load(R6).T1;
        mNuc62 = load(R6).T2;
        Time_line7 = load(R7).Time_line;
        mNuc71 = load(R7).T1;
        mNuc72 = load(R7).T2;
        Time_line8 = load(R8).Time_line;
        mNuc81 = load(R8).T1;
        mNuc82 = load(R8).T2;

        smNuc11 = load(sR1).ST1;
        smNuc12 = load(sR1).ST2;
        smNuc21 = load(sR2).ST1;
        smNuc22 = load(sR2).ST2;
        smNuc31 = load(sR3).ST1;
        smNuc32 = load(sR3).ST2;
        smNuc41 = load(sR4).ST1;
        smNuc42 = load(sR4).ST2;
        smNuc51 = load(sR5).ST1;
        smNuc52 = load(sR5).ST2;
        smNuc61 = load(sR6).ST1;
        smNuc62 = load(sR6).ST2;
        smNuc71 = load(sR7).ST1;
        smNuc72 = load(sR7).ST2;
        smNuc81 = load(sR8).ST1;
        smNuc82 = load(sR8).ST2;
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mNuc91 = load(R1).T1;
        mNuc92 = load(R1).T2;
        Time_line10 = load(R2).Time_line;
        mNuc101 = load(R2).T1;
        mNuc102 = load(R2).T2;
        Time_line11 = load(R3).Time_line;
        mNuc111 = load(R3).T1;
        mNuc112 = load(R3).T2;
        Time_line12 = load(R4).Time_line;
        mNuc121 = load(R4).T1;
        mNuc122 = load(R4).T2;
        Time_line13 = load(R5).Time_line;
        mNuc131 = load(R5).T1;
        mNuc132 = load(R5).T2;
        Time_line14 = load(R6).Time_line;
        mNuc141 = load(R6).T1;
        mNuc142 = load(R6).T2;
        Time_line15 = load(R7).Time_line;
        mNuc151 = load(R7).T1;
        mNuc152 = load(R7).T2;
        Time_line16 = load(R8).Time_line;
        mNuc161 = load(R8).T1;
        mNuc162 = load(R8).T2;

        smNuc91 = load(sR1).ST1;
        smNuc92 = load(sR1).ST2;
        smNuc101 = load(sR2).ST1;
        smNuc102 = load(sR2).ST2;
        smNuc111 = load(sR3).ST1;
        smNuc112 = load(sR3).ST2;
        smNuc121 = load(sR4).ST1;
        smNuc122 = load(sR4).ST2;
        smNuc131 = load(sR5).ST1;
        smNuc132 = load(sR5).ST2;
        smNuc141 = load(sR6).ST1;
        smNuc142 = load(sR6).ST2;
        smNuc151 = load(sR7).ST1;
        smNuc152 = load(sR7).ST2;
        smNuc161 = load(sR8).ST1;
        smNuc162 = load(sR8).ST2;
        
clear Time_line rRelA rcRel
clear PeakValue1 PeakTime1 AUC1 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);
Time_line11 (1:2,:)=[];

Time_line = [Time_line12(1:117,:),Time_line2(1:117,:),Time_line3(1:117,:),Time_line4(1:117,:),Time_line9(1:117,:),Time_line10(1:117,:),Time_line11];

smNuc111(3:4,:)=[];
rRelA = [smNuc121(1:119,:),smNuc21(1:119,:),smNuc31(1:119,:),smNuc41(1:119,:),smNuc91(1:119,:),smNuc101(1:119,:),smNuc111];
smNuc112(3:4,:)=[];
rcRel = [smNuc122(1:119,:),smNuc22(1:119,:),smNuc32(1:119,:),smNuc42(1:119,:),smNuc92(1:119,:),smNuc102(1:119,:),smNuc112];


% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line,rRelA(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line,rcRel(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rRelA(3:St_Frame+1,:),1);
rRelA = rRelA./basal;
basal = mean(rcRel(3:St_Frame+1,:),1);
rcRel = rcRel./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line,rRelA(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line,rcRel(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r1, p1]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r1));
idx = tril(ii);
r1(~idx) = NaN;
p1(~idx) = NaN;
%--------------------------------------------------------------------------

xvar = {'PeakValue Rel-A','PeakTime Rel-A','AUC Rel-A','AUC(fold change) Rel-A','Number of cycle Rel-A','Duration Rel-A','1^s^t rising slope Rel-A','Attenuation rate Rel-A','Period of oscillation Rel-A','PeakValue c-Rel','PeakTime c-Rel','AUC c-Rel','AUC(fold change) c-Rel','NumCycle c-Rel','Duration c-Rel','rSlope c-Rel','fSlope c-Rel','Period c-Rel'};

heatmap2(abs(r-r1),xvar,xvar,'Gridlines','-')
colormap (mycolormap)


% Add the significance values in heatmap
for i = 1:size(r,1)
  for j = 1:size(r,2)
       if ~isnan(p(i,j))==1
          if p(i,j)<=0.05 && p(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif p(i,j)<=0.001 && p(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif p(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end

colorbar
caxis ([0 0.5])
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM_Differnce';
% StimulationName = 'LPS_ultrapure';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'RatioSignal';
ExptDate = '9.27.2021';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-',ExptDate];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close

 end
 
 
 %% Tagging  Ligand specific pair
 clear PeakValue11 PeakTime11 AUC11 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2

frequency = 7;
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);

 for stID = 1:7
 figure (stID+5);
 if stID ==1
     StimulationName = 'LPS Enzo';
     Time_line1 = Time_line12;
     rNC1 = smNuc121;            % Rel-A data 
     rNC2 = smNuc122;            % c-Rel data
     St_Frame = 9;
 elseif stID ==2
     StimulationName = 'Flagellin';
     Time_line1 = Time_line2;
     rNC1 = smNuc21;            % Rel-A data 
     rNC2 = smNuc22;            % c-Rel data
     St_Frame = 9;
 elseif stID==3
     StimulationName = 'CpG';
     Time_line1 = Time_line3;
     rNC1 = smNuc31;            % Rel-A data 
     rNC2 = smNuc32;            % c-Rel data
     St_Frame = 9;
 elseif stID ==4
     StimulationName = 'Poly(I_C)';
     Time_line1 = Time_line4;
     rNC1 = smNuc41;            % Rel-A data 
     rNC2 = smNuc42;            % c-Rel data
     St_Frame = 9;
 elseif stID ==5
     StimulationName = 'R848';
     Time_line1 = Time_line9;
     rNC1 = smNuc91;            % Rel-A data 
     rNC2 = smNuc92;            % c-Rel data
     St_Frame = 9;
 elseif stID ==6
     StimulationName = 'Pam3CSK';
     Time_line1 = Time_line10;
     rNC1 = smNuc101;            % Rel-A data 
     rNC2 = smNuc102;            % c-Rel data
     St_Frame = 9;
 else
     StimulationName = 'TNF-α';
     Time_line1 = Time_line11;
     rNC1 = smNuc111;            % Rel-A data 
     rNC2 = smNuc112;            % c-Rel data
     St_Frame = 11;
 end 
set(gcf,'Units','inches',...
 'Position',[0 0 14 6])


% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rNC1(3:St_Frame+1,:),1);
rNC1 = rNC1./basal;
basal = mean(rNC2(3:St_Frame+1,:),1);
rNC2 = rNC2./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line1,rNC1(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line1,rNC2(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r, p]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r));
idx = tril(ii);
r(~idx) = NaN;
p(~idx) = NaN;

% All lignad correlation cofficient calculation
%--------------------------------------------------------------------------
frequency = 7;
St_Frame = 9;

cd (d1);
        % raw data of first expt
        Time_line1 = load(R1).Time_line;
        mNuc11 = load(R1).T1;
        mNuc12 = load(R1).T2;
        Time_line2 = load(R2).Time_line;
        mNuc21 = load(R2).T1;
        mNuc22 = load(R2).T2;
        Time_line3 = load(R3).Time_line;
        mNuc31 = load(R3).T1;
        mNuc32 = load(R3).T2;
        Time_line4 = load(R4).Time_line;
        mNuc41 = load(R4).T1;
        mNuc42 = load(R4).T2;
        Time_line5 = load(R5).Time_line;
        mNuc51 = load(R5).T1;
        mNuc52 = load(R5).T2;
        Time_line6 = load(R6).Time_line;
        mNuc61 = load(R6).T1;
        mNuc62 = load(R6).T2;
        Time_line7 = load(R7).Time_line;
        mNuc71 = load(R7).T1;
        mNuc72 = load(R7).T2;
        Time_line8 = load(R8).Time_line;
        mNuc81 = load(R8).T1;
        mNuc82 = load(R8).T2;

        smNuc11 = load(sR1).ST1;
        smNuc12 = load(sR1).ST2;
        smNuc21 = load(sR2).ST1;
        smNuc22 = load(sR2).ST2;
        smNuc31 = load(sR3).ST1;
        smNuc32 = load(sR3).ST2;
        smNuc41 = load(sR4).ST1;
        smNuc42 = load(sR4).ST2;
        smNuc51 = load(sR5).ST1;
        smNuc52 = load(sR5).ST2;
        smNuc61 = load(sR6).ST1;
        smNuc62 = load(sR6).ST2;
        smNuc71 = load(sR7).ST1;
        smNuc72 = load(sR7).ST2;
        smNuc81 = load(sR8).ST1;
        smNuc82 = load(sR8).ST2;
        
        cd (d2);
        % raw data of second expt
        Time_line9 = load(R1).Time_line;
        mNuc91 = load(R1).T1;
        mNuc92 = load(R1).T2;
        Time_line10 = load(R2).Time_line;
        mNuc101 = load(R2).T1;
        mNuc102 = load(R2).T2;
        Time_line11 = load(R3).Time_line;
        mNuc111 = load(R3).T1;
        mNuc112 = load(R3).T2;
        Time_line12 = load(R4).Time_line;
        mNuc121 = load(R4).T1;
        mNuc122 = load(R4).T2;
        Time_line13 = load(R5).Time_line;
        mNuc131 = load(R5).T1;
        mNuc132 = load(R5).T2;
        Time_line14 = load(R6).Time_line;
        mNuc141 = load(R6).T1;
        mNuc142 = load(R6).T2;
        Time_line15 = load(R7).Time_line;
        mNuc151 = load(R7).T1;
        mNuc152 = load(R7).T2;
        Time_line16 = load(R8).Time_line;
        mNuc161 = load(R8).T1;
        mNuc162 = load(R8).T2;

        smNuc91 = load(sR1).ST1;
        smNuc92 = load(sR1).ST2;
        smNuc101 = load(sR2).ST1;
        smNuc102 = load(sR2).ST2;
        smNuc111 = load(sR3).ST1;
        smNuc112 = load(sR3).ST2;
        smNuc121 = load(sR4).ST1;
        smNuc122 = load(sR4).ST2;
        smNuc131 = load(sR5).ST1;
        smNuc132 = load(sR5).ST2;
        smNuc141 = load(sR6).ST1;
        smNuc142 = load(sR6).ST2;
        smNuc151 = load(sR7).ST1;
        smNuc152 = load(sR7).ST2;
        smNuc161 = load(sR8).ST1;
        smNuc162 = load(sR8).ST2;
        
clear Time_line rRelA rcRel
clear PeakValue1 PeakTime1 AUC1 NOC1 Act_Duration1 rSlope1 fSlope1 OsPrd1
clear PeakValue2 PeakTime2 AUC2 NOC2 Act_Duration2 rSlope2 fSlope2 OsPrd2
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
       mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
%          mycolormap = 'jet';
%      %      colorbar('southoutside');
%      colormap(mycolormap);
Time_line11 (1:2,:)=[];

Time_line = [Time_line12(1:117,:),Time_line2(1:117,:),Time_line3(1:117,:),Time_line4(1:117,:),Time_line9(1:117,:),Time_line10(1:117,:),Time_line11];

smNuc111(3:4,:)=[];
rRelA = [smNuc121(1:119,:),smNuc21(1:119,:),smNuc31(1:119,:),smNuc41(1:119,:),smNuc91(1:119,:),smNuc101(1:119,:),smNuc111];
smNuc112(3:4,:)=[];
rcRel = [smNuc122(1:119,:),smNuc22(1:119,:),smNuc32(1:119,:),smNuc42(1:119,:),smNuc92(1:119,:),smNuc102(1:119,:),smNuc112];


% Use the Quantification of 8 parameters
[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line,rRelA(3:end,:),St_Frame,frequency);
[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line,rcRel(3:end,:),St_Frame,frequency);
% Get the AUC (fold change) Duration, number of cycle, and  Active Duration
% from Extract6Variable function using fold change data
basal = mean(rRelA(3:St_Frame+1,:),1);
rRelA = rRelA./basal;
basal = mean(rcRel(3:St_Frame+1,:),1);
rcRel = rcRel./basal;
% Use the Quantification of 6 parameters
[PeakValue11,PeakTime11,AUC11,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line,rRelA(3:end,:),St_Frame,frequency);
[PeakValue21,PeakTime21,AUC22,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line,rcRel(3:end,:),St_Frame,frequency);

%out = A(:,all(~isnan(A)));   % for nan - columns
dataMatrix = [PeakValue1',PeakTime1',AUC1',AUC11',NOC1',Act_Duration1',rSlope1',fSlope1',OsPrd1',PeakValue2',PeakTime2',AUC2',AUC22',NOC2',Act_Duration2',rSlope2',fSlope2',OsPrd2'];

[r1, p1]= corrcoef (dataMatrix,'Rows','complete');
ii = ones(size(r1));
idx = tril(ii);
r1(~idx) = NaN;
p1(~idx) = NaN;
%--------------------------------------------------------------------------

xvar = {'PeakValue Rel-A','PeakTime Rel-A','AUC Rel-A','AUC(fold change) Rel-A','NumCycle Rel-A','Duration Rel-A','rSlope Rel-A','fSlope Rel-A','Period Rel-A','PeakValue c-Rel','PeakTime c-Rel','AUC c-Rel','AUC(fold change) c-Rel','NumCycle c-Rel','Duration c-Rel','rSlope c-Rel','fSlope c-Rel','Period c-Rel'};

heatmap2(r,xvar,xvar,'Gridlines','-')
colormap (mycolormap)

% [row,col] = find ((abs(r-r1)>0.2) & r>0.4);
[row,col] = find ((abs(r-r1)>0.45));
for k =1:length(row)
    rectangle('Position',[(col(k)-.5), (row(k)-.5), 1, 1],'LineWidth',2,'EdgeColor',[0 1 0])
end


% Add the significance values in heatmap
for i = 1:size(r,1)
  for j = 1:size(r,2)
       if ~isnan(p(i,j))==1
          if p(i,j)<=0.05 && p(i,j)>=0.001 
              text(j,i-.25,'*');
          elseif p(i,j)<=0.001 && p(i,j)>=0.0001
               text(j-.01,i-.25,'**');
          elseif p(i,j)<=0.0001
               text(j-.05,i-.25,'***');
          else
                text(j-.01,i-.25,'');
          end
       end
  end
end

colorbar
caxis ([-0.5 1])
% Save figure in the output directory
cd (outputFolder);
CellName = 'PrimaryBMDM_Ligand_Specific_0.45_diff_';
% StimulationName = 'LPS_ultrapure';
PlotName = 'Rel-A_c-Rel_CorrelationMatrix';
SignalName = 'RatioSignal';
ExptDate = '9.27.2021';
FigName = [CellName,'-',StimulationName,'-',PlotName,'-',SignalName,'-',ExptDate];
exportgraphics(gcf,[FigName,'.pdf'],'ContentType','vector'); % Saving as PDF file
exportgraphics(gcf,[FigName,'.tif'],'Resolution',300);  % Saving as .tif file 
close

 end
 
 
 
 
 %% Resource Paper figure
  %% Plotting the heatmap of smoothed data
     fig3 = figure(3); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha 
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
%        mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
         mycolormap = 'jet';
%      %      colorbar('southoutside');
      colormap(mycolormap);
%      axis off;

[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line12,smNuc121(3:end,:),9,7);

[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line11,smNuc111(3:end,:),11,7);

[~,Indx1] = sort (AUC1);
smNuc121 = smNuc121(:,Indx1);
smNuc122 = smNuc122(:,Indx1);

[~,Indx2] = sort (NOC2);
smNuc111 = smNuc111(:,Indx2);
smNuc112 = smNuc112(:,Indx2);


mincolor=0;
maxcolor=2;
%--------------------------------------------------------------------------
    hAxis(1)= subplot(2,2,1);  
    heatmap1((smNuc121(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title('mEGFP RelA','FontSize',14,'FontWeight','normal')
    
    xtic = [10 27 44 61 78 95 112 129 147];
    xticks(xtic);
    xticklabels({[]});
    
    %----------------------------------------------------------------------  
    hAxis(2) = subplot(2,2,2); 
    heatmap1((smNuc122(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title ('mScarlet c-Rel','FontSize',14,'FontWeight','normal');
    colorbar(hAxis(2),'Position',...
    [0.88 0.515 0.015 0.385]);
    
    xtic = [10 27 44 61 78 95 112 129 147];
    xticks(xtic);
    xticklabels({[]});
    % ---------------------------------------------------------------------
    hAxis(3)= subplot(2,2,3);  
    heatmap1((smNuc111(3:119,:))',round(((1:size(smNuc111,1)-9).*7)./60,1),[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);
    
    xtic = [11 27 44 61 78 95 112 129 147];

    xticks(xtic);
    xticklabels({[]});
    %----------------------------------------------------------------------

    hAxis(4) = subplot(2,2,4); 
    heatmap1((smNuc112(3:119,:))',round(((1:size(smNuc112,1)-9).*7)./60,1),[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);


    colorbar(hAxis(4),'Position',...
    [0.88 0.10 0.015 0.385]);

    xtic = [11 27 44 61 78 95 112 129 147];

    xticks(xtic);
    xticklabels({[]});

    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (2,2,hAxis,0.1,0.1,0.125,0.135,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig3,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    
    iA = 1;
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Nuclear Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    if iA==2
        xtxt=1.091;
    else
        xtxt=1.091;
    end
    % Add the condition information
    h=text(xtxt,0.62,'LPS Enzo','FontSize',14);
    set(h,'Rotation',90);

    h=text(xtxt,0.21,'TNF\alpha','FontSize',14);
    set(h,'Rotation',90);
    

    % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Heatmap_BMDM_LPS_enzo_TNF_Young','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Heatmap_BMDM_LPS_enzo_TNF_Young','.tif'],'Resolution',300);  % Saving as .tif file
    close 
 %%
   %% Plotting the heatmap of smoothed data TNF data clustered using kmedoids
     fig3 = figure(3); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha 
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
%        mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
         mycolormap = 'jet';
%      %      colorbar('southoutside');
      colormap(mycolormap);
%      axis off;

[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line12,smNuc122(3:end,:),9,7);

[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line11,smNuc112(3:end,:),11,7);

% idx1 = kmedoids((smNuc121(3:119,:))',4);
[~,Indx1] = sort (AUC1);
smNuc121 = smNuc121(:,Indx1);
smNuc122 = smNuc122(:,Indx1);

% idx2 = kmedoids((smNuc111(3:119,:))',4);
[~,Indx2] = sort (AUC2);
smNuc111 = smNuc111(:,Indx2);
smNuc112 = smNuc112(:,Indx2);


mincolor=0;
maxcolor=2;
%--------------------------------------------------------------------------
    hAxis(1)= subplot(2,2,1);  
    heatmap1((smNuc121(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title('mEGFP RelA','FontSize',14,'FontWeight','normal')
    
    xtic = [10 27 44 61 78 95 112 129 147];
    xticks(xtic);
    xticklabels({[]});
    
    %----------------------------------------------------------------------  
    hAxis(2) = subplot(2,2,2); 
    heatmap1((smNuc122(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title ('mScarlet c-Rel','FontSize',14,'FontWeight','normal');
    colorbar(hAxis(2),'Position',...
    [0.88 0.515 0.015 0.385]);
    
    xtic = [10 27 44 61 78 95 112 129 147];
    xticks(xtic);
    xticklabels({[]});
    % ---------------------------------------------------------------------
    
    
    hAxis(3)= subplot(2,2,3);  
    heatmap1((smNuc111(3:119,:))',round(((1:size(smNuc111,1)-9).*7)./60,1),[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);
    
    xtic = [11 27 44 61 78 95 112 129 147];

    xticks(xtic);
    xticklabels({[]});
    %----------------------------------------------------------------------

    hAxis(4) = subplot(2,2,4); 
    heatmap1((smNuc112(3:119,:))',round(((1:size(smNuc112,1)-9).*7)./60,1),[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);


    colorbar(hAxis(4),'Position',...
    [0.88 0.10 0.015 0.385]);

    xtic = [11 27 44 61 78 95 112 129 147];

    xticks(xtic);
    xticklabels({[]});

    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (2,2,hAxis,0.1,0.1,0.125,0.135,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig3,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    
    iA = 1;
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Nuclear Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    if iA==2
        xtxt=1.091;
    else
        xtxt=1.091;
    end
    % Add the condition information
    h=text(xtxt,0.62,'LPS Enzo','FontSize',14);
    set(h,'Rotation',90);

    h=text(xtxt,0.21,'TNF\alpha','FontSize',14);
    set(h,'Rotation',90);
    

    % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Heatmap_BMDM_LPS_enzo_TNF_Young_kmedoids','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Heatmap_BMDM_LPS_enzo_TNF_Young_kmedoids','.tif'],'Resolution',300);  % Saving as .tif file
    close
    
    %% Clustering using the c-Rel AUC
       %% Plotting the heatmap of smoothed data TNF data clustered using kmedoids
     fig3 = figure(3); % Figure 1 --> Raw data of RelA and cRel due to TNF alpha 
%       mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});
%        mycolormap = customcolormap([0 0.5 1], [1 0 0; 1 1 1; 0 0 1]);
         mycolormap = 'jet';
%      %      colorbar('southoutside');
      colormap(mycolormap);
%      axis off;

[PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line12,smNuc122(3:end,:),9,7);

[PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line11,smNuc112(3:end,:),11,7);

% idx1 = kmedoids((smNuc121(3:119,:))',4);
[~,Indx1] = sort (AUC1);
smNuc121 = smNuc121(:,Indx1);
smNuc122 = smNuc122(:,Indx1);

% idx2 = kmedoids((smNuc111(3:119,:))',4);
[~,Indx2] = sort (AUC2);
smNuc111 = smNuc111(:,Indx2);
smNuc112 = smNuc112(:,Indx2);


mincolor=0;
maxcolor=2;
%--------------------------------------------------------------------------
    hAxis(1)= subplot(2,2,1);  
    heatmap1((smNuc121(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title('mEGFP RelA','FontSize',14,'FontWeight','normal')
    timetic = [0 120 240 360 480 600 720 840];
     for j = 1:length(timetic)
        [~,xtic(j)] = min(abs(Time_line12(:,1)-timetic(j)));
    end

    xticks(xtic);
%     xticklabels({'0','2','4','6','8','10','12','14'});
    
    %----------------------------------------------------------------------  
    hAxis(2) = subplot(2,2,2); 
    heatmap1((smNuc122(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    title ('mScarlet c-Rel','FontSize',14,'FontWeight','normal');
    colorbar(hAxis(2),'Position',...
    [0.88 0.515 0.015 0.385]);
    
      timetic = [0 120 240 360 480 600 720 840];
    for j = 1:length(timetic)
        [~,xtic(j)] = min(abs(Time_line12(:,1)-timetic(j)));
    end

    xticks(xtic);
%     xticklabels({'0','2','4','6','8','10','12','14'});
    % ---------------------------------------------------------------------
    
    
    hAxis(3)= subplot(2,2,3);  
    heatmap1((smNuc111(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);
    
    timetic = [0 120 240 360 480 600 720 840];
    for j = 1:length(timetic)
        [~,xtic(j)] = min(abs(Time_line11(:,1)-timetic(j)));
    end

    xticks(xtic);
    xticklabels({'0','2','4','6','8','10','12','14'});
    %----------------------------------------------------------------------

    hAxis(4) = subplot(2,2,4); 
    heatmap1((smNuc112(3:119,:))',[],[],[],...
    'ColorMap',mycolormap,'MinColorValue', mincolor, 'MaxColorValue', maxcolor);
    % Set the figure size
    set(gcf,'Units','inches',...
     'Position',[0 0 6 6])
    set (gca,'FontSize',6);


    colorbar(hAxis(4),'Position',...
    [0.88 0.10 0.015 0.385]);

     timetic = [0 120 240 360 480 600 720 840];
    for j = 1:length(timetic)
        [~,xtic(j)] = min(abs(Time_line11(:,1)-timetic(j)));
    end

    xticks(xtic);
    xticklabels({'0','2','4','6','8','10','12','14'});

    % ------------------------- Decorate the plot--------------------------
    %%%%%%%%%%%%%% Aligning the subplots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function [p] = NarrowSubplot(R,C,PlotName,TopSpace,BottomSpace,LeftSpace,RightSpace,Vspace,Hspace)
    % Default optional arguments
    % TopSpace = 0.1;
    % BottomSpace = 0.1;
    % LeftSpace = 0.1
    % RightSpace = 0.1;
    % Vspace = 0.02;
    % Hspace = 0.08;
    NarrowSubplot (2,2,hAxis,0.1,0.1,0.125,0.135,0.03,0.03);
    % Put common x-y axis label
    % Give common xlabel, ylabel and title to your figure
    han=axes(fig3,'visible','off'); 
    han.Title.Visible='on';
    han.XLabel.Visible='on';
    han.YLabel.Visible='on';
    
    iA = 1;
    % add ylabel to the figure
    if iA==1
        ylabel('Nuclear/total','FontSize',14,...
           'FontWeight','normal','Color','k')
    elseif iA==2
            ylabel('Nuclear Intensity','FontSize',14,...
           'FontWeight','normal','Color','k')
    end
    % add xlabel to the figure
    xlabel(han,'Time (hr)','FontSize',14,...
           'FontWeight','normal','Color','k');
    
    if iA==2
        xtxt=1.091;
    else
        xtxt=1.091;
    end
    % Add the condition information
    h=text(xtxt,0.62,'LPS Enzo','FontSize',14);
    set(h,'Rotation',90);

    h=text(xtxt,0.21,'TNF\alpha','FontSize',14);
    set(h,'Rotation',90);
    

    % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Heatmap_BMDM_LPS_enzo_TNF_Young_cRel_AUC','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Heatmap_BMDM_LPS_enzo_TNF_Young_cRel_AUC','.tif'],'Resolution',300);  % Saving as .tif file
    close
    
    %% Signaling features analysis 
    % What about the violin plots of dynamic features (time to peak, duration, etc) 
    % that we planned to show (see ‘Paper outline.ppt’ file). One violin plot will show
    % RelA cRel in a pair (side by side) for each of the 7 ligands. One plot per dynamic feature.
    
    % Plotting all the features in loop
    
    St_Frame1 = 9;
    frequency1 = 7;
    St_Frame2 = 11;
    frequency2 = 7;
    st = {' ',' ',' ',' ',' ',' ',' '};
    
    fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
    [PeakValue1,PeakTime1,AUC1,NOC1,Act_Duration1,rSlope1,fSlope1,OsPrd1] = Extract8Variable (Time_line12,smNuc121(3:end,:),St_Frame2,frequency1); % LPS RelA 
    [PeakValue2,PeakTime2,AUC2,NOC2,Act_Duration2,rSlope2,fSlope2,OsPrd2] = Extract8Variable (Time_line2(1:117,:),smNuc21(3:119,:),St_Frame1,frequency1); % Flagellin RelA
    [PeakValue3,PeakTime3,AUC3,NOC3,Act_Duration3,rSlope3,fSlope3,OsPrd3] = Extract8Variable (Time_line3(1:117,:),smNuc31(3:119,:),St_Frame1,frequency1); % CpG RelA
    [PeakValue4,PeakTime4,AUC4,NOC4,Act_Duration4,rSlope4,fSlope4,OsPrd4] = Extract8Variable (Time_line4(1:117,:),smNuc41(3:119,:),St_Frame1,frequency1); % Poly(I:C) RelA
    [PeakValue5,PeakTime5,AUC5,NOC5,Act_Duration5,rSlope5,fSlope5,OsPrd5] = Extract8Variable (Time_line9(1:117,:),smNuc91(3:119,:),St_Frame2,frequency1); % R848 RelA
    [PeakValue6,PeakTime6,AUC6,NOC6,Act_Duration6,rSlope6,fSlope6,OsPrd6] = Extract8Variable (Time_line10(1:117,:),smNuc101(3:119,:),St_Frame2,frequency1); % Pam RelA
    [PeakValue7,PeakTime7,AUC7,NOC7,Act_Duration7,rSlope7,fSlope7,OsPrd7] = Extract8Variable (Time_line11(1:117,:),smNuc111(3:119,:),St_Frame2,frequency1); % TNF RelA
    
    
    [PeakValue8,PeakTime8,AUC8,NOC8,Act_Duration8,rSlope8,fSlope8,OsPrd8] = Extract8Variable (Time_line12,smNuc122(3:end,:),St_Frame2,frequency1); % LPS cRel
    [PeakValue9,PeakTime9,AUC9,NOC9,Act_Duration9,rSlope9,fSlope9,OsPrd9] = Extract8Variable (Time_line2(1:117,:),smNuc22(3:119,:),St_Frame1,frequency1); % Flagellin cRel
    [PeakValue10,PeakTime10,AUC10,NOC10,Act_Duration10,rSlope10,fSlope10,OsPrd10] = Extract8Variable (Time_line3(1:117,:),smNuc32(3:119,:),St_Frame1,frequency2); % CpG cRel
    [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line4(1:117,:),smNuc42(3:119,:),St_Frame1,frequency2); % Poly(I:C) cRel
    [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line9(1:117,:),smNuc92(3:119,:),St_Frame2,frequency2); % R848 cRel
    [PeakValue13,PeakTime13,AUC13,NOC13,Act_Duration13,rSlope13,fSlope13,OsPrd13] = Extract8Variable (Time_line10(1:117,:),smNuc102(3:119,:),St_Frame2,frequency2); % Pam cRel
    [PeakValue14,PeakTime14,AUC14,NOC14,Act_Duration14,rSlope14,fSlope14,OsPrd14] = Extract8Variable (Time_line11(1:117,:),smNuc112(3:119,:),St_Frame2,frequency2); % TNF cRel
    
        
    % Make data matrix for the Violin plot Monolayer Vs Single Cell
    mx1 = max ([length(PeakValue11),length(PeakValue2),length(PeakValue3),length(PeakValue4),length(PeakValue5),length(PeakValue6),length(PeakValue7)]);
    data1 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data1 (1:length(PeakValue1),1,1) = PeakValue1';
    data1 (1:length(PeakValue8),1,2) = PeakValue8';
    
    data1 (1:length(PeakValue2),2,1) = PeakValue2';
    data1 (1:length(PeakValue9),2,2) = PeakValue9';
    
    data1 (1:length(PeakValue3),3,1) = PeakValue3';
    data1 (1:length(PeakValue10),3,2) = PeakValue10';
    
    data1 (1:length(PeakValue4),4,1) = PeakValue4';
    data1 (1:length(PeakValue11),4,2) = PeakValue11';
    
    data1 (1:length(PeakValue5),5,1) = PeakValue5';
    data1 (1:length(PeakValue12),5,2) = PeakValue12';
    
    data1 (1:length(PeakValue6),6,1) = PeakValue6';
    data1 (1:length(PeakValue13),6,2) = PeakValue13';
    
    data1 (1:length(PeakValue7),7,1) = PeakValue7';
    data1 (1:length(PeakValue14),7,2) = PeakValue14';
    
    data1 (data1==0)=nan;
    h = iosr.statistics.boxPlot(st,data1,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},... 
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Amplitude','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)

        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data1(:,1,1),data1(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data1(:,2,1),data1(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data1(:,3,1),data1(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data1(:,4,1),data1(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data1(:,5,1),data1(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data1(:,6,1),data1(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data1(:,7,1),data1(:,7,2));
        sigstar({[6.75,7.25]},[p])
 
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_Amplitude','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_Amplitude','.tif'],'Resolution',300);  % Saving as .tif file
    close
 %% -------------------------------------------------------------------------        
  % Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])

   mx1 = max ([length(PeakTime11),length(PeakTime2),length(PeakTime3),length(PeakTime4),length(PeakTime5),length(PeakTime6),length(PeakTime7)]);
    data2 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data2 (1:length(PeakTime1),1,1) = PeakTime1';
    data2 (1:length(PeakTime8),1,2) = PeakTime8';
    
    data2 (1:length(PeakTime2),2,1) = PeakTime2';
    data2 (1:length(PeakTime9),2,2) = PeakTime9';
    
    data2 (1:length(PeakTime3),3,1) = PeakTime3';
    data2 (1:length(PeakTime10),3,2) = PeakTime10';
    
    data2 (1:length(PeakTime4),4,1) = PeakTime4';
    data2 (1:length(PeakTime11),4,2) = PeakTime11';
    
    data2 (1:length(PeakTime5),5,1) = PeakTime5';
    data2 (1:length(PeakTime12),5,2) = PeakTime12';
    
    data2 (1:length(PeakTime6),6,1) = PeakTime6';
    data2 (1:length(PeakTime13),6,2) = PeakTime13';
    
    data2 (1:length(PeakTime7),7,1) = PeakTime7';
    data2 (1:length(PeakTime14),7,2) = PeakTime14';
    
    data2 (data2==0)=nan;
    h = iosr.statistics.boxPlot(st,data2,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylim ([0 8])
        
        ylabel ('Time to peak','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data2(:,1,1),data2(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data2(:,2,1),data2(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data2(:,3,1),data2(:,3,2));
        sigstar1({[2.75,3.25]},[p])
        p = ranksum (data2(:,4,1),data2(:,4,2));
        sigstar1({[3.75,4.25]},[p])
        p = ranksum (data2(:,5,1),data2(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data2(:,6,1),data2(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data2(:,7,1),data2(:,7,2));
        sigstar1({[6.75,7.25]},[p])
         axis ([0 8 0 8]);
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_PeakTime','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_PeakTime','.tif'],'Resolution',300);  % Saving as .tif file
    close
 %% -------------------------------------------------------------------------       
% Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
   mx1 = max ([length(AUC11),length(AUC2),length(AUC3),length(AUC4),length(AUC5),length(AUC6),length(AUC7)]);
    data3 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data3 (1:length(AUC1),1,1) = AUC1';
    data3 (1:length(AUC8),1,2) = AUC8';
    
    data3 (1:length(AUC2),2,1) = AUC2';
    data3 (1:length(AUC9),2,2) = AUC9';
    
    data3 (1:length(AUC3),3,1) = AUC3';
    data3 (1:length(AUC10),3,2) = AUC10';
    
    data3 (1:length(AUC4),4,1) = AUC4';
    data3 (1:length(AUC11),4,2) = AUC11';
    
    data3 (1:length(AUC5),5,1) = AUC5';
    data3 (1:length(AUC12),5,2) = AUC12';
    
    data3 (1:length(AUC6),6,1) = AUC6';
    data3 (1:length(AUC13),6,2) = AUC13';
    
    data3 (1:length(AUC7),7,1) = AUC7';
    data3 (1:length(AUC14),7,2) = AUC14';
    
    data3 (data3==0)=nan;
    h = iosr.statistics.boxPlot(st,data3,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('AUC','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data3(:,1,1),data3(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data3(:,2,1),data3(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data3(:,3,1),data3(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data3(:,4,1),data3(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data3(:,5,1),data3(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data3(:,6,1),data3(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data3(:,7,1),data3(:,7,2));
        sigstar({[6.75,7.25]},[p])
 
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_AUC','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_AUC','.tif'],'Resolution',300);  % Saving as .tif file
    close

%%
% Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
   mx1 = max ([length(NOC11),length(NOC2),length(NOC3),length(NOC4),length(NOC5),length(NOC6),length(NOC7)]);
    data4 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data4 (1:length(NOC1),1,1) = NOC1';
    data4 (1:length(NOC8),1,2) = NOC8';
    
    data4 (1:length(NOC2),2,1) = NOC2';
    data4 (1:length(NOC9),2,2) = NOC9';
    
    data4 (1:length(NOC3),3,1) = NOC3';
    data4 (1:length(NOC10),3,2) = NOC10';
    
    data4 (1:length(NOC4),4,1) = NOC4';
    data4 (1:length(NOC11),4,2) = NOC11';
    
    data4 (1:length(NOC5),5,1) = NOC5';
    data4 (1:length(NOC12),5,2) = NOC12';
    
    data4 (1:length(NOC6),6,1) = NOC6';
    data4 (1:length(NOC13),6,2) = NOC13';
    
    data4 (1:length(NOC7),7,1) = NOC7';
    data4 (1:length(NOC14),7,2) = NOC14';
    
    data4 (data4==0)=nan;
    h = iosr.statistics.boxPlot(st,data4,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylim ([0 5])
        ylabel ('Number of cycle','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data4(:,1,1),data4(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data4(:,2,1),data4(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data4(:,3,1),data4(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data4(:,4,1),data4(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data4(:,5,1),data4(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data4(:,6,1),data4(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data4(:,7,1),data4(:,7,2));
        sigstar({[6.75,7.25]},[p])
 
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_NOC','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_NOC','.tif'],'Resolution',300);  % Saving as .tif file
    close

%%
% Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
   mx1 = max ([length(Act_Duration11),length(Act_Duration2),length(Act_Duration3),length(Act_Duration4),length(Act_Duration5),length(Act_Duration6),length(Act_Duration7)]);
    data5 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data5 (1:length(Act_Duration1),1,1) = Act_Duration1';
    data5 (1:length(Act_Duration8),1,2) = Act_Duration8';
    
    data5 (1:length(Act_Duration2),2,1) = Act_Duration2';
    data5 (1:length(Act_Duration9),2,2) = Act_Duration9';
    
    data5 (1:length(Act_Duration3),3,1) = Act_Duration3';
    data5 (1:length(Act_Duration10),3,2) = Act_Duration10';
    
    data5 (1:length(Act_Duration4),4,1) = Act_Duration4';
    data5 (1:length(Act_Duration11),4,2) = Act_Duration11';
    
    data5 (1:length(Act_Duration5),5,1) = Act_Duration5';
    data5 (1:length(Act_Duration12),5,2) = Act_Duration12';
    
    data5 (1:length(Act_Duration6),6,1) = Act_Duration6';
    data5 (1:length(Act_Duration13),6,2) = Act_Duration13';
    
    data5 (1:length(Act_Duration7),7,1) = Act_Duration7';
    data5 (1:length(Act_Duration14),7,2) = Act_Duration14';
    
    data5 (data5==0)=nan;
    h = iosr.statistics.boxPlot(st,data5,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Duration','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data5(:,1,1),data5(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data5(:,2,1),data5(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data5(:,3,1),data5(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data5(:,4,1),data5(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data5(:,5,1),data5(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data5(:,6,1),data5(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data5(:,7,1),data5(:,7,2));
        sigstar({[6.75,7.25]},[p])
 
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_Act_Duration','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_Act_Duration','.tif'],'Resolution',300);  % Saving as .tif file
    close

%%
% Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
   mx1 = max ([length(rSlope11),length(rSlope2),length(rSlope3),length(rSlope4),length(rSlope5),length(rSlope6),length(rSlope7)]);
    data6 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data6 (1:length(rSlope1),1,1) = rSlope1';
    data6 (1:length(rSlope8),1,2) = rSlope8';
    
    data6 (1:length(rSlope2),2,1) = rSlope2';
    data6 (1:length(rSlope9),2,2) = rSlope9';
    
    data6 (1:length(rSlope3),3,1) = rSlope3';
    data6 (1:length(rSlope10),3,2) = rSlope10';
    
    data6 (1:length(rSlope4),4,1) = rSlope4';
    data6 (1:length(rSlope11),4,2) = rSlope11';
    
    data6 (1:length(rSlope5),5,1) = rSlope5';
    data6 (1:length(rSlope12),5,2) = rSlope12';
    
    data6 (1:length(rSlope6),6,1) = rSlope6';
    data6 (1:length(rSlope13),6,2) = rSlope13';
    
    data6 (1:length(rSlope7),7,1) = rSlope7';
    data6 (1:length(rSlope14),7,2) = rSlope14';
    
    data6 (data6==0)=nan;
    h = iosr.statistics.boxPlot(st,data6,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Slope of 1^s^t rise','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data6(:,1,1),data6(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data6(:,2,1),data6(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data6(:,3,1),data6(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data6(:,4,1),data6(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data6(:,5,1),data6(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data6(:,6,1),data6(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data6(:,7,1),data6(:,7,2));
        sigstar({[6.75,7.25]},[p])
 
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_rSlope','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_rSlope','.tif'],'Resolution',300);  % Saving as .tif file
    close

%%
% Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
   mx1 = max ([length(fSlope11),length(fSlope2),length(fSlope3),length(fSlope4),length(fSlope5),length(fSlope6),length(fSlope7)]);
    data7 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data7 (1:length(fSlope1),1,1) = fSlope1';
    data7 (1:length(fSlope8),1,2) = fSlope8';
    
    data7 (1:length(fSlope2),2,1) = fSlope2';
    data7 (1:length(fSlope9),2,2) = fSlope9';
    
    data7 (1:length(fSlope3),3,1) = fSlope3';
    data7 (1:length(fSlope10),3,2) = fSlope10';
    
    data7 (1:length(fSlope4),4,1) = fSlope4';
    data7 (1:length(fSlope11),4,2) = fSlope11';
    
    data7 (1:length(fSlope5),5,1) = fSlope5';
    data7 (1:length(fSlope12),5,2) = fSlope12';
    
    data7 (1:length(fSlope6),6,1) = fSlope6';
    data7 (1:length(fSlope13),6,2) = fSlope13';
    
    data7 (1:length(fSlope7),7,1) = fSlope7';
    data7 (1:length(fSlope14),7,2) = fSlope14';
    
    data7 (data7==0)=nan;
    h = iosr.statistics.boxPlot(st,data7,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Attenuation rate','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box on
        ylim ([-0.2 0.1])
        
        % Mann-Whitney U-test p value 
        p = ranksum (data7(:,1,1),data7(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data7(:,2,1),data7(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data7(:,3,1),data7(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data7(:,4,1),data7(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data7(:,5,1),data7(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data7(:,6,1),data7(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data7(:,7,1),data7(:,7,2));
        sigstar({[6.75,7.25]},[p])

        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_fSlope','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_fSlope','.tif'],'Resolution',300);  % Saving as .tif file
    close

%%
% Make data matrix for the Violin plot Monolayer Vs Single Cell
   fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
 
   mx1 = max ([length(OsPrd11),length(OsPrd2),length(OsPrd3),length(OsPrd4),length(OsPrd5),length(OsPrd6),length(OsPrd7)]);
    data8 = zeros (mx1,7,2).*NaN;   % Two group (Monolayer and Single cell)
    data8 (1:length(OsPrd1),1,1) = OsPrd1';
    data8 (1:length(OsPrd8),1,2) = OsPrd8';
    
    data8 (1:length(OsPrd2),2,1) = OsPrd2';
    data8 (1:length(OsPrd9),2,2) = OsPrd9';
    
    data8 (1:length(OsPrd3),3,1) = OsPrd3';
    data8 (1:length(OsPrd10),3,2) = OsPrd10';
    
    data8 (1:length(OsPrd4),4,1) = OsPrd4';
    data8 (1:length(OsPrd11),4,2) = OsPrd11';
    
    data8 (1:length(OsPrd5),5,1) = OsPrd5';
    data8 (1:length(OsPrd12),5,2) = OsPrd12';
    
    data8 (1:length(OsPrd6),6,1) = OsPrd6';
    data8 (1:length(OsPrd13),6,2) = OsPrd13';
    
    data8 (1:length(OsPrd7),7,1) = OsPrd7';
    data8 (1:length(OsPrd14),7,2) = OsPrd14';
    
    data8 (data8==0)=nan;
    h = iosr.statistics.boxPlot(st,data8,...
            'style','hierarchy',...
            'xSeparator',false,...
            'symbolColor','k',...
            'medianColor','k',...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'',''}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0,1,0];[1 0 1]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',[1,1,1],...
            'showOutliers', true,... 
            'outlierSize',2,...
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        ylabel ('Period of oscilation','FontSize',20)
%         ax=gca;
%         ax.YAxis.Exponent=3;
        
        xticklabels({'LPS','Flagelin','CpG','Poly(I:C)','R848','Pam3CSK','TNF\alpha'});
                xtickangle(45)
 
        %title ('','FontSize',14);
        % Adding xtick label
%         xticklabels({'Monolayer','Single Cell'});
%         xtickangle(45)
        hAxes = gca;
        hAxes.XAxis.FontSize = 20;
%         turn off the tick label
%         set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data8(:,1,1),data8(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data8(:,2,1),data8(:,2,2));
        sigstar({[1.75,2.25]},[p])
        p = ranksum (data8(:,3,1),data8(:,3,2));
        sigstar({[2.75,3.25]},[p])
        p = ranksum (data8(:,4,1),data8(:,4,2));
        sigstar({[3.75,4.25]},[p])
        p = ranksum (data8(:,5,1),data8(:,5,2));
        sigstar({[4.75,5.25]},[p])
        p = ranksum (data8(:,6,1),data8(:,6,2));
        sigstar({[5.75,6.25]},[p])
        p = ranksum (data8(:,7,1),data8(:,7,2));
        sigstar({[6.75,7.25]},[p])
 
        % Save figure in the output directory
    cd (outputFolder);
    exportgraphics(gcf,['Violin_plot_pY_BMDM_OsPrd','.pdf'],'ContentType','vector'); % Saving as PDF file
    exportgraphics(gcf,['Violin_plot_pY_BMDM_OsPrd','.tif'],'Resolution',300);  % Saving as .tif file
    close

%% Generation of violin plot for TNF and LPS same plot

    St_Frame1 = 9;
    frequency1 = 7;
    St_Frame2 = 11;
    frequency2 = 7;
    
    
    fig1 = figure(1);
    set(gcf,'Units','inches',...
    'Position',[0 0 14 6])
    [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line12,smNuc121(3:end,:),St_Frame2,frequency1); % LPS RelA 
    [PeakValue21,PeakTime21,AUC21,NOC21,Act_Duration21,rSlope21,fSlope21,OsPrd21] = Extract8Variable (Time_line11,smNuc111(3:end,:),St_Frame2,frequency1); % TNF RelA
    
    
    [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc122(3:end,:),St_Frame2,frequency1); % LPS cRel
    [PeakValue22,PeakTime22,AUC22,NOC22,Act_Duration22,rSlope22,fSlope22,OsPrd22] = Extract8Variable (Time_line11,smNuc112(3:end,:),St_Frame2,frequency2); % TNF cRel
    



%---------------------------------------------------------------------------
 st = {' ',' '};
        fig4 = figure(4);
        set(gcf,'Units','inches',...
        'Position',[0 0 14 6])

        hAxis(1) = subplot(3,3,1);
        [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line12,smNuc121(3:end,:),St_Frame2,frequency1); % LPS RelA 
        [PeakValue21,PeakTime21,AUC21,NOC21,Act_Duration21,rSlope21,fSlope21,OsPrd21] = Extract8Variable (Time_line11,smNuc111(3:end,:),St_Frame2,frequency1); % TNF RelA


        [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc122(3:end,:),St_Frame2,frequency1); % LPS cRel
        [PeakValue22,PeakTime22,AUC22,NOC22,Act_Duration22,rSlope22,fSlope22,OsPrd22] = Extract8Variable (Time_line11,smNuc112(3:end,:),St_Frame2,frequency2); % TNF cRel


        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(PeakValue11),length(PeakValue12),length(PeakValue21),length(PeakValue22)]);
        data1 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data1 (1:length(PeakValue11),1,1) = PeakValue11';  % For LPS
        data1 (1:length(PeakValue12),1,2) = PeakValue12';
        
        data1 (1:length(PeakValue21),2,1) = PeakValue21';   % For TNF
        data1 (1:length(PeakValue22),2,2) = PeakValue22';


        h = iosr.statistics.boxPlot(st,data1,...
            'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylabel ('Amplitude','FontSize',12)
        ax=gca;
        ax.YAxis.Exponent=0;
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data1(:,1,1),data1(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data1(:,2,1),data1(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data1(:,1,1),data1(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data1(:,1,2),data1(:,2,2));
        sigstar({[1.0,2.25]},[p])
        
        %
        %------------------------------------------------------------------
        hAxis(2) = subplot(3,3,2);
        
        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(PeakTime11),length(PeakTime12),length(PeakTime21),length(PeakTime22)]);
        data2 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data2 (1:length(PeakTime11),1,1) = PeakTime11';  % For LPS
        data2 (1:length(PeakTime12),1,2) = PeakTime12';
        
        data2 (1:length(PeakTime21),2,1) = PeakTime21';   % For TNF
        data2 (1:length(PeakTime22),2,2) = PeakTime22';
 
 
 
        h = iosr.statistics.boxPlot(st,data2,...
           'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylim([0,3])
        ylabel ('Time to peak','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data2(:,1,1),data2(:,1,2));
        sigstar1({[0.75,1.25]},[p])
        p = ranksum (data2(:,2,1),data2(:,2,2));
        sigstar1({[1.75,2.25]},[p])
        
        p = ranksum (data2(:,1,1),data2(:,2,1));
        sigstar1({[0.75,1.75]},[p])
        p = ranksum (data2(:,1,2),data2(:,2,2));
        sigstar1({[1.0,2.25]},[p])
 
        %------------------------------------------------------------------
        hAxis(3) = subplot(3,3,3);
        
        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(AUC11),length(AUC12),length(AUC21),length(AUC22)]);
        data3 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data3 (1:length(AUC11),1,1) = AUC11';  % For LPS
        data3 (1:length(AUC12),1,2) = AUC12';
        
        data3 (1:length(AUC21),2,1) = AUC21';   % For TNF
        data3 (1:length(AUC22),2,2) = AUC22';
 
 
 
        h = iosr.statistics.boxPlot(st,data3,...
            'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylabel ('AUC','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data3(:,1,1),data3(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data3(:,2,1),data3(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data3(:,1,1),data3(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data3(:,1,2),data3(:,2,2));
        sigstar({[1.0,2.25]},[p])
 
       %------------------------------------------------------------------
        basal = mean(mNuc11(3:St_Frame2,:),1);
        mNuc11 = mNuc11./basal;
        basal = mean(mNuc21(3:St_Frame2,:),1);
        mNuc21 = mNuc21./basal;
        basal = mean(mNuc21(3:St_Frame2,:),1);
        mNuc21 = mNuc21./basal;
        basal = mean(mNuc22(3:St_Frame2,:),1);
        mNuc22 = mNuc22./basal;
        % Use the Quantification of 8 parameters
        [PeakValue11,PeakTime11,AUC11,NOC11,Act_Duration11,rSlope11,fSlope11,OsPrd11] = Extract8Variable (Time_line12,smNuc121(3:end,:),St_Frame2,frequency1); % LPS RelA 
        [PeakValue21,PeakTime21,AUC21,NOC21,Act_Duration21,rSlope21,fSlope21,OsPrd21] = Extract8Variable (Time_line11,smNuc111(3:end,:),St_Frame2,frequency1); % TNF RelA
 
 
        [PeakValue12,PeakTime12,AUC12,NOC12,Act_Duration12,rSlope12,fSlope12,OsPrd12] = Extract8Variable (Time_line12,smNuc122(3:end,:),St_Frame2,frequency1); % LPS cRel
        [PeakValue22,PeakTime22,AUC22,NOC22,Act_Duration22,rSlope22,fSlope22,OsPrd22] = Extract8Variable (Time_line11,smNuc112(3:end,:),St_Frame2,frequency2); % TNF cRel
 
        
        hAxis(4) = subplot(3,3,4);
        
        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(AUC11),length(AUC12),length(AUC21),length(AUC22)]);
        data4 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data4 (1:length(AUC11),1,1) = AUC11';  % For LPS
        data4 (1:length(AUC12),1,2) = AUC12';
        
        data4 (1:length(AUC21),2,1) = AUC21';   % For TNF
        data4 (1:length(AUC22),2,2) = AUC22';
 
 
 
        h = iosr.statistics.boxPlot(st,data4,...
           'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylabel ('AUC (fold change)','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data4(:,1,1),data4(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data4(:,2,1),data4(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data4(:,1,1),data4(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data4(:,1,2),data4(:,2,2));
        sigstar({[1.0,2.25]},[p])
 
 
        %------------------------------------------------------------------
        hAxis(5) = subplot(3,3,5);
        
        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(NOC11),length(NOC12),length(NOC21),length(NOC22)]);
        data5 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data5 (1:length(NOC11),1,1) = NOC11';  % For LPS
        data5 (1:length(NOC12),1,2) = NOC12';
        
        data5 (1:length(NOC21),2,1) = NOC21';   % For TNF
        data5 (1:length(NOC22),2,2) = NOC22';
 
 
 
        h = iosr.statistics.boxPlot(st,data5,...
            'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylabel ('Number of cycle','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data5(:,1,1),data5(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data5(:,2,1),data5(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data5(:,1,1),data5(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data5(:,1,2),data5(:,2,2));
        sigstar({[1.0,2.25]},[p])
 
 
        %------------------------------------------------------------------
        hAxis(6) = subplot(3,3,6);
        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(Act_Duration11),length(Act_Duration12),length(Act_Duration21),length(Act_Duration22)]);
        data6 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data6 (1:length(Act_Duration11),1,1) = Act_Duration11';  % For LPS
        data6 (1:length(Act_Duration12),1,2) = Act_Duration12';
        
        data6 (1:length(Act_Duration21),2,1) = Act_Duration21';   % For TNF
        data6 (1:length(Act_Duration22),2,2) = Act_Duration22';
 
 
 
        h = iosr.statistics.boxPlot(st,data6,...
           'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylim([5,20])
        ylabel ('Duration','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data6(:,1,1),data6(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data6(:,2,1),data6(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data6(:,1,1),data6(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data6(:,1,2),data6(:,2,2));
        sigstar({[1.0,2.25]},[p])
 
 
         %-------------------------------------------------------------------------
        hAxis(7) = subplot(3,3,7);
        % Make data matrix for the Violin plot RelA signal
        mx1 = max ([length(rSlope11),length(rSlope12),length(rSlope21),length(rSlope22)]);
        data7 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data7 (1:length(rSlope11),1,1) = rSlope11';  % For LPS
        data7 (1:length(rSlope12),1,2) = rSlope12';
        
        data7 (1:length(rSlope21),2,1) = rSlope21';   % For TNF
        data7 (1:length(rSlope22),2,2) = rSlope22';
 
 
 
        h = iosr.statistics.boxPlot(st,data7,...
            'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylabel ('1^s^t rising slope','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data7(:,1,1),data7(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data7(:,2,1),data7(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data7(:,1,1),data7(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data7(:,1,2),data7(:,2,2));
        sigstar({[1.0,2.25]},[p])
        
        %-------------------------------------------------------------------------
        hAxis(8) = subplot(3,3,8);
        mx1 = max ([length(fSlope11),length(fSlope12),length(fSlope21),length(fSlope22)]);
        data8 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data8 (1:length(fSlope11),1,1) = fSlope11';  % For LPS
        data8 (1:length(fSlope12),1,2) = fSlope12';
        
        data8 (1:length(fSlope21),2,1) = fSlope21';   % For TNF
        data8 (1:length(fSlope22),2,2) = fSlope22';
 
 
 
        h = iosr.statistics.boxPlot(st,data8,...
            'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...
            'medianColor',[0.00,0.45,0.74],...
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylim([-0.2,0.2])
        ylabel ('Attenuation rate','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data8(:,1,1),data8(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data8(:,2,1),data8(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data8(:,1,1),data8(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data8(:,1,2),data8(:,2,2));
        sigstar({[1.0,2.25]},[p])
 
        % -------------------------------------------------------------------------
        hAxis(9) = subplot(3,3,9);
        mx1 = max ([length(OsPrd11),length(OsPrd12),length(OsPrd21),length(OsPrd22)]);
        data9 = zeros (mx1,2,2).*NaN;   % Two group (Monolayer and Single cell)
        
        data9 (1:length(OsPrd11),1,1) = OsPrd11';  % For LPS
        data9 (1:length(OsPrd12),1,2) = OsPrd12';
        
        data9 (1:length(OsPrd21),2,1) = OsPrd21';   % For TNF
        data9 (1:length(OsPrd22),2,2) = OsPrd22';
 
 
 
        h = iosr.statistics.boxPlot(st,data9,...
            'style','hierarchy',...
            'lineColor',{[0.1,0.1,0.1],[0.1,0.1,0.1]},...
            'xSeparator',false,...
            'symbolColor',[0.00,0.45,0.74],...              % delete this line to get default color
            'medianColor',[0.00,0.45,0.74],...              % delete this line to get default color
            'boxcolor',{[0.8 0.8 0.8];[0.8 0.8 0.8]},...
            'groupLabels',{{'RelA','c-Rel'}},...
            'showScatter',true,...
            'showMean',true,...
            'meanMarker','+',...
            'meanColor', 'red',...
            'limit',[5,95],...
            'boxWidth',0.150,...                 % % The width of the boxes.
            'showScatter',true,...
            'scatterMarker', '.',...
            'scatterColor', {[0.5000, 0.5000,0.5000];[0.5000, 0.5000,0.5000]},...
            'scatterLayer', 'top',...
            'violinWidth', 'auto',...
            'showViolin',  true,...
            'violinColor',{[1,1,1]},...
            'showOutliers', true,... 
            'violinBinWidth', 'auto');
        % Adding ylabel and titile
        box on
        %
        ylabel ('Period of oscillation','FontSize',12)
        % turn off the tick label
        set(gca,'xticklabel',{[]})
        box off
        % Mann-Whitney U-test p value 
        p = ranksum (data9(:,1,1),data9(:,1,2));
        sigstar({[0.75,1.25]},[p])
        p = ranksum (data9(:,2,1),data9(:,2,2));
        sigstar({[1.75,2.25]},[p])
        
        p = ranksum (data9(:,1,1),data9(:,2,1));
        sigstar({[0.75,1.75]},[p])
        p = ranksum (data9(:,1,2),data9(:,2,2));
        sigstar({[1.0,2.25]},[p])

        %------------------------------------------------------------------
        NarrowSubplot (3,3,hAxis,0.05,0.2,0.135,0.1,0.08,0.04);

        % SAVING figure in the output directory
        cd (outputFolder);
        exportgraphics(gcf,['Signaling_features_comparision_RelA_cRel_LPS_TNF_defaultcolor','.pdf'],'ContentType','vector'); % Saving as PDF file
        exportgraphics(gcf,['Signaling_features_comparision_RelA_cRel_LPS_TNF_defaultcolor','.tif'],'Resolution',300);  % Saving as .tif file
        close


