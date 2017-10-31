intensity=1;
freq=0.21;

curve=imread('hilbert.png');
curve=imbinarize(curve,0.5);
edges=edge(curve,'Sobel',0);
base=curve;

curve=deviate(freq,intensity,curve);
curve=curve(1:500,:)-base;
imshow(curve);
function[dev_curve]=deviate(frequency,intensity,curve)
for x=1:495
 
    if(rand<frequency)
       y=ceil(rand*500);
       dely=ceil(rand*(500-y));
       mag=ceil(rand*intensity);
       thickness=ceil(rand*intensity/2);
       delx=mag*ones(dely,1);
       width=length(delx);
       for i=1:width
           delx(i)=ceil(delx(i)*(i-width/2)^2);
       end
       delx=ceil(delx*mag/max(delx));
       for dy=1:dely-1
        dx=delx(dy);
        for j=0:thickness
            curve(x+dx+(thickness-j),y+dy)= curve(x+(thickness-j),y+dy);
        end
       end
    end
    dev_curve=curve;
end
end
