    function [Extracted_block,fullExtractedImage,WATER_MARKED_Extracted_IMAGE] = extract( watermarkedimg,exp,nonexp )
%This is an algorithm extraction of the embedding.
%  This function first takes the input image takes the info of the dicom
%file and stores in a struct,next resizes the image,segment the image to
%border and center image area, divides the CIA to blocks of 4X4 and inturn divide the blocks in to 2x2
% and future procedes with the algorithm
Extracted_block=zeros([4 4]);
v=zeros([2 2]);
flag=1;%flag for getting count of the blocks
conc=[];%for concatinate values in the location map
hash=[];%array which has the hash values of the expandable pixels.
ind=1;
ind1=1;
vc=1;
row = 1;
col = 1;
blocks=zeros([4 4 4096]);
BlockSize=4;
final_img=zeros([268 268]);
B=zeros(4096,1);
C=zeros(4096,1);
im1=zeros([256 256]);
BlFeVec=[];
[BA,CIA]=segment_extract(watermarkedimg,268,6);

[Blocks,tot_blocks]=divideIntoBlocks(CIA,4);
j=1;
Blocks=uint8(Blocks);
for i=1:tot_blocks%for each 4X4 get 2X2 blocks
    if j>length(exp)
    break
    end
    p=exp(j,1); 
    Extracted_block(:,:,p)=extract_MDE(exp(j,2:5),Blocks(:,:,p));
    j=j+1;
    
end
Extracted_block=uint8(Extracted_block);
for i=1:length(exp)
B(i)=exp(i,1);
end
for i=1:length(nonexp)
C(i)=nonexp(i);
end
WATER_MARKED_Extracted_IMAGE = blocksToimg(B,C,Extracted_block,Blocks,4); 
no_pix=6;
size=268;
fullExtractedImage(no_pix:size-(no_pix+1),no_pix:size-(no_pix+1))=WATER_MARKED_Extracted_IMAGE;
figure,imshow(WATER_MARKED_Extracted_IMAGE,[]),title('watermark Extracted Image');
 end