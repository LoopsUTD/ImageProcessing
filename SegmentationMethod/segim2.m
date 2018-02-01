function [ imseg2 ] = segim2( imseg )
imsz = size(imseg);
imht = imsz(1);
imwd = imsz(2);
imseg2 = imseg;
%set neighboring pixel values to lowest from top left to bottom right
for i = 2:(imht-1)
    for j = 2:(imwd-1)
        
       if imseg2(i,j)>0
        neighbors = [imseg2(i,j-1),imseg2(i+1,j),imseg2(i,j+1),imseg2(i-1,j)];
        for k=1:4
           if neighbors(k)==0;
            neighbors(k)=max(neighbors(:));
           end
        end
        newlabel=min(neighbors);
        if imseg2(i,j)>newlabel
            imseg2(i,j)=newlabel;
            
        end
       end
       
    end
end
%set neighboring pixel values to lowest from bottom right to top left
for i = (imht-1):-1:2
    for j = (imwd-1):-1:2
       if imseg2(i,j)>0
        neighbors = [imseg2(i,j-1),imseg2(i+1,j),imseg2(i,j+1),imseg2(i-1,j)];
        for k=1:4
           if neighbors(k)==0;
            neighbors(k)=max(neighbors(:));
           end
        end
        newlabel=min(neighbors);
        if imseg2(i,j)>newlabel
            imseg2(i,j)=newlabel;
        end
       end
       
    end
end

%set neighboring pixel values to lowest from top right to bottom left to
%clean up lower left corners of penguins
for i = 2:(imht-1)
    for j = (imwd-1):-1:2
       if imseg2(i,j)>0
        neighbors = [imseg2(i,j-1),imseg2(i+1,j),imseg2(i,j+1),imseg2(i-1,j)];
        for k=1:4
           if neighbors(k)==0;
            neighbors(k)=max(neighbors(:));
           end
        end
        newlabel=min(neighbors);
        if imseg2(i,j)>newlabel
            imseg2(i,j)=newlabel;
        end
       end
       
    end
end
end

