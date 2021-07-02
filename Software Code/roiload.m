function [roi] = roiload(segment1,segment2,segment3,segment4,app)
p =1;
for j = 1 : length(segment1{1})
    imshow(segment1{1}{j})
    roi{p} = round(getPosition(imrect));
    p = p+1;
end
for j = 1 : length(segment2{1})
    imshow(segment2{1}{j})
    roi{p} = round(getPosition(imrect));
    p = p+1;
end
for j = 1 : length(segment3{1})
    imshow(segment3{1}{j})
    roi{p} = round(getPosition(imrect));
    p = p+1;
end
for j = 1 : length(segment4{1})
    imshow(segment4{1}{j})
    roi{p} = round(getPosition(imrect));
    p = p+1;
end
if app.endgame == 3
    save('roi3.mat','roi');
elseif app.endgame == 4
    save('roi4.mat','roi');
end
end