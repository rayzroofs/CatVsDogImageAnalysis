%CREATES:
%dogsRGB{25} / catsRGB{25}
%
%catsRGB_split{25,1-4} / dogsRGB_split{25,1-4}
%
%dogsRGB_top{25} / catsRGB_top{25}
%
%dogsRGB_bot{25} / catsRGB_bot{25}
%
%dogsRGB_center {25} / catsRGB_center {25}
%

close all;
dogsRGB = cell(25);
catsRGB = cell(25);

animals(1) = "dog"; 
animals(2) = "cat";
nFilesEach = 25;
commandPrefix = "imresize(imread('";
commandSuffix = ".jpg'),[300 300]);";

for fileToLoad = 1:nFilesEach
    
    %dogs
        command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(1), ...
            fileToLoad, ... 
            commandSuffix);
        dogsRGB{fileToLoad} = eval(command);
   %cats     
          command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(2), ...
            fileToLoad, ... 
            commandSuffix);
        catsRGB{fileToLoad} = eval(command);
        

        
end

%CORNER AND HALF SPLITS
dogsRGB_split = cell(nFilesEach,4); %4 sections for each image
catsRGB_split = cell(nFilesEach,4); %4 sections for each image
dogsRGB_top = cell(nFilesEach);
catsRGB_top = cell(nFilesEach);
dogsRGB_bot = cell(nFilesEach);
catsRGB_bot = cell(nFilesEach);
dogsRGB_center = cell(nFilesEach);
catsRGB_center = cell(nFilesEach);
[rows columns numberOfColorBands] = size(dogsRGB{1});
for i = 1:nFilesEach

    dogsRGB_split{i,1} = dogsRGB{i}(1:rows/2,1:columns/2,:); 
    catsRGB_split{i,1} = catsRGB{i}(1:rows/2,1:columns/2,:);
    
    dogsRGB_split{i,2} = dogsRGB{i}(1:rows/2,(columns/2)+1:columns,:); 
    catsRGB_split{i,2} = catsRGB{i}(1:rows/2,(columns/2)+1:columns,:);
    
    dogsRGB_split{i,3} = dogsRGB{i}((rows/2)+1:rows,1:columns/2,:); 
    catsRGB_split{i,3}= catsRGB{i}((rows/2)+1:rows,1:columns/2,:);
        
    dogsRGB_split{i,4} = dogsRGB{i}((rows/2)+1:rows,(columns/2)+1:columns,:);  
    catsRGB_split{i,4} = catsRGB{i}((rows/2)+1:rows,(columns/2)+1:columns,:); 
    
    
    %catsRGB_bot{i} = catsRGB{i}(151:end,1:300,:);
    dogsRGB_bot{i} = catsRGB{i}((rows/2)+1:rows,1:columns,:);
    catsRGB_bot{i} = catsRGB{i}((rows/2)+1:rows,1:columns,:);
    dogsRGB_top{i} = dogsRGB{i}(1:rows/2,1:columns,:);
    catsRGB_top{i} = catsRGB{i}(1:rows/2,1:columns,:);
    
    dogsRGB_center{i} = dogsRGB{i}((rows/3)+1:rows-(rows/3),(columns/3)+1:columns-(columns/3),:);
    catsRGB_center{i} = catsRGB{i}((rows/3)+1:rows-(rows/3),(columns/3)+1:columns-(columns/3),:);
end  
 

figure;
imshow(dogsRGB_center{22,1});