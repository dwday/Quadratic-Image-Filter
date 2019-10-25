% ------------------------------------------------------------------------------
% Program for training weights of quadratic filter
% This program finds the weigths of quadratic image filter
% using Differential Evolution algorithm
%-------------------------------------------------------------------------------
function quad_filt_demin  
  %https://octave.sourceforge.io/packages.php
  pkg load optim
  pkg load image

  more off
  global Xorg Xnoisy
  % Arificial training image ---------------------------------------------------
  I=zeros(40,40,'uint8');
  I(1:10,1:10 )=0;   I(11:21,1:10 )=255;I(21:30,1:10 )=85;  I(31:40,1:10 )=170;
  I(1:10,11:20)=170; I(11:21,11:20)=85; I(21:30,11:20)=0;   I(31:40,11:20)=255;
  I(1:10,21:30)=85;  I(11:21,21:30)=170;I(21:30,21:30)=255; I(31:40,21:30)=0;
  I(1:10,31:40)=255; I(11:21,31:40)=0;  I(21:30,31:40)=170; I(31:40,31:40)=85;
  
  % training image from file----------------------------------------------------
  %I=imread('image\test_image1.tif');   
  Xorg=I;
  
  % Add noise to artificial traning image -----------------------
  Xnoisy= imnoise(Xorg,'gaussian' ,0.0,0.05);
  
  [sat,sut,z]=size(Xnoisy);  
  figure(1);imshow(I);title('original');
  figure(2);imshow(Xnoisy); title('noisy');

  % DE solver parameters -------------------------------------------------------
  ctl.XVmin    = -0.4*ones(1,54);  
  ctl.XVmax    =  0.4*ones(1,54);
  ctl.constr   = 1;
  ctl.NP       = 1000;
  ctl.F        = 0.70; 
  ctl.CR       = 0.80; 
  ctl.strategy = 12;
  ctl.refresh  = 1;
  ctl.VTR      = -Inf;
  ctl.tol      = 1.e-10;
  ctl.maxnfe   = Inf;
  ctl.maxiter  = 300;
  
  
  % Train quadratic filter weights ---------------------------------------------
  tic
  [Wf, obj_value, nfeval, convergence] = de_min(@fitnessImg, ctl);
  toc
  
  %disp(Wf')
  % Filter using trained filter weights ----------------------------------------
  ImFilt=imfilt_quad_gray(Xnoisy,Wf);

  %Display results -------------------------------------------------------------
  MSEnoisy =computeMSE(Xnoisy,Xorg);
  MSEfilt  =computeMSE(ImFilt,Xorg);             
  display(['Noisy image MSE    =' num2str(MSEnoisy)])              
  display(['Filtered image MSE =' num2str(MSEfilt)])             
  figure(1); imshow(Xorg);   title('original');
  figure(2); imshow(Xnoisy); title('noisy');
  figure(3); imshow(ImFilt); title('filtered');  
    
  %save weights to a file-------------------------------------------------------
  save params_quadfilt Wf ctl
 end

 
 
function MSEresult=fitnessImg(W)
  global Xorg Xnoisy
  [sat,sut,z]=size(Xorg);
  %Filter image
  ImFilt=imfilt_quad_gray(Xnoisy,W);
  %compute MSE
  MSEresult =computeMSE(ImFilt,Xorg);
end



 %{ 
This code is a part of below works. 
Please cite below works if you find it useful.

@article{uzun2018accelerated,
  title={An Accelerated Method for Determining the Weights of Quadratic Image Filters},
  author={Uzun, S{\"u}leyman and Akg{\"u}n, Devrim},
  journal={IEEE Access},
  volume={6},
  pages={33718--33726},
  year={2018},
  publisher={IEEE}
}

@article{uzun2019accelerated,
  title={Accelerated method for the optimization of quadratic image filter},
  author={Uzun, S{\"u}leyman and Akg{\"u}n, Devrim},
  journal={Journal of Electronic Imaging},
  volume={28},
  number={3},
  pages={033036},
  year={2019},
  publisher={International Society for Optics and Photonics}
}

@inproceedings{uzun2018literature,
  title={A Literature Review on Quadratic Image Filters},
  author={Uzun, S{\"u}leyman and Akg{\"U}n, Devrim},
  booktitle={2018 2nd International Symposium on Multidisciplinary Studies and Innovative Technologies (ISMSIT)},
  pages={1--5},
  year={2018},
  organization={IEEE}
}
}%
