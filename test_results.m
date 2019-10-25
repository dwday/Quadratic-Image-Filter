% ------------------------------------------------------------------------------
% Program for testing quadratic filter using trained coefficients
%-------------------------------------------------------------------------------
%load octave packages
pkg load optim
pkg load image
%more off
%clear all
%Read images
Xorg=imread('image\test_image1.png');
%Xorg=imread('image\4.2.03.tiff');

%two times filtering
second=1%0or 1

% Add Gaussian noise --------------------------------
Xnoisy= imnoise(Xorg,'gaussian' ,0.0,0.03);
figure(1);imshow(Xorg);title('original');
figure(2);imshow( Xnoisy);title('noisy');

% Quadratic filter ----------------------------------
load params_quadfilt
ImFiltQuad=Xnoisy;
ImFiltQuad(:,:,1)=imfilt_quad_gray(Xnoisy(:,:,1),Wf);
ImFiltQuad(:,:,2)=imfilt_quad_gray(Xnoisy(:,:,2),Wf);
ImFiltQuad(:,:,3)=imfilt_quad_gray(Xnoisy(:,:,3),Wf);

if second
  ImFiltQuad(:,:,1)=imfilt_quad_gray(ImFiltQuad(:,:,1),Wf);
  ImFiltQuad(:,:,2)=imfilt_quad_gray(ImFiltQuad(:,:,2),Wf);
  ImFiltQuad(:,:,3)=imfilt_quad_gray(ImFiltQuad(:,:,3),Wf);
end

figure(3);imshow(ImFiltQuad);title('Quadratic filtered');

% Median filter --------------------------------------
ImFiltMedian=Xnoisy;
ImFiltMedian(:,:,1)=medfilt2(Xnoisy(:,:,1),[3 3]);
ImFiltMedian(:,:,2)=medfilt2(Xnoisy(:,:,2),[3 3]);
ImFiltMedian(:,:,3)=medfilt2(Xnoisy(:,:,3),[3 3]);
figure(4);imshow(ImFiltMedian);title('Median filtered');

% Gaussian filter ------------------------------------
Wgauss=fspecial('gaussian',[3 3],0.8)
ImFiltGauss=imfilter(Xnoisy,Wgauss);         
figure(5);imshow(ImFiltGauss);title('Gaussian filtered');

% Compute MSE-----------------------------------------  
MSEnoisy =computeMSE(Xnoisy,Xorg);
MSEquad  =computeMSE(ImFiltQuad,Xorg);  
MSEmedian=computeMSE(ImFiltMedian,Xorg);  
MSEgauss =computeMSE(ImFiltGauss,Xorg);  

% Display MSE results---------------------------------    
display(['Noisy image MSE     =' num2str(MSEnoisy)])              
display(['Quadratic Filter MSE=' num2str(MSEmedian)]) 
display(['Median Filter MSE   =' num2str(MSEquad)])
display(['Gaussian Filter MSE =' num2str(MSEgauss)])
 
