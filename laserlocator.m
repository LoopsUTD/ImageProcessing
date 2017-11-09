laser=imread('laser2.png'.png');
color ='r';
[center,redness]=chromacenter(laser,64,color);
imshow(laser);
hold on
plot(center(2),center(1),'g*');
 hold off
%find center of brightest spot
%characterize shape change of spot


