laser=imread('lasers.png');
center=chromacenter(laser);
%laser2=w2b(laser);
imshow(laser);
hold on
plot(center,'g*');
 

function[center]=chromacenter(image)
center=[0,0];
x=0;
y=0;
RED=0;
bounds=size(image);
for i=1:bounds(1)
    for j=1:bounds(2)
        localred=redlevel(image,i,j);
        RED=RED+localred;
        x=x+localred*i;
        y=y+localred*j;
    end
end
num=[x,y];
center=num/RED;
end




function[blackbackground]=w2b(image)
white=[255,255,255];
blackbackground=zeros(size(image));
for i=1:size(image,1)
    for j=1:size(image,2)
        for k=1:3  
         if(image(i,j,k)~=255)
             blackbackground(i,j,k)=image(i,j,k)
         end
        end
    end
end
end