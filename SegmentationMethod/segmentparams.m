function [ label,area,cx,cy,orientation] = segmentparams( img,label )
area=getmoment(img,label,0,0);
cx = getmoment(img,label,1,0)/area;
cy = getmoment(img,label,0,1)/area;
c20=centmoment(img,label,cx,cy,2,0);
c11=centmoment(img,label,cx,cy,1,1);
c02=centmoment(img,label,cx,cy,0,2);
orientation = rad2deg(.5*atan2(2.*c11,(c20-c02)));
end

