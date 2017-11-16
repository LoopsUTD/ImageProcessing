clc;

screen=["lcd","kindle"];
trial=[1,2];
lens=[3,1,2];
isLens=["in path","out of the way"];
period=[2,4];
orientation=['V','H'];  % Changed to capitals to match case of test image names - DM

figure;
H = gcf;

%%
for scr=1:1   % Changed to only lcd due to manual testing of kindle - DM
    dialogwait("Set screen to "+screen(scr));
   for trl=1:2
       for lns=1:3
           dialogwait("Trial "+trial(trl)+" | "+"Insert lens "+lens(lns));
           for isLns=1:2
                   dialogwait("Trial "+trial(trl)+" | "+"Make sure lens is "+isLens(isLns));
               for prd=1:2
                   for ornt=1:2
                       imshow(strcat(num2str(period(prd)),'px',orientation(ornt),'.png'),'InitialMagnification',100);    % If unusual zoom things start happening, remove the last two imshow() arguments
                       movegui(H,'center');
                       dialogwait("Trial "+trial(trl)+" | Take pic of "+"Period "+period(prd)+", Orientation: "+orientation(ornt));
                   end
               end
           end
       end
   end
end

close(H);

%%
function dialogwait(name)
    d = dialog('Position',[-800 300 500 150],'Name',name);

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String','Click the close button when you''re done.');

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','Close',...
               'Callback','delete(gcf)');
    uiwait(d);
end