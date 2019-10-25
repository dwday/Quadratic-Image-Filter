# Quadratic-Image-Filter
Quadratic image filter is a sub class of Volterra filters which is truncated to secon degree. This repository provides GNU Octave files for determining weights of quadratic image filter using a training image.  The training algorithm used here is Differential Evolution. In order to run the files on GNU Octave, optim and image processing packages are needed to be installed. Also, imfilt_quad_gray.c file needs to be compiled to obtain mex file. After running below command you may need to restart octave.

mkoctfile --imfilt_quad_gray.c


Example Results:
Note that various results can be obtained according to training images, test images and training parameters such as population size, number of iterations and other parameters of optimization algorithm.


![alt text](/test/results1.png)

![alt text](/test/results2.png)



This code is a part of below works. Please cite below works if you find it useful.

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
