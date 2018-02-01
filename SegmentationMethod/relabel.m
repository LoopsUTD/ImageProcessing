function[imseg3]=relabel(imseg2)
labels=unique(imseg2);
imsz = size(imseg2);
imht = imsz(1);
imwd = imsz(2);
imseg3 = imseg2;
for i = 1:imht
    for j = 1:imwd
        for x=2:size(labels)
            if (imseg3(i,j)==labels(x))
                imseg3(i,j)=x-1;
            end
        end
    end
end
end