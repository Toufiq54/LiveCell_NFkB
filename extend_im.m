function [output_image] = extend_im(imgMain,boundingBoxDims,Num_pixel)
% This function will extend the dimension of cropped image to given number
% of pixel in all directions. It can detect the edges while extending the 
% cropped image. If it finds the extension will excede the dimension of 
% actual image, it will extend upto the maximum.
% output_image = output of function. gives the extended image
% Input arguments: img = cropped image
%                : Num_pixel = Number of pixel will be extended in each
%                directions
%   Detailed explanation goes here

    L=floor(boundingBoxDims(:,1))+1; % first left column of cell bounding box 
    T=floor(boundingBoxDims(:,2))+1;
    W=boundingBoxDims(:,3);
    H=boundingBoxDims(:,4);
    if L<=0.5
        L=1;
    else
        L=L;
    end
    if T<=0.5
        T=1;
    else
        T=T;
    end
    [r,c]=size(imgMain);
    if L+W>=c
        LL=c;
    else
        LL=L+W;
    end
    if T+H>=r
        TT=r;
    else
        TT=T+H;
    end
              

   
            if L-Num_pixel<=1
                LL=1;
            else
                LL=L-Num_pixel;
            end
            
            if T-Num_pixel<=1
                TT=1;
            else
                TT=T-Num_pixel;
            end
            
            if LL+W+2*Num_pixel-1>=c
                LR=c;
            else
                LR=LL+W+2*Num_pixel-1;
            end
            if TT+H+2*Num_pixel-1>=r
                TB=r;
            else
                TB=TT+H+2*Num_pixel-1;
            end
            
  output_image = imgMain(TT:TB,LL:LR);         
end

