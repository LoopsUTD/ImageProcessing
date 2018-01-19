function imbw = calvthresh(imgr,thresh)
imsz = size(imgr);
imht = imsz(1);
imwd = imsz(2);
for i = 1:imht
    for j = 1:imwd
        if imgr(i,j) < thresh
            imbw(i,j) = 255;
        else
            imbw(i,j) = 0;
        end
    end
end
end