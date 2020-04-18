im=dicomread('MR000070.dcm');
%im=imread('re.jpg');
%im=rgb2gray(im);
% loop over all rows and columns
for ii=5:33
    for jj=1:23
        % get pixel value
        pixel=im(ii,jj);
          % check pixel value and assign new value
          new_pixel=256;
          %else
           %   new_pixel = pixel;
          %end
          % save new pixel value in thresholded image
          image_thresholded(ii,jj)=new_pixel;
      end
  end
% display result
figure()
subplot(1,2,1)
imshow(im,[])
title('original image')
subplot(1,2,2)
imshow(image_thresholded,[])
title('thresholded image')