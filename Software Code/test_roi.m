function [app] = test_roi(app)
% images = app.rgb_images; 
% for i = 1: length(images)
%     for j = 1: length(images{1})
%         images{i}{j} = imbinarize(rgb2gray(images{i}{j}));
% %         figure;
% %         imshow(images{i}{j})
% %         pause; 
%     end
% end
% app.u.u
for i = 1 : length(app.thresholdContour)
    k = 0;
    current_roi = app.u.u
%     current_roi(:,1)
%     current_roi(:,2)
%     app.roi_shift(i,1)
%     app.roi_shift(i,2)
% %     
%     fprintf('This is the size of current_roi')
%     current_roi
%     size(current_roi)
%     
%     fprintf('This is the size of app.roi_shift')
%     app.roi_shift
%     size(app.roi_shift)
    
    current_roi(:,1) = current_roi(:,1) -  app.roi_shift(i,2)*ones(length(current_roi(:,1)),1);
    current_roi(:,2) = current_roi(:,2) -  app.roi_shift(i,1)*ones(length(current_roi(:,2)),1);
    clf('reset')
        for r = 1: length(current_roi)
            roi = current_roi(r,:); 
            app.thresholdContour{i}(roi(2):roi(4)+ roi(2),roi(1):roi(3)+roi(1)) = 1; 
            figure,
            imshow(app.thresholdContour{i})
            pause;
            clf('reset')
            i
        end
        clf('reset')
end

end
