%%

%filename='testAnimated.gif';

orientation="H";

%%
xsize=1280;
ysize=720;
image=zeros(ysize,xsize);
%%
period=10.0;                     % This is now how often a green pixel appears - 1 in [period]
% dutycycle=0.5;                % used for alternating bars
% cutoff=period*(1-dutycycle);  % used for alternating bars
cutoff=1.0;
nImages=1;
colorvect=[0,255,0];
%%
   h= figure;

   
for idx=1:nImages
    image=zeros(ysize,xsize);
    k=idx-1;
    for i=1:1:ysize  
     k=k+1;
         if k<=cutoff
             m = 1;
             for j=1:1:xsize
                 m=m+1;
                 if m<=cutoff
                     image(i,j,1:3)=ones(1,1).*colorvect;
                 end
                 if m==period
                     m=0;
                 end
             end
          % image(i,:,1:3)=ones(xsize,1).*colorvect;  % from when this code
          % only made horizontal lines
         end
         if k==period
             k=0;
         end
    end

imshow(image)
frame=getframe(h);
im{idx}=frame2im(frame);
end

imwrite(image,'TestImages/10px.png');


%%
%%
% for idx = 1:nImages
%     [A,map] = rgb2ind(im{idx},256);
%     if idx == 1
%         imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.1);
%     else
%         imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.1);
%     end
% end
