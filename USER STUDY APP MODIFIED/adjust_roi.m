function [app] = adjust_roi(app)
% for k = 1:length(app.thresholdContour)

index = find(min(app.u.u(:,1))& min(app.u.u(:,2)));%
base_roi = app.u.u(index,:);%
% pause; 

%ref_image = rgb2gray(app.basefile.basefile_1) < app.thresholdValue.Value; 
if strcmp(app.Dropdown, 'GE CASE V6.51')
    ref_image = rgb2gray(app.basefile.basefile_1) < (app.thresholdValue-30); %app.thresholdContour{k};
elseif strcmp(app.Dropdown, 'MAC500K 003A')
    ref_image = app.basefile.basefile_2 < (app.thresholdValue-30); %app.thresholdContour{k};
end
% figure;imshow(ref_roi)
% pause; 

ref_roi = ref_image(1:base_roi(1,2) + base_roi(1,4),1:base_roi(1,1)+base_roi(1,3));
[ref_m,ref_n] = find(ref_roi == 1);
index_ref_n = find(ref_n == min(ref_n));
min_ref_n = min(ref_n);
min_ref_m = min(ref_m(index_ref_n));

% figure;imshow(ref_roi)
% hold on; 
% plot(min_ref_n,min_ref_m, 'ro', 'LineWidth', 2, 'MarkerSize', 10);
% pause; 

%figure;imshow(ref_roi(ref_m(1): 500,ref_n))
z = zeros(length(app.thresholdContour), 2);
min_matrix = zeros(length(app.thresholdContour), 2);
for k = 1:length(app.thresholdContour)

app_roi = app.thresholdContour{k}(1:base_roi(1,2) + base_roi(1,4),1:base_roi(1,1)+base_roi(1,3));

[app_m,app_n] = find(app_roi == 1);
index_app_n = find(app_n == min(app_n));
min_app_n = min(app_n);
min_app_m = min(app_m(index_app_n));

z(k,:)= [min_ref_m - min_app_m, min_ref_n-min_app_n]; 
min_matrix(k,:) = [min_app_m,min_app_n]; 
end

% for k = 1:length(app.thresholdContour)

% figure;
% 
% imshow(ref_image);
% hold on; 
% 
% plot(base_roi(1,2), base_roi(1,1), 'ro', 'LineWidth', 2, 'MarkerSize', 15);
% % th = 0:pi/50:2*pi;
% % xunit = 0.5 * cos(th) + base_roi(1,2);
% % yunit = 0.5 * sin(th) + base_roi(1,1);
% % h = plot(xunit, yunit, 'r','LineWidth', 10, 'MarkerSize', 40);
% pause; 
% % end

% for k = 1:length(app.thresholdContour)
% 
% figure;
% 
% subplot(211)
% imshow(ref_roi(1:base_roi(1,2) + base_roi(1,4),1:base_roi(1,1)+base_roi(1,3)));
% hold on; 
% plot(min_ref_n,min_ref_m, 'ro', 'LineWidth', 2, 'MarkerSize', 10);
% 
% subplot(212)
% imshow(app.thresholdContour{k}(1:base_roi(1,2) + base_roi(1,4),1:base_roi(1,1)+base_roi(1,3)));
% hold on;
% plot(min_matrix(k,2),min_matrix(k,1), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
% 
% pause; 
% end
app.roi_shift = z; 
end