function[redness]=redlevel(image,threshold)
red=image(:,:,1);
blue=image(:,:,2);
green=image(:,:,3);
redness = (max(0,(red - (blue/2 + green/2))-threshold));
end