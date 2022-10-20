% This Script is written to calculate the fluorescent tagged NF-kB
% nuclear translocation dynamics from live-cell fluorescent image sequence.
% We will use GFP-RelA or RelB-YFP or mScarlet-cRel reporter mouse primary
% cell and cell will be image using the LSM 880 using the cofocal or airy
% scan mode. Individual cell will be segmented using the adaptive
% thresholding method. An alternative approach can be adopted using BioSeg.
% The individual cell will be tracked using the linease mapper (Chalfoun et al. 2016).  Batch
% process will be done to make this step seamless.

% Nuclear segmentation will be perform either using the Sir-DNA far-red
% channel or manually segment the nucleus using the Microscopy image
% Browser or using Machine learning approach segmenting nucleus from the
% Brightfield or DIC image. We will also use Darkfield microscopy to segement the nucleus.

% Using the tracked cell mask and nuclear mask, we will calculate and store
% the totoal nuclear fluorescence, total cell's fluorescence, mean nuclear
% fluorescence, mean cell's fluorescence, Nuclear fluorescence over total 
% fluorescence (TNF/TCF), Mean Nuclear fluorescence over mean cell 
% fluorescence (MNF/MCF).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by: Shah Md Toufiqur Rahman
% Date: 7/16/2020
% Visiting Fellow
% Gene Regulation Section
% National Institute on Aging
% National Institute of Health
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all
%--------------------------------------------------------------------------
% Adding the directory of important function that will be used here.
addpath ('E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Scripts');
%--------------------------------------------------------------------------
% -----------READING THE INPUT IMAGE FILE (sStageNumber.tif)---------------
% % Take input from the user : Number of stage position want to analyse
% stageN = input ('Give the number of stage position for the experiment-->');
% Take input from the user how many stage position want to extract
stageNi = input ('Give the initial stage number:-->');
stageNf = input ('Give the final stage number:-->');
%==========================================================================
% --------------------Get Image directory----------------------------------
currentFolder = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Primary_Old_BMDM_GFP_relA_mScarlet_cRel_TLR_ligands_2020_09_03\images';
ImgName = '';
% make output directory
cd (currentFolder);
cd ..\.
resultFolder = fullfile(pwd,'\output');
if ~exist(resultFolder, 'dir')
    mkdir(resultFolder);
end
% resultFolder = 'E:\NIA_Experiment\Expt# MEF_GFP-RelA_LPS_100ng_ml\output';
%==========================================================================
cd (currentFolder);
for stageID = stageNi:stageNf
    disp(['Now processing segmentation and tracking of position #',num2str(stageID)]);
    stage_name = ['SegCell_s',num2str(stageID)];
    % Make a folder as named by the stage name
    outputFolder = fullfile(pwd, [ImgName,'s',num2str(stageID)]);
    if ~exist(outputFolder, 'dir')
        mkdir(outputFolder);
    end
% Reading live-cell image movie file (GFP-image-stack)
    fname = [stage_name,'.tif'];
    info = imfinfo (fname);
    
%--------------------------------------------------------------------------
    NumFrame = numel(info);    % or Assian number of Frame
    %NumFrame = 50;       % USER DEFINED IMAGE FRAME NUMBER
%--------------------------------------------------------------------------
%   Segmentation of image sequence. This section will make new folder for
%   each of the stage position and save the segmented image sequence in that
%   folder. 
    NucMaskName = ['Labels_','s',num2str(stageID),'.mat'];
   for imageID = 1:NumFrame
         % Read cell segmentation binary image
        imgCell = imread (fname, imageID);
        % Read the nuclear mask
        s = load (NucMaskName);
        img = s.NucMask;       % nuclear mask, 3D matrix
        img2 = img(:,:,imageID);        % nuclear mask, 2D matrix
        img3 = double (img2) + double (imgCell);
        img3 = img3>0;
        img3 = imfill (img3,'holes');
        img3 = bwareaopen (img3,20);
        
        img4 = imdilate (img3,strel('disk',4));
        img4 = bwareaopen(img4,10);
        img4 = bwconvhull (img4,'objects');
        
        % Use watershed thresolding 
        bw2 = ~bwareaopen(~img3,10);
        D = -bwdist(~img3);
        Ld = watershed(D);
        bw2 = img3;
        bw2 (Ld==0)=0;
        mask = img4; %imextendedmin(D,2);
        D2 = imimposemin(D,mask);
        Ld2 = watershed(D2);
        bw3 = img3;
        bw3 (Ld2==0)=0;
        out_img = bw3;      % img = separated binary mask;
        imgWS = out_img;
        outputImage = imgWS;
        outputImage = bwareaopen (outputImage,100);
        
        L = bwlabel (outputImage);
