%catEyesEdgesAvg is 78x78
%DON'T USE THIS, NOT WORKING
close all;

figure;
imshow(catTestEdges{1});

scanZone = zeros(size(catEyesEdgesAvg));


[rows columns numberOfColorBands] = size(catEyesEdgesAvg);

%for begin = 1:300-78

for q = 1:10:300-78
    for z = 1:10:300-78
        for i = 1:rows
            for j = 1:columns
                scanZone(i,j) = catTestEdges{1}(i+q,j+z);               
            end     
        end
        difference = abs(catEyesEdgesAvg - scanZone); 
        differencePercent = sum(difference(:))/(78*78);
        disp(differencePercent);
        figure;
        imshow(scanZone);

    end
    
    difference = abs(catEyesEdgesAvg - scanZone); 
    differencePercent = sum(difference(:))/(78*78);
    disp(differencePercent);
    
    figure;
    imshow(scanZone);
    
end


