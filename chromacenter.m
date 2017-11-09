function[center,colorness]=chromacenter(image,threshold,color)
x=0;
y=0;
bounds=size(image);
localred=colorlevel(image,threshold,color);
RED=sum(localred(:));

for i=1:bounds(1)
    for j=1:bounds(2)
        x(i,j)=double(localred(i,j)).*i;
        y(i,j)=double(localred(i,j)).*j;
    end
end
num=[sum(x(:)),sum(y(:))];
center=num./RED;
colorness=localred;
end