%       Change the directory to created folder
        cd (outputFolder)
%       Save the labelled, segmented cell 
        imwrite (uint16(L),['segmented_image_',sprintf('%04d',(imageID)),'.tif'])
%       Change the folder directory back to original location
        cd (currentFolder) 
    end
cd (outputFolder);
%--------------------------------------------------------------------------
%       Run Lineage mapper as a batch. This section will track the individual
%       cell and save the tracked image in the corresponding folder.
%       change the directory to segmented folder
%         addpath('C:\Program Files\MATLAB\R2020b\toolbox\local');
        ctrack_dir = 'LineageMapper.exe';
        cd('E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Scripts\LM\Lineage-Mapper-compiled-matlab');
        command = [ctrack_dir,' ','segmented_images_path',' ','"',outputFolder,'"',' ','tracked_images_path',' ','"',outputFolder,'"'];
        status = jsystem (command);
        

              
        
        cd (currentFolder)
        
%%%%%%%%%%%%%%%%%% Tracking using Fiji plugin %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addpath('D:\Fiji\scripts');
%  javaaddpath('C:\Program Files\MATLAB\R2020b\java\jar\mij.jar');
% javaaddpath('C:\Program Files\MATLAB\R2020b\java\jar\ij.jar');
% ImageJ;
% % impt_cammand = ['Image Sequence...", "open=[',outputFolder,'\segmented_image_0001.tif] file=seg sort'];
% % MIJ.run(impt_cammand);
% % LM_command = ['"Lineage Mapper", "inputdirectory=[',outputFolder,'\] filenameprefix=segmented_image_{iiii}.tif outputdirectory=[',outputFolder,];
% % MIJ.run(LM_command);
% 
% MIJ.run('Image Sequence...',['open=[',outputFolder,'\segmented_image_0001.tif] sort']);
% % MIJ.run("Lineage Mapper", "inputdirectory=[E:\NIA_Experiment\Primary YM GFP-RelA mScarlet-cRel_without mCSF_TLR ligand 10-7-2020\images\s6\] filenameprefix=segmented_image_{iiii}.tif outputdirectory=[E:\\NIA_Experiment\\Primary YM GFP-RelA mScarlet-cRel_without mCSF_TLR ligand 10-7-2020\\images\\s6\\] outputprefix=tracked_image- weightcelloverlap=1.0 weightcentroidsdistance=0.5 weightcellsize=0.2 maxcentroidsdistance=50.0 mincelllife=32 celldeathdeltacentroid=10.0 celldensityaffectsci=true bordercellaffectsci=true daughtersizesimilarity=0.5 mindivisionoverlap=0.2 daughteraspectratiosimilarity=0.7 mothercircularityindex=0.3 numframestocheckcircularity=5 enablecelldivision=true mincellarea=100 minfusionoverlap=0.2 enablecellfusion=false");
% 
% MIJ.run("Lineage Mapper", "inputdirectory=[outputFolder] filenameprefix=segmented_image_{iiii}.tif outputdirectory=[outputFolder] outputprefix=tracked_image- weightcelloverlap=1.0 weightcentroidsdistance=0.5 weightcellsize=0.2 maxcentroidsdistance=50.0 mincelllife=32 celldeathdeltacentroid=10.0 celldensityaffectsci=true bordercellaffectsci=true daughtersizesimilarity=0.5 mindivisionoverlap=0.2 daughteraspectratiosimilarity=0.7 mothercircularityindex=0.3 numframestocheckcircularity=5 enablecelldivision=true mincellarea=100 minfusionoverlap=0.2 enablecellfusion=false");
% 
% % MIJ.run('Lineage Mapper', ['inputdirectory=[',outputFolder,'\] filenameprefix=segmented_image_{iiii}.tif outputdirectory=[D:\Project# Seamless Image analysis platform using MATLAB and Imagej\s1\] outputprefix=tracked_image_{iiii}.tif weightcelloverlap=1.0 weightcentroidsdistance=0.5 weightcellsize=0.2 maxcentroidsdistance=50.0 mincelllife=32 celldeathdeltacentroid=10.0 celldensityaffectsci=true bordercellaffectsci=true daughtersizesimilarity=0.5 mindivisionoverlap=0.2 daughteraspectratiosimilarity=0.7 mothercircularityindex=0.3 numframestocheckcircularity=5 enablecelldivision=true mincellarea=100 minfusionoverlap=0.2 enablecellfusion=false']);
% MIJ.run("Quit","");
        
        
end
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%------ANALYSIS--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
for stageID = stageNi:stageNf
    disp(['Now processing analysis of position #',num2str(stageID)]);
    cd (currentFolder);
    stage_name = [ImgName,'s',num2str(stageID)];
