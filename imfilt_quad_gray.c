#include "mex.h"
/*
Quadratic image filter
*/
void imfilt_quad_gray(  unsigned char *inputImage,
                        unsigned char *outputImage,
                        double *W,
                        mwSize nW, 
                        mwSize *dims)
{
    mwSize row,col;
    mwSize nrows=dims[0];
    mwSize ncols=dims[1];
    mwSize i,j;
    double pix; 
    double frame[9];
    int c=0;   
    for (row=1;row<(nrows-1);row++){ //borders are ignored
        for (col=1;col<(ncols-1);col++){            
            pix=0;          
            c=0;
            // linear -------------------------------          
            for (j=0;j<3;j++){
                for (i=0;i<3;i++){
                    frame[c]=(double)(inputImage[nrows*(col-1+i)+(row-1+j)])/255.0;
                    pix = pix + W[c]*frame[c]; 
                    c++;
                }
            }     
            // quadratic-------------------------------------
            c=9;           
            for ( i=0;i<(9);i++){
				      for (j=i;j<(9);j++){					
					          pix = pix+ W[c]*frame[i]*frame[j];                 
					        c++;
				      }
			      }	
            pix=pix*255;
            if (pix<=0.0) pix=0.0;
            if (pix>=255.0) pix=255.0;       
            outputImage[nrows*col+row]=(unsigned char)pix;           
        }
    }       
}
//-------------------------------------------------------------------------
/* Gateway for imfilt_quad function*/
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[])
{
    unsigned char *inputImage,*inputImageC;      
    unsigned char *outputImage;          
    double *W;
    mwSize ncols,nrows,ndim;              
    mwSize nW;
    mwSize *dims;
    mwSize *wdims;
    int i=0;
    inputImage = (unsigned char *)mxGetPr(prhs[0]);
    W = (double *)mxGetPr(prhs[1]);
    /* dimensions of input image */
    ncols = mxGetN(prhs[0]);
    nrows = mxGetM(prhs[0]);
    nW=mxGetN(prhs[1]);
    /* output image */
    ndim = mxGetNumberOfDimensions(prhs[0]);
    dims = mxGetDimensions(prhs[0]);    
    wdims = mxGetDimensions(prhs[1]);
    plhs[0] = mxCreateNumericArray(ndim, dims,mxUINT8_CLASS, mxREAL);
    /* get a pointer to the real data in the output matrix */
    outputImage = (unsigned char *)mxGetPr(plhs[0]);
    /* call the computational routine */
    imfilt_quad_gray(inputImage,outputImage,W,wdims[0],dims);
}