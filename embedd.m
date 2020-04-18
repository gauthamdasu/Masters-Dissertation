    function [ compressed_lm,hash_lm,fullWatermarkedImage,WATER_MARKED_IMAGE] = embedd( dicom_img )
%This is the final function for the algorithm embedding.
%  This function first takes the input image takes the info of the dicom
%file and stores in a struct,next resizes the image,segment the image to
%border and center image area, divides the CIA to blocks of 4X4 and inturn divide the blocks in to 2x2
% and future procedes with the algorithm
v=zeros([2 2]);
flag=1;%flag for getting count of the blocks
exp=[];%array which contains the block which are expandable
nonexp=[];%array which contains the blocks which are not expandable
conc=[];%for concatinate values in the location map
hash=[];%array which has the hash values of the expandable pixels.
ind=1;
ind1=1;
fullWatermarkedImage=zeros([268 268]);
BFV=[];%block feature vectors for the 4x4 blocks
vc=1; %variable for concatinaition 
img=dicomread(dicom_img);
figure,imshow(img,[]);title('Original Image')
info=dicominfo(dicom_img);
img=treshold(dicom_img,268);%putting border to get BA and CIA array;
[BA,CIA]=segment_alg(dicom_img,268,6);
row = 1;
col = 1;
blocks=zeros([4 4 4096]);
BlockSize=4;
final_img=zeros([268 268]);
B=zeros(4096,1);
C=zeros(4096,1);
im1=zeros([256 256]);
BlFeVec=[];
[Blocks,tot_blocks]=divideIntoBlocks(CIA,4);
fprintf('Please wait watermarking in process:');
for i=1:tot_blocks%for each 4X4 get 2X2 blocks
    [Blocks2,tot]=divideIntoBlocks(Blocks(:,:,i),2);
    %MDE technique starts here
     for p=1:tot
         c=MDE_Technique(Blocks2(:,:,p));
         if c==1
             flag=flag+1;
            % flag
         end
        conc(vc)=c;
        vc=vc+1;
     end      %    array
    if flag>3
        exp(ind,:)=[i conc];
        %exp(ind,:)=conc;
        %flag=1;
         ind=ind+1;
    elseif flag<=3
        
        nonexp(ind1)=i;
    ind1=ind1+1;
    end 
    %getting the least significant bits code
   Q1=[];
    for i=1:length(nonexp)       
        Q1(i) = bitget(abs(nonexp(i)),1);
    end
    b = length(Q1);   
 nonexp=transpose(nonexp);   
    flag=1;
    vc=1;
end
Embedded_block=zeros([4 4 length(exp)]);
%we now input the pixel values of the expandable block to 
    %SHA-256 and get the output.
    %blocks are given as the input to a function and the hashes of the
    %pixel values are given back.
    for blck = 1 :4
        hash=sha256(blck);
    end
    BFV=BlockFeatureVector(exp,Blocks);
    row=1;
    col=1;
    for i=1:length(BFV)
       pq=BFV(i,1);
       for ll=1:length(exp(:,1))
        if exp(ll,1)==pq
        expbits=exp(i,2:end);
 Embedded_block(:,:,pq)=Embedd_MDE(BFV,expbits,Blocks(:,:,pq));
          end
        end
    end
    
%for non_exp blocks change the lsb to zero
for i1 =1:length(nonexp)
    j1=nonexp(i1);
    [blocks(:,:,j1),bfv]=set_bit_to_zero(j1,Blocks);
    BlFeVec(j1,:)=[j1 bfv];%block feature vector for non exp blocks
end
%we do the lsb substitution of the bfv in the current block of
%nonexpandable blocks
RES1=LSB_RES1(nonexp,Blocks);
%for i2=1:length(nonexp)
%pp=nonexp(i2);
%end
%eb=mat2gray(Embedded_block(:,:,:));
% imshow(im1,[])


for i=1:length(exp)
B(i)=exp(i,1);
end
for i=1:length(nonexp)
C(i)=nonexp(i);
end

WATER_MARKED_IMAGE = blocksToimg(B,C,Embedded_block,blocks,4);
  WATER_MARKED_IMAGE ;
  
no_pix=6;
size=268;
fullWatermarkedImage(no_pix:size-(no_pix+1),no_pix:size-(no_pix+1))=WATER_MARKED_IMAGE;
  figure,imshow(fullWatermarkedImage,[]),title('Almost watermarked1 Image');
  %arthmetic encoding
[compressed_lm,hash_lm]=arith_encode(exp(:,1))
%tot_blocks,exp;
diff_img=WATER_MARKED_IMAGE-CIA;
figure,imshow(diff_img,[]),title('Difference btw original and watermarked Image');
[psnr1,mse1]=psnr(CIA,WATER_MARKED_IMAGE);
fprintf('psnr value is %f\n',psnr1);
 end