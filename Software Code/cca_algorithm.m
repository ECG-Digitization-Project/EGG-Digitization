function [app] = cca_algorithm(app) 

for p = 1 : length(app.thresholdContour)
    tic
    J = app.thresholdContour{p};
    CC = bwconncomp(J,4);
    numPixels = cellfun(@numel,CC.PixelIdxList);
    [biggest,idx] = max(numPixels);
    L1 = labelmatrix(CC);

    RGB2 = label2rgb (L1, 'hsv', 'white', 'shuffle'); %pseudo random color labels;
    figure(1)
    imshow(RGB2)
    pause;
    
    
    a = find(numPixels > 400);
    total = zeros(length(a),1);

    Threshold = 10; 
    min_dist = 0;
    L2= L1;
    i = 1;
    it = 1;
    prev_seg = nan; 
    prev_prev_seg= nan;

    prev_call = 0;
    prev_prev_call = 0;
    curr_call = 0;
    num_p = length(a);

    u = [];
    
    change_segment = 0; 
    
    while ~isempty(a)

        if length(a) == 1
            u = [u;a(i)];
            a(i) = [];
            continue

        end

        it = it + 1; 
        fprintf("Iteration: %d\n",it);
        a
        fprintf("Current Segment: %d\n", a(i));
        mat = zeros(length(a),1);
        [r_m,c_m] = find(L2==a(i));
        g = [r_m,c_m];
        k = [g(1:100,:);g(end-100:end,:)];
        
        for j = 1:numel(a)
            if a(i)==a(j)
                mat(j) = 0;
                continue
            end
        [r_t,c_t] = find(L2==a(j));
        h = [r_t,c_t];
        t = [h(1:end,:);h(end-100:end,:)];
        m_dist = distmat(k,t);
    %     m_dist = min(min(dist));
        mat(j) = m_dist; 
        end
        
%         RGB2 = label2rgb (L2, 'lines', 'white', 'shuffle'); %pseudo random color labels;
%         figure(1)
%         imshow(RGB2)
%         pause;

        uA = unique(nonzeros(mat));
        min_dist = uA(1);
        fprintf("Distance to the closes segment: %f\n", min_dist);
        ua_index = find(mat == min_dist);
        fprintf("Closest Segment: %d\n", a(ua_index(1)));
        if min_dist < 400
            change_segment = 0 ; 
            
            fprintf('Distance less than threshold, merging segments %d and %d to %d\n', a(i), a(ua_index(1)), a(i));
    %         RGB = label2rgb (L2, 'hsv', 'k', 'shuffle'); %pseudo random color labels;
    %         figure;imshow(RGB)
    %         pause

            L2(L2==a(ua_index(1))) = a(i);%problem


%             RGB = label2rgb (L2 == a(i), 'hsv', 'k', 'shuffle'); %pseudo random color labels;
%             figure;imshow(RGB)
%             pause
            
            num_p = num_p - 1;
            a(ua_index(1)) = [];
            if ua_index(1) < i
                i = i - 1;
            end
        else
            change_segment = change_segment + 1
            
            if change_segment == 80
                break; 
            end
            
            fprintf('Distance greater than threshold, Changing from segment %d to %d\n', a(i), a(ua_index(1)));
            prev_prev_seg = prev_seg;
            prev_seg = a(i);
            
            RGB = label2rgb (L2 == a(i), 'hsv', 'k', 'shuffle'); %pseudo random color labels;
%             figure;imshow(RGB)
%             pause;
%             

            fprintf("Prev2prev segment: %d, Prev segment: %d\n", prev_prev_seg, prev_seg);

            prev_prev_call = prev_call;
            prev_call = curr_call;
            curr_call = it;

            fprintf("Prev2prev call: %d, Prev call: %d\n", prev_prev_call, prev_call);

            i = ua_index(1); 
            if prev_prev_seg == a(i) &&  curr_call - prev_prev_call== 2
                u = [u;a(i)];
                a(i) = [];      
                if i == length(a)+1
                    i = i - 1;
                end
            end
        end
    end
    u
    size(u)
    a
    size(a)
    all_segments = [u;a'] 
    d = []; 
    for i = 1 : length(all_segments)  
        d = [d;numel(find(L2 == all_segments(i)))];
    end
    
    [B,I] = maxk(d,app.endgame); 
    for i = 1 : length(I)
        fprintf("Inside loop. Hi")
        RGB = label2rgb (L2 == all_segments(I(i)), 'hsv', 'k', 'shuffle'); %pseudo random color labels;
        RGB2 = label2rgb (L2, 'lines', 'white', 'shuffle'); %pseudo random color labels;
        figure(2)
        imshow(RGB2)
        pause; 
        app.rgb_images{p}{i} = RGB;
    end
toc
end

end