function [ centralmoment ] = centmoment(img,label,cx,cy,p,q)
imsz = size(img);
imht = imsz(1);
imwd = imsz(2);
moment = 0;
for i = 1:imht
    for j = 1:imwd
       if img(i,j) == label
           centralmoment = (j - cx).^p.*(i-cy).^q;
       end
    end
end
end

