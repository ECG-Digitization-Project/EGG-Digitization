function [app] = finalresults(app)
for i = 1 : length(app.final)
    cd(app.outputText.Text)
    if ~exist(num2str(i), 'dir')  
        mkdir(num2str(i))
    end
    cd(num2str(i)) 
    BW = bwmorph(app.imageDemographic{i}<150,'branchpoints');
    txt2 = ocr(BW,'Language', 'English');
    filename = ['Demographic Information ' num2str(i) ' .txt'];
    fid = fopen(filename,'wt');
    fprintf(fid, txt2.Text);
    fclose(fid);
    k = 1;
    for j = 1 : length(app.final{1})
        signal = app.final{i}{j};
        dc = nanmean(signal);
        signal = (signal - dc)*4.23e-6;
        time = linspace(0,length(signal),length(signal))* 1.693e-3;
%         gcf = figure('Visible','on');
%         set(gcf,'Position',[0 300 2100 150])
%         AxesH = axes; 

%        h=gca;
        figure('Visible','on');
        plot(time,signal,'k-','Linewidth',1)
        xticks(1:1:max(time))
        ax1 = gca; % the first axes
        set(gcf,'Position',[0 300 2100 150])
%         set(gca,'xtick',[min(time):1:min(time)])
%        set(gca,'ytick',linspace(0,100,13))
        ax2 = axes('Position',ax1.Position,...
          'XAxisLocation','bottom',...
          'YAxisLocation','left',...
          'Color','none',... 
          'Ylim',ax1.YLim,...
          'XLim',ax1.XLim,...
          'TickLength',[0 0],...
          'YTick', [ax1.YLim(1):0.00010:ax1.YLim(2)], ...
          'XTick', [ax1.XLim(1):0.10:ax1.XLim(2)],  ...
          'YTickLabel', [],  ...
          'XTickLabel', []  );
        linkaxes([ax1 ax2],'xy')
        grid on
        set(gcf,'CurrentAxes',ax1);
%         pause;
%         grid on
%         grid minor
%         
        % gridlines ---------------------------
%         hold on
%         g_y=[min(signal):0.1:max(signal)]; % user defined grid Y [start:spaces:end]
%         g_x=[min(time):0.2:max(time)]; % user defined grid X [start:spaces:end]
%         for i=1:length(g_x)
%            plot([g_x(i) g_x(i)],[g_y(1) g_y(end)],'k:') %y grid lines
%            hold on    
%         end
%         for i=1:length(g_y)
%            plot([g_x(1) g_x(end)],[g_y(i) g_y(i)],'k:') %x grid lines
%            hold on    
%         end
%         pause;
        
%         set(h,'GridLineStyle','-','GridAlpha',1,'GridColor',[0.6394,0.15,0.21052])
%         set(h,'MinorGridLineStyle','-','MinorGridAlpha',0.5,'MinorGridColor',[0.50970,0.23058,0.259708])
        
        filename = ['Row_' num2str(k) '.jpg'];
        saveas(gcf,filename)
        %%
        % 
        % * ITEM1
        % * ITEM2
        % 
%         I = imread(filename);
%         dicomwrite(I,filename);
        close;
        k = k+1;
        
    end

cd(app.currentFolder)
end

