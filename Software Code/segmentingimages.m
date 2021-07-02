function [seg1,seg2,seg3,seg4] = segmentingimages(imageContour,app,xi,yi)

if app.endgame == 3
    flag1 = 0; 
elseif app.endgame == 4
    flag1 = 1;  
elseif app.endgame == 5
    flag1 = 2;
elseif app.endgame == 6
    flag1 = 3;
elseif app.endgame == 7
    flag1 = 4;
elseif app.endgame == 8 
    flag1 = 5; 
elseif app.endgame == 9
    flag1 = 6;
end
if app.YesButton.Value == 1
    xi = cell2mat(struct2cell(xi));
    yi = cell2mat(struct2cell(yi));
end
k=0;
flag = 0; 
for i = 1 : length(imageContour)
    for j = 1 : app.endgame
        if j ~= app.endgame
            if yi(k+2+(2*flag)) - (yi(k+4)- yi(k+2))/2 < 0
                seg1{i}{j} = imageContour{i}(1 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(1): xi(7 + 2*flag1));
                %imshow(seg1{i}{j})
                %pause
                seg2{i}{j} = imageContour{i}(1 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(7 + 2*flag1) : xi(10 + 3*flag1));
                %imshow(seg2{i}{j})
                %pause
                seg3{i}{j} = imageContour{i}(1: yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(10 + 3*flag1): xi(13 + 4*flag1));
                %           imshow(seg3{i}{j})
                %           pause
                seg4{i}{j} = imageContour{i}(1 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(13 + 4*flag1): end);
                %             imshow(seg4{i}{j})
            else
                
                seg1{i}{j} = imageContour{i}(yi(k+2+(2*flag)) - (yi(k+4)- yi(k+2))/2 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(1): xi(7 + 2*flag1));
                %imshow(seg1{i}{j})
                %pause
                seg2{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(7 + 2*flag1) : xi(10 + 3*flag1));
                %imshow(seg2{i}{j})
                %pause
                seg3{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(10 + 3*flag1): xi(13 + 4*flag1));
                %           imshow(seg3{i}{j})
                %           pause
                seg4{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : yi(k+2+2*flag) + (yi(k+4)- yi(k+2))/2, xi(13 + 4*flag1): end);
                %             imshow(seg4{i}{j})
                %             pause
            end
            if j == app.endgame - 1
                k = k; 
                flag = 1; 
            else
                k = k + 2; 
            end
        else
         
            seg1{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : end, xi(1): xi(7 + 2*flag1));
%             imshow(seg1{i}{j})
%             pause
            seg2{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : end, xi(7 + 2*flag1) : xi(10 + 3*flag1));
%             imshow(seg2{i}{j})
%             pause
            seg3{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : end, xi(10 + 3*flag1): xi(13 + 4*flag1));
%             imshow(seg3{i}{j})
%             pause
            seg4{i}{j} = imageContour{i}(yi(k+2+2*flag) - (yi(k+4)- yi(k+2))/2 : end, xi(13 + 4*flag1): end);
%             imshow(seg4{i}{j})
%             pause
            k=0;
            flag=0;
        end
    end
end
end