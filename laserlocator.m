laser=imread('lasers.png');
[center,redness]=chromacenter(laser);
%laser2=w2b(laser);
imshow(laser);
hold on
plot(center(2),center(1),'g*');
 

function[center,redness]=chromacenter(image)
center=[0,0];
x=0;
y=0;
RED=0;
bounds=size(image);
localred=zeros(bounds);
localred=redlevel(image);
RED=sum(localred(:));

for i=1:bounds(1)
    for j=1:bounds(2)
        x(i,j)=double(localred(i,j)).*i;
        y(i,j)=double(localred(i,j)).*j;
    end
end
num=[sum(x(:)),sum(y(:))]
center=num./RED
redness=localred;
end


% 
% 
% function[blackbackground]=w2b(image)
% white=[255,255,255];
% blackbackground=zeros(size(image));
% for i=1:size(image,1)
%     for j=1:size(image,2)
%         for k=1:3  
%          if(image(i,j,k)~=255)
%              blackbackground(i,j,k)=image(i,j,k)
%          end
%         end
%     end
% end
% end