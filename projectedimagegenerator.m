%%

%axis tight manual
filename='testAnimated.gif';

%%
xsize=800;
ysize=480;
image=zeros(ysize,xsize);
%%
period=16.0;
dutycycle=0.125;
cutoff=period*(1-dutycycle);
nImages=period;

%%
   h= figure;

for idx=1:nImages
    image=zeros(ysize,xsize);
    k=idx-1;
    for i=1:1:xsize  
     k=k+1;
         if k<=cutoff
          image(:,i)=ones(ysize,1);
         end

         if k==period
             k=0;
         end

    end

imshow(image)
frame=getframe(h);
im{idx}=frame2im(frame);
end

%%
for idx = 1:nImages
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.1);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
end
