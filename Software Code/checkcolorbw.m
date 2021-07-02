function [imageArraybw] = checkcolorbw(imageArray)
[m,n,b] = size(imageArray);
if b == 3
    imageArraybw = imbinarize(rgb2gray(imageArray));
else
    imageArraybw = imageArray;
end
end
