function [ BA , CIA ] = segment( a ,size,no_pix)
%  takes the input image which is dicomread a and gives border image and
%  cia
%returns BA and CIA
A=dicomread(a);
A=imresize(A,[size size]);
A=uint8(A);
CIA=A(no_pix:size-(no_pix+1),no_pix:size-(no_pix+1));
A(no_pix:size-(no_pix+1),no_pix:size-(no_pix+1))=255;
BA=A;
 %BA=A(size-3:,3:size-3);
%BA=A(3:size-3,size-3);
%BA=A(3,3:size-3);

%CIA=A-BA;
figure, imshow(BA,[]) ;title('Border Image');
figure, imshow(CIA,[]);title('Central Image');
end

