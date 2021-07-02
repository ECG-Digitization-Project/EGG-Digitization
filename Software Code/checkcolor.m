function [imageArraygrey] = checkcolor(imageArray)
[m,n,b] = size(imageArray{1});
if b == 3
    for i = 1:length(imageArray)
        imageArraygrey{i} = rgb2gray(imageArray{i});
    end
else
    imageArraygrey = imageArray;
end
end


    