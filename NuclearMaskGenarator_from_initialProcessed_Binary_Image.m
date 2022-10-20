% This Script is written to generate the nuclear segmentation mask and save
% the nuclear mask as a .mat file from initial processed binary image from
% Fiji macro (Initial_Nuclear_Mask_Generation.ijm) saved in following
% folder --> C:\Users\rahmans4\Documents\fiji-win64\Fiji.app\Custom macros


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by: Shah Md Toufiqur Rahman
% Date: 11/7/2020
% Visiting Fellow
% Gene Regulation Section
% National Institute on Aging
% National Institute of Health
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear workspace
clc
clear
close all
%--------------------------------------------------------------------------
% Adding the directory of important function that will be used here.
addpath ('E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\Scripts');
%--------------------------------------------------------------------------
%==========================================================================
% --------------------Get Image directory----------------------------------
currentFolder = 'E:\rahmans4\EXPERIMENTAL DATA\NIA_Experiment\08.02.2022_iFibroblast_GR_TNF_LPS\images';
% make output directory
cd (currentFolder);

% Take input from the user how many stage position want to extract
stageNi = input ('Give the initial stage number:-->');
stageNf = input ('Give the final stage number:-->');

for i = stageNi:stageNf
    fname = ['Labels_s',num2str(i),'.tif'];
    info = imfinfo(fname);
    NumFrame = numel (info);
    disp(['Now processing  ',num2str(i),' stage position'])
    for imageID = 1:NumFrame
        img = imread (fname,imageID);
        img = bwareaopen(img,300);
        img = imfill(img,'holes');
%         img = imerode (img,strel('disk',1));
%         img = bwareaopen(img,20);
%         img = imdilate (img,strel('disk',1));
%         img = imfill (img,'holes');
%         img = bwareafilt (img,[20 10000]);
        
        % use watershed segmentation
        bw = img;
        bw2 = ~bwareaopen (~bw,10);
        D = - bwdist (~bw);
        Ld = watershed (D);
        bw2 = bw;
        bw2(Ld==0)=0;

        mask = imextendedmin (D,2.5);
        D2 = imimposemin (D,mask);
        Ld2 = watershed(D2);
        bw3 = bw;
        bw3(Ld2==0)=0;
        OutputImage  = bw3;
        
%         % Use circularity filter
%         st=regionprops(OutputImage,'area','Perimeter');
%         % Get areas and perimeters of all the regions into single arrays.
%         allAreas = [st.Area];
%         allPerimeters = [st.Perimeter];
%         % Compute circularities.
%         circularities = allPerimeters.^2 ./ (4*pi*allAreas);
%         % Find objects that have "round" values of circularities.
%         roundObjects = find(circularities < 4); % Whatever value you want.
%         % Compute new binary image with only the round objects in it.
%         binaryImage = ismember(OutputImage, roundObjects) > 0;
        
        
        
        NucMask (:,:,imageID) = OutputImage;
    end
    save (['Labels','_s',num2str(i),'.mat'],'NucMask')
    save_3D_matrix_as_gif(['Labels','_s',num2str(i),'.gif'],NucMask)
end


