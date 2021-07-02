function [imageArray] = readfiles(myFolder)
filePattern = fullfile(myFolder);
jpegFiles = dir2(filePattern); 
number_files = length(jpegFiles);
for k = 1: length(jpegFiles)
    baseFileName{k} = jpegFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName{k}); 
    fprintf(1, 'Now reading %s\n', fullFileName);
    imageArray{k} = imread(fullFileName);
end
end