function[segpars]=getallseginfo(img)
labels=unique(img);
for i=2:size(labels);
     [label,area,cx,cy,orientation] = segmentparams(img,labels(i));
     segpars(i-1,:)= [label,area,cx,cy,orientation];
end
end