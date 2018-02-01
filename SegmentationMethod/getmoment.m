function [ moment ] = getmoment( img,label,p,q )
imsz = size(img);
imht = imsz(1);
imwd = imsz(2);
moment = 0;
for i = 1:imht
    for j = 1:imwd
       if img(i,j) == label
           moment = moment + j.^p*i.^q;
       end
    end
end
end

