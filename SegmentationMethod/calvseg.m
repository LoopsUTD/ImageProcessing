function imseg = calvseg(imbw)
imsz = size(imbw);
imht = imsz(1);
imwd = imsz(2);
x = 0;
imseg = zeros(imht,imwd);
for i = 1:imht
    for j = 1:imwd
        if imbw(i,j) == 255
            x = x + 1;
            imseg(i,j) = x;
        end
    end
end

end