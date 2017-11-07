function[redness]=redlevel(image)
red=image(:,:,1);
blue=image(:,:,2);
green=image(:,:,3);
redness = (red - (blue/2 + green/2));
end