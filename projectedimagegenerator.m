%%

%filename='testAnimated.gif';

orientation="H";

%%
xsize=1280;
ysize=720;
image=zeros(ysize,xsize);
%%
period=16.0;                     % This is now how often a red pixel appears - 1 in [period]
% If possible, select a period of 3n+1, where n is an integer
%step=floor(period/3);
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
            m = 0;
            for j=1:1:xsize
                m=m+1;
                if m<=cutoff
                    image(i,j,1:3)=[255,0,0];
                    if j+floor(period/3)<=xsize
                        image(i,j+floor(period/3),1:3)=[0,255,0];
                        if j+floor(2*period/3)<=xsize
                            image(i,j+floor(2*period/3),1:3)=[0,0,255];
                        end
                    end
                end
                if m==period
                    m=0;
                end
            end
          % image(i,:,1:3)=ones(xsize,1).*colorvect;  % from when this code
          % only made horizontal lines
        end
        if k==floor(period/2)
            k=0;
        end
    end

imshow(image)
frame=getframe(h);
im{idx}=frame2im(frame);
end

imwrite(image,'TestImages/16pxRGB.png');


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
