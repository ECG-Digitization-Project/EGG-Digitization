function [app] = tracingvoltage_2(app)
fprintf('Hey Inside the app now!');
for k = 1 : length(app.rgb_images)
    for j = 1 : length(app.rgb_images{1})
        
        
%         app.rgb_images{k}{j} = app.rgb_images{k}{j};
%         
        
        [m_C,n_C] = size(app.rgb_images{k}{j});

        for i  = 1:n_C
            if isempty(find(app.rgb_images{k}{j}(:,i) == 1,1))
                
                fprintf('Plugging Nan \n');
                voltage_trace(i) = nan;
                
            else
                [indicesx,indicesy]  = find(app.rgb_images{k}{j}(:,i) == 1);
                fprintf('Mean of Index X \n')
                
                voltage_trace(i) = round(mean(indicesx));
            end
        end
        
%         figure;
%         plot(voltage_trace);
%         pause; 
        
        voltage_trace = 1200-voltage_trace;
        final{k}{j} = voltage_trace;
        
        signal = voltage_trace;
        dc = nanmean(signal)
        signal = (signal-dc)*4.23e-6;
        time = linspace(0,length(signal),length(signal))* 1.693e-3;
        
%         figure; 
%         plot(time,signal)
%         pause; 
        
        cd(app.Label_4.Text)
        if ~exist(num2str(k), 'dir')  
            mkdir(num2str(k))
        end
        cd(num2str(k)) 
        gcf = figure('Visible','off');
        set(gcf,'Position',[0 300 1900 250])
        subplot(211)
        [r,c] = find(app.rgb_images{k}{j}==1);
        o = app.rgb_images{k}{j}((min(r)):(max(r)),(min(c)):(max(c)));
        imagesc(o)
        colormap gray
        subplot(212)
        plot(time,signal,'k-','Linewidth',1)
        filename = ['Comparison_' num2str(k) '_' num2str(j) '.jpg'];
        saveas(gcf,filename)
        cd(app.currentFolder)
    end
end

app.final = final;
end
