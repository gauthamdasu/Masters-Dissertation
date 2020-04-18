function [ img1 ] = blocksToimg( exp,nonexp,exp_blocks,all_blocks,BlockSize)
%image construction
img1 = zeros([256 256]);
TOTAL_BLOCKS =4096;
%dividedImage = zeros([BlockSize BlockSize TOTAL_BLOCKS]);
row = 1;
col = 1;
i=1;
j=1;
try
    for count=1:TOTAL_BLOCKS
        %i,count,exp(i,1)
      %k=exp(count,1);
      if exp(i,1)==count  
          %fprintf('in exp %d\n',count)
        
      img1(row:row+BlockSize-1,col:col+BlockSize-1)=exp_blocks(:,:,count); 
          i=i+1;
      end
      %else
      if nonexp(j,1)==count
          %fprintf('in non_exp %d\n',count)
      img1(row:row+BlockSize-1,col:col+BlockSize-1)=all_blocks(:,:,count); 
         j=j+1;        
    
      end
       col = col + BlockSize;
        if(col >= size(img1,2))
            col = 1;
            row = row + BlockSize;
            if(row >= size(img1,1))
                row = 1;
            end
           
           
        end
       
       
     
end
img1=uint8(img1);
end



%fprintf('%d',TOTAL_BLOCKS);



