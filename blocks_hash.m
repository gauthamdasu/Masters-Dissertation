function [ ] = blocks_hash( blck,total_blocks )
%here blck is the no of expandable blocks and total_blocks is the no of
%blocks of the image
%from list of expandable or non-exp blocks for each block pixel values
% have the sha-256 algorithm on it.
%blcks are the no of expandable or non expandable blocks.
%create any array which has the hash values of the 16 pixels
q=1
j=1
blcks=0
var_blk=[]
%p=numel(blck(:,1))
%for p1 = 1:length(blck(:,1))
 %   p=blck(:,j)
for i =1:length(blck(:,1))
    p=blck(i,1)
 %blck(:,:)%=blcks;
  %  blcks    
    %varaible for getting the block
     if p~=92   
        var_blck=reshape(total_blocks(:,:,p), 1, []);  
     end%var_blck   
      qp=sha256(var_blck);
       %qp=char(qp); 
       %p=sha256(var_blck(i))
       qp
       %hash1(i,:,p)= qp;    
 end
    % 'sai'
end