% Make a folder as named by the stage name
outputFolder = fullfile(pwd, [ImgName,'s',num2str(stageID)]);
if ~exist(outputFolder, 'dir')
  mkdir(outputFolder);
end
s = load (['Labels_',ImgName,'s',num2str(stageID),'.mat']);
img = s.NucMask;       % nuclear mask inforamtion from the MIB
% Reading live-cell image movie file (GFP-image-stack)
fname = [stage_name,'-1','.tif'];
info = imfinfo(fname);
fname2 = [stage_name,'-2','.tif'];
info2 = imfinfo (fname2);

NumFrame = numel(info);
% Read the position.csv file which have all the centroid positions for all
% the tracks
cd (outputFolder);
T = xlsread ('positions.csv');      % Tracking information from the Lineage mapper
counter = 0;
d = numel(num2str(NumFrame));
for imageID = 1: NumFrame
    cd (currentFolder);
    imgMain1 = imread (fname, imageID); % reading the GFP file
    imgMain1 = imgMain1 - ProcessedBG1(imgMain1);%imgaussian (imgMain1,500,550);
    imgMain1 = medfilt2 (imgMain1);
    imgMain2 = imread (fname2, imageID); % reading the mScarlet file
    imgMain2 = imgMain2 - ProcessedBG1(imgMain2);%imgaussian (imgMain2,500,550);
    imgMain2 = medfilt2(imgMain2);
