function [imagethresh] = gridthreshold(app)
for j = 1:length(app.imageContour)
    %         T = adaptthresh(imageContour{1},0.35,'neigh',[5 5],'Fore','bright');
    %         BW = imbinarize(imageContour{1},T);
    %         imshow(BW)
    imagethresh{j} = app.imageContour{j}< app.thresholdValue.Value;
    imagethresh{j} = medfilt2(imagethresh{j});
%                 imshow(segment1{i}{j})
%                 pause
end
end
