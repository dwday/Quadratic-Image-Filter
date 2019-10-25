# Quadratic-Image-Filter
GNU Octave files for training and testing quadratic image filter. The training algorithm used here is Differential Evolution.
In order to run the files on GNU Octave, optim and image processing packages are needed to be installed.


imfilt_quad_gray.c file needs to be compiled. After running below command you may need to restart octave.
mkoctfile --imfilt_quad_gray.c

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
