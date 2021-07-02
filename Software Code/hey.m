filePattern = fullfile('C:\Users\shamb\Documents\MS THESIS\ECG-digitization\ECG-digitization\Desktop\ECG\Sample ECGs for Srini and Pam\Sample ECGs for Srini and Pam\type1','*.jpg');
jpegFiles = dir(filePattern); 
filenumber = 1;
baseFileName = jpegFiles(filenumber).name;
cd('C:\Users\shamb\Documents\MS THESIS\ECG-digitization\ECG-digitization\Desktop\ECG\Sample ECGs for Srini and Pam\Sample ECGs for Srini and Pam\type1')
image = imread(baseFileName);
J = imcrop(image); 
J = rgb2gray(J);
J = J >65 ;
imshow(J)







%imshow(J)
CC = bwconncomp(~J,4);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
J(CC.PixelIdxList{idx}) = 0;

imshow(J)


L1 = labelmatrix(CC);
RGB = label2rgb (L1, 'hsv', 'k', 'shuffle'); %pseudo random color labels;

figure
imshow(RGB)

CC = bwconncomp(~J,4);
numPixels = cellfun(@numel,CC.PixelIdxList);

L1 = labelmatrix(CC);

numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);

a = find(numPixels>50000)
labeledImage = bwlabel(~J);

k = 0
for i = a
        k = k+1
        coloredLabels = label2rgb ((L1==i), 'hsv', 'k', 'shuffle'); %pseudo random color labels
        figure(i)
        
        img{k} = rgb2gray(coloredLabels)>0;
        imshow(coloredLabels);
end


img1 = imcrop(img{1});
img2 = imcrop(img{2});
img3 = imcrop(img{3});

a = [1,2,3,4;,5,6,7,8;12,23,34,45];

a = img1;
[m_C,n_C] = size(a)
for i = 1:n_C
    
    if any(a(:,i) == 1)
            %k = k+1;
            %disp('yay');
            [indicesx,indicesy]  = find(a(:,i) == 1);
            voltage_trace(i) = round(median(indicesx));

%             voltage_trace_min(i) = min(indicesx);
%             voltage_trace_max(i) = max(indicesx);
    end
end
% voltage_trace_final = [voltage_trace_min;voltage_trace_max];
% voltage_trace_final = 1200-voltage_trace_final;
voltage_trace = 1200-voltage_trace;

%plot(voltage_trace)
figure(1);imshow(img1)
signal = voltage_trace;
dc = mean(signal);
signal = (signal-dc)*4.23e-6;
time = linspace(0,length(signal),length(signal))* 1.693e-3;
figure(2)
plot(time,signal,'k-','Linewidth',1)

a = img1;
[m_C,n_C] = size(a)
for i = 1:n_C
    
    if any(a(:,i) == 1)
            %k = k+1;
            %disp('yay');
            [indicesx,indicesy]  = find(a(:,i) == 1);
            voltage_trace(i) = round(mean(indicesx));

            voltage_trace_min(i) = min(indicesx);
            voltage_trace_max(i) = max(indicesx);
    end
end
voltage_trace_final = [voltage_trace_min;voltage_trace_max];
voltage_trace_final = 1200-voltage_trace_final;
voltage_trace = 1200-voltage_trace;

%plot(voltage_trace)
figure;imshow(img1)
signal = voltage_trace;
dc = mean(signal);
signal = (signal-dc)*4.23e-6;
time = linspace(0,length(signal),length(signal))* 1.693e-3;
figure(2)
plot(time,signal,'k-','Linewidth',1)


a = img2;
[m_C,n_C] = size(a)
for i = 1:n_C
    
    if any(a(:,i) == 1)
            %k = k+1;
            %disp('yay');
            [indicesx,indicesy]  = find(a(:,i) == 1);
            voltage_trace(i) = round(mean(indicesx));

            voltage_trace_min(i) = min(indicesx);
            voltage_trace_max(i) = max(indicesx);
    end
end
voltage_trace_final = [voltage_trace_min;voltage_trace_max];
voltage_trace_final = 1200-voltage_trace_final;
voltage_trace = 1200-voltage_trace;
signal = voltage_trace;
dc = mean(signal);
signal = (signal-dc)*4.23e-6;
time = linspace(0,length(signal),length(signal))* 1.693e-3;
figure(2)
plot(time,signal,'k-','Linewidth',1)

a = img3;
figure(3);imshow(a)
[m_C,n_C] = size(a)
for i = 1:n_C
    
    if any(a(:,i) == 1)
            %k = k+1;
            %disp('yay');
            [indicesx,indicesy]  = find(a(:,i) == 1);
            voltage_trace(i) = round(mean(indicesx));

            voltage_trace_min(i) = min(indicesx);
            voltage_trace_max(i) = max(indicesx);
    end
end
voltage_trace_final = [voltage_trace_min;voltage_trace_max];
voltage_trace_final = 1200-voltage_trace_final;
voltage_trace = 1200-voltage_trace;

signal = voltage_trace;
dc = mean(signal);
signal = (signal-dc)*4.23e-6;
time = linspace(0,length(signal),length(signal))* 1.693e-3;
figure(4)
plot(time,signal,'k-','Linewidth',1)