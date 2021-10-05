%CREATES:
%dogs_split_test{10,4} / cats_split_test{10,4}   %4 sections for each image
% 
%dogs_top_test{10} / cats_top_test{10} 
%
%dogs_bot_test{10} / cats_bot_test{10} 
%
%dogs_center_test{10} / cats_center_test{10} 
%

close all;

animals(1) = "dogTest"; 
animals(2) = "catTest";
dogs_test = cell(nFilesEach_test);
cats_test = cell(nFilesEach_test);
commandPrefix = "imresize(rgb2gray(imread('";
commandSuffix = ".jpg')),[300 300]);";

for fileToLoad = 1:nFilesEach_test
    
    %dogs
        command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(1), ...
            fileToLoad, ... 
            commandSuffix);
        dogs_test{fileToLoad} = eval(command);
   %cats     
          command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(2), ...
            fileToLoad, ... 
            commandSuffix);
        cats_test{fileToLoad} = eval(command);
        
 
end


%CORNER AND HALF SPLITS
dogs_split_test = cell(nFilesEach_test,4); %4 sections for each image
cats_split_test = cell(nFilesEach_test,4); %4 sections for each image
dogs_top_test = cell(nFilesEach_test);
cats_top_test = cell(nFilesEach_test);
dogs_bot_test = cell(nFilesEach_test);
cats_bot_test = cell(nFilesEach_test);
dogs_center_test = cell(nFilesEach_test);
cats_center_test = cell(nFilesEach_test);

[rows columns numberOfColorBands] = size(dogs_test{1});
for i = 1:nFilesEach_test
 
    dogs_split_test{i,1} = dogs_test{i}(1:rows/2,1:columns/2,:); 
    cats_split_test{i,1} = cats_test{i}(1:rows/2,1:columns/2,:);
    
    dogs_split_test{i,2} = dogs_test{i}(1:rows/2,(columns/2)+1:columns,:); 
    cats_split_test{i,2} = cats_test{i}(1:rows/2,(columns/2)+1:columns,:);
    
    dogs_split_test{i,3} = dogs_test{i}((rows/2)+1:rows,1:columns/2,:); 
    cats_split_test{i,3}= cats_test{i}((rows/2)+1:rows,1:columns/2,:);
        
    dogs_split_test{i,4} = dogs_test{i}((rows/2)+1:rows,(columns/2)+1:columns,:);  
    cats_split_test{i,4} = cats_test{i}((rows/2)+1:rows,(columns/2)+1:columns,:); 
    
    
    %cats_bot_test{i} = cats_test{i}(151:end,1:300,:);
    dogs_bot_test{i} = cats_test{i}((rows/2)+1:rows,1:columns,:);
    cats_bot_test{i} = cats_test{i}((rows/2)+1:rows,1:columns,:);
    dogs_top_test{i} = dogs_test{i}(1:rows/2,1:columns,:);
    cats_top_test{i} = cats_test{i}(1:rows/2,1:columns,:);
    
    dogs_center_test{i} = dogs_test{i}((rows/3)+1:rows-(rows/3)-10,(columns/3)+1:columns-(columns/3),:);
    cats_center_test{i} = cats_test{i}((rows/3)+1:rows-(rows/3)-10,(columns/3)+1:columns-(columns/3),:);
    
end  

