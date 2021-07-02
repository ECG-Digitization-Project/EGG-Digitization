function [app] = saving_roi(app)
fprintf('hey we are in saving_roi right now') 
filepath = mfilename('fullpath');
disp(filepath)
[rootFolder,name,ext] = fileparts(filepath);
disp(rootFolder);
app.rootFolder = rootFolder;

app.roi = app.roiwindow.roi;
app.labels_number = app.roiwindow.number;
app.labels = app.roiwindow.labels;

u = zeros(app.labels_number,4);
for i = 1: app.labels_number
    [temp1,temp2] = find(app.labels == i);
    width = (max(temp2)- min(temp2)); 
    height = (max(temp1)- min(temp1)); 
    u(i,1) = min(temp2);
    u(i,2) = min(temp1);
    u(i,3) = width;
    u(i,4) = height;
end

app.u = u; 

if strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'GE CASE V6.51')
    cd(app.rootFolder)
    fprintf('hey we are saving roi_1  right now') 
    save('Roi_1.mat','u');
    cd(app.currentFolder)
elseif strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'MAC500K 003A')
    cd(app.rootFolder)
    fprintf('hey we are saving roi_2  right now') 
    save('Roi_2.mat','u');
    cd(app.currentFolder)
elseif strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'New Template 1')
    cd(app.rootFolder)
    save('Roi_2.mat','u');
    cd(app.currentFolder)
elseif strcmp(app.calRecord,'NO') && strcmp(app.Dropdown.Value, 'New Template 2')
    cd(app.rootFolder)
    save('Roi_2.mat','u');
    cd(app.currentFolder)
end

end