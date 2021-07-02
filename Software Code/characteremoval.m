function [app] = characteremoval(app) 

fprintf('Hey, you have entered Character Removal \n \n ');


% for i = 1: length(app.rgb_images)
%     for j = 1: length(app.rgb_images{1})
%         i
%         j
% %        app.rgb_images{i}{j} = app.rgb_images{i}{j};
%         figure;
%         imshow(app.rgb_images{i}{j})
%         pause; 
%     end
% end

for i = 1: length(app.rgb_images)
    for j = 1: length(app.rgb_images{1})
%        app.rgb_images{i}{j} = app.rgb_images{i}{j};
       app.rgb_images{i}{j} = checkcolorbw(app.rgb_images{i}{j});
%         i
%         j
%         figure;
%         imshow(app.rgb_images{i}{j})
%         pause; 
    end
end
fprintf('Hey, you have finished converting images to black and white \n');
% 
% pause ; 
% 
% length(app.rgb_images)
% pause; 
for i = 1 : length(app.rgb_images)
    i
    fprintf('Hi inside chracter removal')
    k = 0;
    
    length(app.rgb_images{1})
    current_roi = app.u.u
    current_roi(:,1) = current_roi(:,1) -  app.roi_shift(i,2)*ones(length(current_roi(:,1)),1);
    current_roi(:,2) = current_roi(:,2) -  app.roi_shift(i,1)*ones(length(current_roi(:,2)),1);
    for j = 1 : length(app.rgb_images{1})
        i
        k = k+1
        fprintf('Entered first Loop \n');
        for r = 1: length(current_roi) 
            fprintf('Entered Evaluate Loop \n');
            
            [ocrI, results] = evaluateOCRTraining1(app.rgb_images{i}{j}, current_roi(r,:));
            if isempty(results.CharacterBoundingBoxes)
                fprintf('Continuing it \n');
                continue;
            end
            results.CharacterBoundingBoxes
            [m,n] = size(results.CharacterBoundingBoxes)
            for v = 1 : m
%                 figure;imshow(app.rgb_images{i}{j})
%                 pause;
                
                lol = results.CharacterBoundingBoxes(v,:);
%                 app.u.u(r,:)
%                 pause;
                
%                 figure;imshow(app.rgb_images{i}{j}(lol(2):lol(4)+lol(2),lol(1):lol(3)+lol(1)))
%                 pause;
               app.rgb_images{i}{j}(lol(2):lol(4)+lol(2),lol(1):lol(3)+lol(1)) = 0;
%                 figure;imshow(app.rgb_images{i}{j})
%                 pause;
            end
        end
    end
end
% for i = 1: length(app.rgb_images)
%     for j = 1: length(app.rgb_images{1})
% %         app.rgb_images{i}{j} = app.rgb_images{i}{j};
% %         figure;
% %         imshow(app.rgb_images{i}{j})
% %         pause; 
%     end
% end
% 
% for i = 1: length(app.rgb_images)
%     for j = 1: length(app.rgb_images{1})
%     cd(app.outputText.Text)
%     if ~exist(num2str(i), 'dir')  
%         mkdir(num2str(i))
%     end
%     cd(num2str(i)) 
%     imwrite(app.rgb_images{i}{j}, strcat(num2str(i),'_',num2str(j),'.jpg'));
%     end
% end
cd(app.currentFolder)
end