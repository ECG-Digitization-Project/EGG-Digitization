function [app] = characteremoval(app,roi) 
for i = 1 : length(app.segment1)
    k = 0;
    for j = 1 : length(app.segment1{1})
        k = k+1;
        [ocrI, results] = evaluateOCRTraining1(eval(['app.segment1' '{' num2str(i) '}' '{' num2str(j) '}']), roi{k});
        if isempty(results.Words)
            continue;
        end
        [m,n] = size(results.WordBoundingBoxes);
        for j = 1 : m
            lol = results.WordBoundingBoxes(j,:);
            app.segment1{i}{j}(lol(2):lol(4)+lol(2),lol(1):lol(3)+lol(1)) = 0;
        end
    end
end
for i = 1 : length(app.segment2)
    k = 0;
    for j = 1 : length(app.segment2{1})
        k = k+1;
        [ocrI, results] = evaluateOCRTraining1(eval(['app.segment2' '{' num2str(i) '}' '{' num2str(j) '}']), roi{k});
        if isempty(results.Words)
            continue;
        end
        [m,n] = size(results.WordBoundingBoxes);
        for j = 1 : m
            lol = results.WordBoundingBoxes(j,:);
            app.segment2{i}{j}(lol(2):lol(4)+lol(2),lol(1):lol(3)+lol(1)) = 0;
        end
    end
end
for i = 1 : length(app.segment3)
    k = 0;
    for j = 1 : length(app.segment3{1})
        k = k+1;
        [ocrI, results] = evaluateOCRTraining1(eval(['app.segment3' '{' num2str(i) '}' '{' num2str(j) '}']), roi{k});
        if isempty(results.Words)
            continue;
        end
        [m,n] = size(results.WordBoundingBoxes);
        for j = 1 : m
            lol = results.WordBoundingBoxes(j,:);
            app.segment3{i}{j}(lol(2):lol(4)+lol(2),lol(1):lol(3)+lol(1)) = 0;
        end
    end
end
for i = 1 : length(app.segment4)
    k = 0;
    for j = 1 : length(app.segment4{1})
        k = k+1;
        [ocrI, results] = evaluateOCRTraining1(eval(['app.segment4' '{' num2str(i) '}' '{' num2str(j) '}']), roi{k});
        if isempty(results.Words)
            continue;
        end
        [m,n] = size(results.WordBoundingBoxes);
        for j = 1 : m
            lol = results.WordBoundingBoxes(j,:);
            app.segment4{i}{j}(lol(2):lol(4)+lol(2),lol(1):lol(3)+lol(1)) = 0;
        end
    end
end
end