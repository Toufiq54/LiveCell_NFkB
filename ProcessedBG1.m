function [bg] = ProcessedBG1 (Input_image)
% This function will calculate the processed background of individual image
% frame obtained from LSM 880. First the forground object will be separated
% from the image frame using Otsu method. The binarization parameter will
% be lower by half of that obtained by graythresh function to separate out
% all the forground objects.
M = medfilt2 (Input_image);
bg = (quantile(M(:),0.1));
% B = imbinarize (Input_image,1.5*graythresh(Input_image));
% B = imfill (B,'holes');
% B = bwareaopen(B,10);
% C = imcomplement (B);
% B = double(B);
% B(B==1)=nan;
% BGmask = B+double(C);
% bg = nanmean(nanmean(double(BGmask).*(double(Input_image))));
end