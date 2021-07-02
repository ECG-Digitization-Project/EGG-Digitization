function [imageContour,imageDemographic] = markingregions(imageArray,contour,app)
if app.YesButton.Value == 1
    contour = cell2mat(struct2cell(contour));
end
for i = 1 : length(imageArray)
imageContour{i} = imageArray{i}(contour(2):contour(4)+contour(2),contour(1):contour(3)+contour(1));
imageDemographic{i} = imageArray{i}(1:contour(2),contour(1):contour(3)+contour(1));
end
end

