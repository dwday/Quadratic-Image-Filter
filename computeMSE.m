function MSEresult =computeMSE(XA,XB)
  %Compute Mean Squared Error
  %MSEresult =computeMSE(Xnoisy,Xorg)
  %inputs  : XA and XB are the input images
  %outputs : Mean Squared Error
  %Assumptions:
  % -image sizes are equal
  % -Image border lines are ignored  
  
  [sat,sut,z]=size(XA);
  MSEresult=sum(sum(sum((double(XA([2:(sat-1)],[2:(sut-1)],: ))...
      -double(  XB([2:(sat-1)],[2:(sut-1)],: ))).^2)))/((sat-2)*(sut-2)*z);
end