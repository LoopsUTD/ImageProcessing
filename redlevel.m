function[redness]=redlevel(image,x,y)
red=image(x,y,1);
blue=image(x,y,2);
green=image(x,y,3);
redness = max(0, red - (blue/2 + green/2));
end