%REAL TEST ---TOP
%CAT IMAGE TESTING -------------------------------------------
chicats_testImageTopAgainstDogs = cell(nFilesEach_test);
chicats_testImageTopAgainstCats = cell(nFilesEach_test);
for i = 1:nFilesEach_test
    chiTempSum = 0;
    for u = 1: 512       
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTopTest{i}(u) - hist_LBP_MedFilt_DogAvgTop(u))^2) / (hist_LBP_MedFilt_CatTopTest{i}(u) + hist_LBP_MedFilt_DogAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chicats_testImageTopAgainstDogs{i}= chiTempSum;
    
    
    chiTempSum = 0;
    for u = 1: 512
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTopTest{i}(u) - hist_LBP_MedFilt_CatAvgTop(u))^2) / (hist_LBP_MedFilt_CatTopTest{i}(u) + hist_LBP_MedFilt_CatAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chicats_testImageTopAgainstCats{i} = chiTempSum;
    
end





%DOG IMAGE TESTING -------------------------------------------
chidogs_testImageTopAgainstDogs = cell(nFilesEach_test);
chidogs_testImageTopAgainstCats = cell(nFilesEach_test);
for i = 1:nFilesEach_test
    chiTempSum = 0;
    for u = 1: 512       
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogTopTest{i}(u) - hist_LBP_MedFilt_DogAvgTop(u))^2) / (hist_LBP_MedFilt_DogTopTest{i}(u) + hist_LBP_MedFilt_DogAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chidogs_testImageTopAgainstDogs{i}= chiTempSum;
    
    
    chiTempSum = 0;
    for u = 1: 512
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogTopTest{i}(u) - hist_LBP_MedFilt_CatAvgTop(u))^2) / (hist_LBP_MedFilt_DogTopTest{i}(u) + hist_LBP_MedFilt_CatAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chidogs_testImageTopAgainstCats{i} = chiTempSum;
    
end



%TESTING SAMPLE AGAINST AVERAGE OF SAMPLE-----------------------------
%CATS Images
chiCatSampleImageTopAgainstDogs = cell(nFilesEach);
chiCatSampleImageTopAgainstCats = cell(nFilesEach);
for i = 1:nFilesEach
    chiTempSum = 0;
    for u = 1: 512       
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTop{i}(u) - hist_LBP_MedFilt_DogAvgTop(u))^2) / (hist_LBP_MedFilt_CatTop{i}(u) + hist_LBP_MedFilt_DogAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chiCatSampleImageTopAgainstDogs{i}= chiTempSum;
    
    
    chiTempSum = 0;
    for u = 1: 512
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTop{i}(u) - hist_LBP_MedFilt_CatAvgTop(u))^2) / (hist_LBP_MedFilt_CatTop{i}(u) + hist_LBP_MedFilt_CatAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chiCatSampleImageTopAgainstCats{i} = chiTempSum;
    
end

%DOG IMAGE TESTING -------------------------------------------
chiDogSampleImageTopAgainstDogs = cell(nFilesEach);
chiDogSampleImageTopAgainstCats = cell(nFilesEach);
for i = 1:nFilesEach
    chiTempSum = 0;
    for u = 1: 512       
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogTop{i}(u) - hist_LBP_MedFilt_DogAvgTop(u))^2) / (hist_LBP_MedFilt_DogTop{i}(u) + hist_LBP_MedFilt_DogAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chiDogSampleImageTopAgainstDogs{i}= chiTempSum;
    
    
    chiTempSum = 0;
    for u = 1: 512
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogTop{i}(u) - hist_LBP_MedFilt_CatAvgTop(u))^2) / (hist_LBP_MedFilt_DogTop{i}(u) + hist_LBP_MedFilt_CatAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chiDogSampleImageTopAgainstCats{i} = chiTempSum;
    
end

