function [contour,J] = calibration(app)
filePattern = fullfile(app.mainFolder.Text,'*.jpg');
jpegFiles = dir(filePattern); 
filenumber = 1;
baseFileName = jpegFiles(filenumber).name;
% fullFileName = fullfile(myFolder, baseFileName);
% cd(app.mainFolder.Text)
cd(app.mainFolder.Text)
image = imread(baseFileName);
[J,contour] = imcrop(image);
%[xi,yi,P] = impixel(J);
close;
disp(pwd)
% cd(app.currentFolder)
% disp(app.currentFolder)
% cd(oldfolder)
% fprintf(1, 'Now reading %s\n', oldfolder);
end

