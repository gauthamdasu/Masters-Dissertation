function [ embeded_blck ] = Embedd_MDE( BFV,expand_blcks,block )
%This function embedds a 6 bit information in the first two expandable
%blocks of the current block of the expnadable blocks.
%inputs of the function are bfv blockno and that particular block

   % v0 ¼ u0 ş u1 ş u2 ş u34
%~v1 ¼ 2 v1 ş b1
%~v2 ¼ 2 v2 ş b2
%~v3 ¼ 2 v3 ş b3
%blck_fea=[];
%from the expandable_blcks we take the blocks which are expandable into
%another array%array for expandable sub-blocks.
embeded_blck=block;
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
blck_fea=BFV(1,2:end);
%embeded_blck;
[Blocks,~]=divideIntoBlocks(block,2);
%v,count
embeded_blck1=zeros([2 2]);
if count >2
    break
end
u=Blocks(:,:,v);
    vp=zeros([2 2]);%matrix for v
    sum(u(:))
    vp(1,1)=sum(u(:))/4; 
    vp(1,1)
    vp(1,2)=u(1,2)-u(1,1);
    vp(2,1)=u(2,1)-u(1,1);
    vp(2,2)=u(2,2)-u(1,1);
   
    embeded_blck12(1,1)=vp(1,1);
b1=blck_fea(j);
    embeded_blck12(1,2)=2*vp(1,2)+b1;
b2=blck_fea(j+1);
    embeded_blck12(2,1)=2*vp(2,1)+b2;
b3=blck_fea(j+2);
    embeded_blck12(2,2)=2*vp(2,2)+b3;  
j=j+1;
embeded_blck12
%l,m,n,o;   
embedded_blck1(1,1)=(vp(1,1)-(vp(1,2)+vp(2,1)+vp(2,2))/3);
embedded_blck1(1,1);
embedded_blck1(1,2)=embedded_blck1(1,1)+embeded_blck12(1,2);
embedded_blck1(2,1)=embedded_blck1(1,1)+embeded_blck12(2,1);
embedded_blck1(2,2)=embedded_blck1(1,1)+embeded_blck12(2,2);
embedded_blck1;
l;m;n;o;
embeded_blck(l:m,n:o);
embeded_blck(l:m,n:o)=embedded_blck1;
   % embeded_blck(l:m,n:o)
    end
end

end
