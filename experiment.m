screen=["lcd","kindle"];
trial=[1,2];
lens=[3,1,2];
isLens=["in path","out of the way"];
period=[2,4];
orientation=['v','h'];




%%
for a=1:2
    dialogwait("Set screen to "+screen(a));
   for b=1:2
       for c=1:3
           dialogwait("Trial "+trial(b)+" | "+"Insert lens "+lens(c));
           for d=1:2
                   dialogwait("Trial "+trial(b)+" | "+"Make sure lens is "+isLens(d));
               for e=1:2
                   for f=1:2
                          dialogwait("Trial "+trial(b)+" | Take pic of "+"Period "+period(e)+", Orientation: "+orientation(f));
                   end
               end
           end
       end
   end
end

%%
function dialogwait(name)
    d = dialog('Position',[300 300 500 150],'Name',name);

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