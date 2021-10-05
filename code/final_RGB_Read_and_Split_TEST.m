%CREATES:
%dogsRGB_split_test{10,4} / catsRGB_split_test{10,4}   %4 sections for each image
% 
%dogsRGB_top_test{10} / catsRGB_top_test{10} 
%
%dogsRGB_bot_test{10} / catsRGB_bot_test{10} 
%
%dogsRGB_center_test{10} / catsRGB_center_test{10} 
%

close all;
nFilesEach_test = 15;
dogsRGB_test = cell(nFilesEach_test);
catsRGB_test = cell(nFilesEach_test);

animals(1) = "dogTest"; 
animals(2) = "catTest";

commandPrefix = "imresize(imread('";
commandSuffix = ".jpg'),[300 300]);";

for fileToLoad = 1:nFilesEach_test
    
    %dogs
        command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(1), ...
            fileToLoad, ... 
            commandSuffix);
        dogsRGB_test{fileToLoad} = eval(command);
   %cats     
          command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(2), ...
            fileToLoad, ... 
            commandSuffix);
        catsRGB_test{fileToLoad} = eval(command);
        

        
end


%CORNER AND HALF SPLITS
dogsRGB_split_test = cell(nFilesEach_test,4); %4 sections for each image
catsRGB_split_test = cell(nFilesEach_test,4); %4 sections for each image
dogsRGB_top_test = cell(nFilesEach_test);
catsRGB_top_test = cell(nFilesEach_test);
dogsRGB_bot_test = cell(nFilesEach_test);
catsRGB_bot_test = cell(nFilesEach_test);
dogsRGB_center_test = cell(nFilesEach_test);
catsRGB_center_test = cell(nFilesEach_test);
[rows columns numberOfColorBands] = size(dogsRGB_test{1});
for i = 1:nFilesEach_test
 
    dogsRGB_split_test{i,1} = dogsRGB_test{i}(1:rows/2,1:columns/2,:); 
    catsRGB_split_test{i,1} = catsRGB_test{i}(1:rows/2,1:columns/2,:);
    
    dogsRGB_split_test{i,2} = dogsRGB_test{i}(1:rows/2,(columns/2)+1:columns,:); 
    catsRGB_split_test{i,2} = catsRGB_test{i}(1:rows/2,(columns/2)+1:columns,:);
    
    dogsRGB_split_test{i,3} = dogsRGB_test{i}((rows/2)+1:rows,1:columns/2,:); 
    catsRGB_split_test{i,3}= catsRGB_test{i}((rows/2)+1:rows,1:columns/2,:);
        
    dogsRGB_split_test{i,4} = dogsRGB_test{i}((rows/2)+1:rows,(columns/2)+1:columns,:);  
    catsRGB_split_test{i,4} = catsRGB_test{i}((rows/2)+1:rows,(columns/2)+1:columns,:); 
    
    
    %catsRGB_bot_test{i} = catsRGB_test{i}(151:end,1:300,:);
    dogsRGB_bot_test{i} = catsRGB_test{i}((rows/2)+1:rows,1:columns,:);
    catsRGB_bot_test{i} = catsRGB_test{i}((rows/2)+1:rows,1:columns,:);
    dogsRGB_top_test{i} = dogsRGB_test{i}(1:rows/2,1:columns,:);
    catsRGB_top_test{i} = catsRGB_test{i}(1:rows/2,1:columns,:);
    
    dogsRGB_center_test{i} = dogsRGB_test{i}((rows/3)+1:rows-(rows/3)-10,(columns/3)+1:columns-(columns/3),:);
    catsRGB_center_test{i} = catsRGB_test{i}((rows/3)+1:rows-(rows/3)-10,(columns/3)+1:columns-(columns/3),:);
    
  
end  

