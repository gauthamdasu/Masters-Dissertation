function [ BlFeVec ] = BlockFeatureVector( blck,total_blocks )
%here blck is the no of expandable blocks and total_blocks is the no of
%blocks of the image
%from list of expandable or non-exp blocks for each block pixel values
% have the sha-256 algorithm on it.
%blcks are the no of expandable or non expandable blocks.
%create any array which has the hash values of the 16 pixels
bfv=[];
%q=1;
%j=1;
BlFeVec=[];
blcks=0;
var_blck=[];
%p=numel(blck(:,1))
%for p1 = 1:length(blck(:,1))
 %   p=blck(:,j)
for i =1:length(blck(:,1))
    p=blck(i,1);
 %blck(:,:)%=blcks;
  %  blcks    
    %varaible for getting the block
     var_blck=reshape(total_blocks(:,:,p), 1, []);  
     %var_blck   
      hash=sha256(var_blck);%The predetermined set of pixels’ at positions
      %1,3,6,9,11,16  values in the current block is used to index the
      %current hash value Hi, and BFVi
      bfv(1)=hash(1);
      bfv(2)=hash(3);
      bfv(3)=hash(6);
      bfv(4)=hash(9);
      bfv(5)=hash(11);
      bfv(6)=hash(16);
      %hash
       BlFeVec(i,:)=[p bfv];
       
 end
    % 'sai'
end

