%clearvars;
%CREATES:
%dogs{25} / cats{25}
%
%cats_split{25,1-4} / dogs_split{25,1-4}
%
%dogs_top{25} / cats_top{25}
% 
%dogs_bot{25} / cats_bot{25}
%
%dogs_center {25} / cats_center {25}
%
close all;

animals(1) = "dog"; 
animals(2) = "cat";
nFilesEach = 25;
dogs = cell(nFilesEach);
cats = cell(nFilesEach);
commandPrefix = "imresize(rgb2gray(imread('";
commandSuffix = ".jpg')),[300 300]);";

for fileToLoad = 1:nFilesEach
    
    %dogs
        command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(1), ...
            fileToLoad, ... 
            commandSuffix);
        dogs{fileToLoad} = eval(command);
   %cats     
          command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(2), ...
            fileToLoad, ... 
            commandSuffix);
        cats{fileToLoad} = eval(command);
        

        
end

%CORNER AND HALF SPLITS
dogs_split = cell(nFilesEach,4); %4 sections for each image
cats_split = cell(nFilesEach,4); %4 sections for each image
dogs_top = cell(nFilesEach);
cats_top = cell(nFilesEach);
dogs_bot = cell(nFilesEach);
cats_bot = cell(nFilesEach);
dogs_center = cell(nFilesEach);
cats_center = cell(nFilesEach);

[rows columns numberOfColorBands] = size(dogs{1});
for i = 1:nFilesEach
    %DOGS------------------------------------------------------------------------
    
    dogs_split{i,1} = dogs{i}(1:rows/2,1:columns/2); 
    cats_split{i,1} = cats{i}(1:rows/2,1:columns/2);
    
    dogs_split{i,2} = dogs{i}(1:rows/2,(columns/2)+1:columns); 
    cats_split{i,2} = cats{i}(1:rows/2,(columns/2)+1:columns);
    
    dogs_split{i,3} = dogs{i}((rows/2)+1:rows,1:columns/2); 
    cats_split{i,3}= cats{i}((rows/2)+1:rows,1:columns/2);
        
    dogs_split{i,4} = dogs{i}((rows/2)+1:rows,(columns/2)+1:columns);  
    cats_split{i,4} = cats{i}((rows/2)+1:rows,(columns/2)+1:columns); 
    
    
    %cats_bot{i} = cats{i}(151:end,1:300,:);
    dogs_bot{i} = cats{i}((rows/2)+1:rows,1:columns);
    cats_bot{i} = cats{i}((rows/2)+1:rows,1:columns);
    dogs_top{i} = dogs{i}(1:rows/2,1:columns);
    cats_top{i} = cats{i}(1:rows/2,1:columns);

    dogs_center{i} = dogs{i}((rows/3)+1:rows-(rows/3),(columns/3)+1:columns-(columns/3),:);
    cats_center{i} = cats{i}((rows/3)+1:rows-(rows/3),(columns/3)+1:columns-(columns/3),:);

end  

imshow(cats_split{22,3},[]);
