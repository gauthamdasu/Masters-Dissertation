function [ embeded_blck ] = extract_MDE( expand_blcks,embedded_block )
%Takes the input as the 2x2 blocks and retains back the original value in
%the block.
%BFV,expand_blcks,
vp=zeros([2 2]);
org=zeros([2 2]);
  

embeded_blck=embedded_block;
embedded_blck1=zeros([2 2]);
embedded_blck12=zeros([2 2]);
j=1;
l=0;
m=0;
n=0;
o=0;
count=0;
for v=1:4
    if expand_blcks(v)==1  
       if v==1 
        l=1;m=2;n=1;o=2;
        count=count+1;      
       end
       if v==2
        l=1;m=2;n=3;o=4;
    count=count+1;  
        end			  
       if v==3
           count=count+1;  
         l=3;m=4;n=1;o=2;
       end			  
       if v==4
           count=count+1;  
          l=3;m=4;n=3;o=4;
       end  
%embeded_blck;
[Blocks,~]=divideIntoBlocks(embedded_block,2);
%v,count
Blocks;
embeded_blck1=zeros([2 2]);
pa=zeros([2 2]);
if count >2
    break
end
u=Blocks(:,:,v);   
    vp(1,2)=u(1,2)-u(1,1);
    vp(2,1)=u(2,1)-u(1,1);
    vp(2,2)=u(2,2)-u(1,1);
    vp(1,1)=u(1,1)+floor(sum(vp(2:4))/3);
    b1=bitget(vp(1,2),1);
    b2=bitget(vp(2,1),1);
    b3=bitget(vp(2,2),1);
    
    
    org(1,1)=vp(1,1);
    org(1,2)=vp(1,2)-b1;
    org(2,1)=vp(2,1)-b2;
    org(2,2)=vp(2,2)-b3; 
   
    pa(1,1)=org(1,1)-(sum(org(2:4))/4);
    pa(1,2)=org(1,2)+pa(1,1);
    pa(2,1)=org(2,1)+pa(1,1);
    pa(2,2)=org(2,2)+pa(1,1);
embeded_blck(l:m,n:o)=pa;
    end
end
end
