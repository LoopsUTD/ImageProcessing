function[colorness]=colorlevel(image,threshold,color)
red=image(:,:,1);
blue=image(:,:,2);
green=image(:,:,3);
switch color
    case 'r'
        colorness = (max(0,(red - (blue/2 + green/2))-threshold));
    case 'g'
        colorness = (max(0,(green - (blue/2 + red/2))-threshold));
    case 'b'
        colorness = (max(0,(blue - (red/2 + green/2))-threshold));
    otherwise
        disp('Enter r, g or b characters');


end