%   Background substraction (method: 
    %imgMain= imgMain - imgaussian (imgMain,500,550);
    cd (outputFolder);
    img2 = img(:,:,imageID); 
    mask = imread ([sprintf(['%0',num2str(d),'d'],(imageID)),'.tif']);  % cell mask from the LM tracker
%
%%%% Save the Segmented image overleyed with either GFP-RelA or mScarlet-cRel%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SI = imfuse (imgMain2,bwperim(mask));   % overlay the cell mask in original GFP-RelA image
    SI = imfuse (SI,bwperim(img2));         % adding overlay of the numclear mask 
    MSI (:,:,:,imageID) = SI;               % Saving the overlayed sequence.
%    
%%%%%%%%%%%%%%%%%%%%%%%% Analysis of individual cell %%%%%%%%%%%%%%%%%%%%%%%
% Acell = Area of the cell
% Anuc  = Area of the nucleus
% Acyt  = Aread of cytosol

% Fcyt  = Total fluorescence intensity of the cytosol
% Fnuc  = Total fluorescence intensity of the nucleus
% Fcell = Total fluoorescence intensity of the cell (fcyt + fnuc)

% MCellF = Fcell/Acell
% MnucF  = Fnuc/Anuc
% McytF  = Fcyt/Acyt

% rNF_cellF = Fnuc/Fcell;
% rNf_cellf = MnucF/MCellF; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SIT = SI;

    cellN = sum(T(:,2) == imageID);     % number of cell in each frame
    id = find(T(:,2)==imageID);
    TT = T(id(1):id(end),:);

    for cellID = 1: cellN
        counter = counter +1;
        cell = (mask == TT(cellID,1));  % selecting individual cell
        cell_label = TT(cellID,1);
        s = regionprops (cell,'BoundingBox','Centroid');
        bb = s.BoundingBox;
   
        C_mask = extend_im (cell,bb,0);         % crop the tracked image for individual cell
        N_mask = extend_im (img2,bb,0);         % crop the nuclear mask frame with individual cell size
        OI_crop1 = extend_im (imgMain1,bb,0);    % crop the background substracted image with individual cell size 
        OI_crop2 = extend_im (imgMain2,bb,0);
        
%         % Correct the cell mask using kmean clustering
%         [c1,m1] = GrayClustering (OI_crop1);
%         [c2,m2] = GrayClustering (OI_crop2);
%         C_mask = double(c1>1).*(double(c2>1));
        
        % Adding cell number to the overlayed image
        cen = s.Centroid;
        [row,col] = find(bwperim(cell),1);
        SIT = insertText (SI,cen,num2str(cell_label),'FontSize',18,'BoxColor',...
                            {'yellow'},'BoxOpacity',0,'TextColor','white');
        SI = SIT;
        

        %
        
        %%%%%%%%%%%% Generate and save the overlayed image %%%%%%%%%%%%%%%
        % Get the boundary of segmented cell
        B = bwboundaries(cell);
  
        
        N_mask = double (C_mask).*double(N_mask); % This is done to make sure only nuclear area inside the segmented cellular area are considered.
        N_mask = N_mask>0;  % binearize the nulear area
        C_mask = C_mask>0;  % binearize the cellular area
        
        N_mask = bwareafilt (N_mask,1); % keeping the largest object and delating the non-specific area
        C_mask = bwareafilt (C_mask,1);
        cyt_mask = C_mask - N_mask;
        
        % Calculate the area of nuclear, and cell 
        Acell = bwarea (C_mask);    % Area of cell
        Anuc = bwarea (N_mask);     % Area of nucleus
        
        % Convert the zero pixels of N_mask, C_mask, and cyt_mask to NaN
%         NN_mask = double(N_mask);
%         NN_mask(NN_mask==0)=nan;
%         CC_mask = double(C_mask);
%         CC_mask(CC_mask==0)=nan;
%         ccyt_mask = double(cyt_mask);
%         ccyt_mask(ccyt_mask==0)=nan;
        
        % Saving the area information 
        ACell (TT(cellID,2),TT(cellID,1)) = Acell;
        ANuc (TT(cellID,2),TT(cellID,1)) = Anuc;
        Acyt (TT(cellID,2),TT(cellID,1)) = Acell - Anuc;
     
        % mean fluorescence intensity  calculation 
        fnuc1 = mean(mean(nonzeros((double(N_mask)).*(double(OI_crop1)))));%sum (nonzeros(double(N_mask).*(double(OI_crop1))))/(sum (nonzeros(double(N_mask))));
        fcyt1 = mean(mean(nonzeros(double(cyt_mask).*(double(OI_crop1)))));%/(sum (nonzeros(double(cyt_mask))));
        fcell1 = mean(mean(nonzeros((double(C_mask)).*(double(OI_crop1)))));%sum (nonzeros(double(C_mask).*(double(OI_crop1))))/(sum (nonzeros(double(C_mask))));
        
        fnuc2 = mean (mean(nonzeros(double(N_mask).*(double(OI_crop2)))));%/(sum (nonzeros(double(N_mask))));
        fcyt2 = mean (mean(nonzeros(double(cyt_mask).*(double(OI_crop2)))));%/(sum (nonzeros(double(cyt_mask))));
        fcell2 = mean (mean(nonzeros(double(C_mask).*(double(OI_crop2)))));%/(sum (nonzeros(double(C_mask))));
        

        % Saving the mean fluorescence measurement using the regionprops
        MCellF1(TT(cellID,2),TT(cellID,1)) = fcell1;
        MnucF1(TT(cellID,2),TT(cellID,1)) = fnuc1;
        McytF1(TT(cellID,2),TT(cellID,1)) = fcyt1;
        
        MCellF2(TT(cellID,2),TT(cellID,1)) = fcell2;
        MnucF2(TT(cellID,2),TT(cellID,1)) = fnuc2;
        McytF2(TT(cellID,2),TT(cellID,1)) = fcyt2;
        
        % Saving the total fluorescence intensities
        Fcell1(TT(cellID,2),TT(cellID,1)) = sum (nonzeros(double(C_mask).*(double(OI_crop1))));
        Fnuc1(TT(cellID,2),TT(cellID,1)) = sum (nonzeros(double(N_mask).*(double(OI_crop1))));
        Fcyt1(TT(cellID,2),TT(cellID,1))= sum (nonzeros(double(cyt_mask).*(double(OI_crop1))));
        
                
        Fcell2(TT(cellID,2),TT(cellID,1)) = sum (nonzeros(double(C_mask).*(double(OI_crop2))));
        Fnuc2(TT(cellID,2),TT(cellID,1)) = sum (nonzeros(double(N_mask).*(double(OI_crop2))));
        Fcyt2(TT(cellID,2),TT(cellID,1)) = sum (nonzeros(double(cyt_mask).*(double(OI_crop2))));

        % Saving the ratios
        rNF_cellF1 (TT(cellID,2),TT(cellID,1)) = Fnuc1(TT(cellID,2),TT(cellID,1))/Fcell1(TT(cellID,2),TT(cellID,1));
        rNf_cellf1 (TT(cellID,2),TT(cellID,1)) = MnucF1(TT(cellID,2),TT(cellID,1))/MCellF1(TT(cellID,2),TT(cellID,1));     
        
        rNF_cellF2 (TT(cellID,2),TT(cellID,1)) = Fnuc2(TT(cellID,2),TT(cellID,1))/Fcell2(TT(cellID,2),TT(cellID,1));
        rNf_cellf2 (TT(cellID,2),TT(cellID,1)) = MnucF2(TT(cellID,2),TT(cellID,1))/MCellF2(TT(cellID,2),TT(cellID,1));     

        
    end
    clear TT id cellN
    % SAVE THE SEGMENTED OVERLEY WITH CELL NUMBER
    MSIT (:,:,:,imageID) = SIT;
        
end
clear T counter
cd (resultFolder);
xlswrite ([stage_name,'_RatioTotal.xlsx'],rNF_cellF1, 'Total_GFP-RelA_fluo_ratio')
xlswrite ([stage_name,'_RatioTotal.xlsx'],rNF_cellF2, 'Total_mScarlet-cRel_fluo_ratio')

xlswrite ([stage_name,'_RatioMean.xlsx'],rNf_cellf1, 'Mean_GFP-RelA_fluo_ratio')
xlswrite ([stage_name,'_RatioMean.xlsx'],rNf_cellf2, 'Mean_mScarlet-cRel_fluo_ratio')

save ([stage_name,'Ratio.mat'],'rNF_cellF1','rNf_cellf1','rNF_cellF2','rNf_cellf2')

xlswrite ([stage_name,'TotalFluorescence.xlsx'],Fcell1, 'CellTotalFluo_GFP-RelA')
xlswrite ([stage_name,'TotalFluorescence.xlsx'],Fcell2, 'CellTotalFluo_mScarlet-cRel')

xlswrite ([stage_name,'TotalFluorescence.xlsx'],Fnuc1, 'NucTotalFluo_GFP-RelA')
xlswrite ([stage_name,'TotalFluorescence.xlsx'],Fnuc2, 'NucTotalFluo_mScarlet-cRel')

xlswrite ([stage_name,'TotalFluorescence.xlsx'],Fcyt1, 'CytTotalFluo_GFP-RelA')
xlswrite ([stage_name,'TotalFluorescence.xlsx'],Fcyt2, 'CytTotalFluo_mScarlet-cRel')

save([stage_name,'TotalFluorescence.mat'],'Fcell1','Fnuc1','Fcyt1','Fcell2','Fnuc2','Fcyt2');

xlswrite ([stage_name,'MeanFluorescence.xlsx'],MCellF1, 'CellMeanFluo_GFP-RelA')
xlswrite ([stage_name,'MeanFluorescence.xlsx'],MnucF1, 'NucMeanFluo_GFP-RelA')
xlswrite ([stage_name,'MeanFluorescence.xlsx'],McytF1, 'CytMeanFluo_GFP-RelA')

xlswrite ([stage_name,'MeanFluorescence.xlsx'],MCellF2, 'CellMeanFluo_mScarlet-cRel')
xlswrite ([stage_name,'MeanFluorescence.xlsx'],MnucF2, 'NucMeanFluo_mScarlet-cRel')
xlswrite ([stage_name,'MeanFluorescence.xlsx'],McytF2, 'CytMeanFluo_mScarlet-cRel')
save([stage_name,'MeanFluorescence.mat'],'MCellF1','MnucF1','McytF1','MCellF2','MnucF2','McytF2');

xlswrite ([stage_name,'Area.xlsx'],ACell,'CellArea')
xlswrite ([stage_name,'Area.xlsx'],ANuc,'NuclearArea')
xlswrite ([stage_name,'Area.xlsx'],Acyt,'CytoArea')
save([stage_name,'Area.mat'],'ACell','ANuc','Acyt');

% SAVING THE GIF FILE
save_3D_4D_matrix_as_gif ([stage_name,'overlay','.gif'],MSI);
save_3D_4D_matrix_as_gif ([stage_name,'overlay_withCellNum','.gif'],MSIT);

cd(currentFolder);      % Changing directory to main folder again

clear ACell ANuc Acyt MCellF1 MnucF1 McytF1 MCellF2 MnucF2 McytF2 Fcell1 Fnuc1 Ccyt1 Fcell2 Fnuc2 Fcyt2 rNF_cellF1 rNf_cellf1 rNF_cellF2 rNf_cellf2
       
end



