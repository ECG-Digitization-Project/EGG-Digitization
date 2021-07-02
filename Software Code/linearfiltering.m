function [app] = linearfiltering(app)
for i = 1:length(app.rgb_images)
    fprintf('Hey, inside the linear filtering loop')
    for j = 1:length(app.rgb_images{i})
        fprintf('Hey, inside the linear filtering loop part 2')
        [m,n] = size(app.rgb_images{i}{j});
        [x,y] = meshgrid(1:n,1:m);
        [xi,yi] = meshgrid(1:0.8:n,1:0.8:m);
        a = app.rgb_images{i}{j};
        app.rgb_images{i}{j} = interp2(x,y,double(a),xi,yi,'linear');
%         imshow(Segment1{i}{j})
%         pause
        app = app;
    end
end
fprintf('Hey, inside the linear filtering loop- finally done')
end