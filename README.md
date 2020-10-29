# Quadratic Image Filter (Second order Volterra Filter)
Quadratic image filter is a subclass of Volterra filters which is truncated up to second degree terms. This repository provides GNU Octave files for determining the weights of quadratic image filter using optimization approach.  The training algorithm used here is Differential Evolution. A syntetic image is used for training. In order to run the files on GNU Octave, optim and image processing packages are needed to be installed. Also, imfilt_quad_gray.c file needs to be compiled to obtain mex file. After running below command you may need to restart Octave.

mkoctfile --imfilt_quad_gray.c


Example Results:
Note that various results can be obtained according to training images, test images and training parameters such as population size, number of iterations and other parameters of optimization algorithm.


![alt text](/test/results1.jpg)

![alt text](/test/results2.jpg)



This code is a part of below studies. Please cite them if you find the code useful for your studies.

@article{uzun2018accelerated,
  title={An Accelerated Method for Determining the Weights of Quadratic Image Filters},
  author={Uzun, S{\"u}leyman and Akg{\"u}n, Devrim},
  journal={IEEE Access},
  volume={6},
  pages={33718--33726},
  year={2018},
  publisher={IEEE}
}


https://ieeexplore.ieee.org/document/8361424


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

https://www.spiedigitallibrary.org/journals/Journal-of-Electronic-Imaging/volume-28/issue-3/033036/Accelerated-method-for-the-optimization-of-quadratic-image-filter/10.1117/1.JEI.28.3.033036.short?SSO=1


@inproceedings{uzun2018literature,
  title={A Literature Review on Quadratic Image Filters},
  author={Uzun, S{\"u}leyman and Akg{\"U}n, Devrim},
  booktitle={2018 2nd International Symposium on Multidisciplinary Studies and Innovative Technologies (ISMSIT)},
  pages={1--5},
  year={2018},
  organization={IEEE}
}

https://ieeexplore.ieee.org/document/8567038



