function [contour,u,app] = calibratingapp(app) 
filepath = mfilename('fullpath');
disp(filepath)
[rootFolder,name,ext] = fileparts(filepath);
disp(rootFolder);
app.rootFolder = rootFolder;
u = NaN;
if strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'GE CASE V6.51')
    [contour_1,basefile_1] = calibration(app);
    cd(app.rootFolder)
    save('contour_1.mat','contour_1');
    save('basefile_1.mat','basefile_1');
    app.basefile = basefile_1; 
    cd(app.currentFolder)
    contour = contour_1; 
elseif strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'MAC500K 003A')
    [contour_2,basefile_2] = calibration(app);
    cd(app.rootFolder)
    save('contour_2.mat','contour_2');
    save('basefile_2.mat','basefile_2');
    app.basefile = basefile_2; 
    cd(app.currentFolder)
    contour = contour_2; 
elseif strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'New Template 1')
    [contour_3,basefile_3] = calibration(app);
    cd(app.rootFolder)
    save('contour_3.mat','contour_3');
    save('basefile_3.mat','basefile_3');
    app.basefile = basefile_3; 
    cd(app.currentFolder)
    contour = contour_3; 
elseif strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'New Template 2')
    [contour_4,basefile_4] = calibration(app);
    cd(app.rootFolder)
    save('contour_4.mat','contour_4');
    save('basefile_4.mat','basefile_4');
    app.basefile = basefile_4; 
    cd(app.currentFolder)
    contour = contour_4; 
elseif strcmp(app.calRecord,'YES') && strcmp(app.Dropdown.Value, 'GE CASE V6.51')
    contour = load('contour_1.mat');
     u = load('Roi_1.mat');
     app.basefile = load('basefile_1.mat');
elseif strcmp(app.calRecord,'YES') && strcmp(app.Dropdown.Value, 'MAC500K 003A')
    cd(app.rootFolder)
    contour = load('contour_2.mat');
     u = load('Roi_2.mat');
    app.basefile =  load('basefile_2.mat');
    cd(app.currentFolder)
elseif strcmp(app.calRecord,'YES') && strcmp(app.Dropdown.Value, 'New Template 1')
    cd(app.rootFolder)
    contour = load('contour_3.mat');
     u = load('Roi_3.mat');
     app.basefile =  load('basefile_3.mat');
    cd(app.currentFolder)
elseif strcmp(app.calRecord,'YES') && strcmp(app.Dropdown.Value, 'New Template 2')
    cd(app.rootFolder)
    contour = load('contour_4.mat');
     u = load('Roi_4.mat');
    app.basefile = load('basefile_4');
    cd(app.currentFolder)
end


end
