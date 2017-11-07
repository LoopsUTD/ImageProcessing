colors = [0 2 0; 0 0 0];
inds = 1:100;
color_inds = 1+mod(inds,2);
r = colors(color_inds,1);
g = colors(color_inds,2);
b = colors(color_inds,3);
lines = imrotate(cat(3,r,g,b),90);
imagesc(lines);
