%DATA:
% Chi vs CatAvg (top half of image)
% Chi vs DogAvg (top half of image)
% Gray Average Values (top left corner)
% Edge Detection Bottom Pixel Count
% RGB Center White Pixel Count
% histogram skewness (top half of image)
% histogram kurtosis (top half of image)

x_data = double(zeros(nFilesEach+nFilesEach,7));
y_data = double(zeros(nFilesEach+nFilesEach,1));

xy_data = double(zeros(nFilesEach+nFilesEach,8));

for i =1:(nFilesEach)
% #1 & 2: CHI-------------------------------------------------
% y = cat
    x_data(i,1) = chiCatSampleImageTopAgainstCats{i};
    x_data(i,2) = chiCatSampleImageTopAgainstDogs{i}; 
    
% y = dog 
    x_data(i+25,1) = chiDogSampleImageTopAgainstCats{i};
    x_data(i+25,2) = chiDogSampleImageTopAgainstDogs{i};
    
    
    
% #3: GRAY MEAN CORNER----------------------------------------
% y = cat 
    x_data(i,3) = catSampleAvgGrayCorn1{i};
% y = dog 
    x_data(i+25,3) = dogSampleAvgGrayCorn1{i};
    
    
    
% #4: EDGE BOTTOM PIXELS--------------------------------------
% y = cat 
    x_data(i,4) = edges_CatBotPixelCount{i};
% y = dog 
    x_data(i+25,4) = edges_DogBotPixelCount{i};
    
    
% #5: RGB Center White Pixels----------------------------
% y = cat 
    x_data(i,5) = whiteThreshedPixels_cat{i};
% y = dog 
    x_data(i+25,5) = whiteThreshedPixels_dog{i};
    
        
% #6: Skewness-------------------------------------------
% y = cat 
    x_data(i,6) = skew_cats_top{i};
% y = dog 
    x_data(i+25,6) = skew_dogs_top{i};
   
% #7: Kurtosis-------------------------------------------
% y = cat 
    x_data(i,7) = kurtosis_cats_top{i};
% y = dog 
    x_data(i+25,7) = kurtosis_dogs_top{i};
    
       
end

%y fill, cat = 0, dog = 1
for i =1:50
    if i <= 25
        y_data(i,1) = 0;
    elseif i >=25
        y_data(i,1) = 1;
    end
end
writematrix(x_data,'x.csv');
writematrix(y_data,'y.csv');


%x and y together in one matrix
for i =1:(nFilesEach)
% #1 & 2: CHI-------------------------------------------------
% y = cat
    xy_data(i,1) = chiCatSampleImageTopAgainstCats{i};
    xy_data(i,2) = chiCatSampleImageTopAgainstDogs{i}; 
    
% y = dog 
    xy_data(i+25,1) = chiDogSampleImageTopAgainstCats{i};
    xy_data(i+25,2) = chiDogSampleImageTopAgainstDogs{i};
    
    
    
% #3: GRAY MEAN CORNER----------------------------------------
% y = cat 
    xy_data(i,3) = catSampleAvgGrayCorn1{i};
% y = dog 
    xy_data(i+25,3) = dogSampleAvgGrayCorn1{i};
    
    
    
% #4: EDGE BOTTOM PIXELS--------------------------------------
% y = cat 
    xy_data(i,4) = edges_CatBotPixelCount{i};
% y = dog 
    xy_data(i+25,4) = edges_DogBotPixelCount{i};
    
    
% #5: RGB Center White Pixels----------------------------
% y = cat 
    xy_data(i,5) = whiteThreshedPixels_cat{i};
% y = dog 
    xy_data(i+25,5) = whiteThreshedPixels_dog{i};
    
        
% #6: Skewness-------------------------------------------
% y = cat 
    xy_data(i,6) = skew_cats_top{i};
% y = dog 
    xy_data(i+25,6) = skew_dogs_top{i};
   
% #7: Kurtosis-------------------------------------------
% y = cat 
    xy_data(i,7) = kurtosis_cats_top{i};
% y = dog 
    xy_data(i+25,7) = kurtosis_dogs_top{i};
    
        
end

for i =1:50
    %y fill, cat = 0, dog = 1  
    if i <= 25
        xy_data(i,8) = 0;
    elseif i >=25
        xy_data(i,8) = 1;
    end
end

writematrix(xy_data,'xyData.csv');


%TEST DATA:
x_data_test = double(zeros(nFilesEach_test+nFilesEach_test,7));
y_data_test = double(zeros(nFilesEach_test+nFilesEach_test,1));

xy_data_test = double(zeros(nFilesEach_test+nFilesEach_test,8));
for i =1:(nFilesEach_test)
% #1 & 2: CHI-------------------------------------------------
% y = cat
    x_data_test(i,1) = chicats_testImageTopAgainstCats{i};
    x_data_test(i,2) = chicats_testImageTopAgainstDogs{i}; 
    
% y = dog 
    x_data_test(i+10,1) = chidogs_testImageTopAgainstCats{i};
    x_data_test(i+10,2) = chidogs_testImageTopAgainstDogs{i};
    
    
    
% #3: GRAY MEAN CORNER----------------------------------------
% y = cat 
    x_data_test(i,3) = catTestAvgGrayCorn1{i};
% y = dog 
    x_data_test(i+10,3) = dogTestAvgGrayCorn1{i};
    
    
    
% #4: EDGE BOTTOM PIXELS--------------------------------------
% y = cat 
    x_data_test(i,4) = catEdgesBotPixelCountTEST{i};
% y = dog 
    x_data_test(i+10,4) = dogEdgesBotPixelCountTEST{i};
    
    
% #5: RGB Center White Pixels----------------------------
% y = cat 
    x_data_test(i,5) = whiteThreshedPixels_cat_test{i};
% y = dog 
    x_data_test(i+10,5) = whiteThreshedPixels_dog_test{i};
    
        
% #6: Skewness-------------------------------------------
% y = cat 
    x_data_test(i,6) = skew_cats_top_test{i};
% y = dog 
    x_data_test(i+10,6) = skew_dogs_top_test{i};
   
% #7: Kurtosis-------------------------------------------
% y = cat 
    x_data_test(i,7) = kurtosis_cats_top_test{i};
% y = dog 
    x_data_test(i+10,7) = kurtosis_dogs_top_test{i};
    
        
end
%y fill, cat = 0, dog = 1
for i =1:20
    if i <= 10
        y_data_test(i,1) = 0;
    elseif i >=10
        y_data_test(i,1) = 1;
    end
end