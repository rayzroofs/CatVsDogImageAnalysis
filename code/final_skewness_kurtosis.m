close all;
%TOP HISTOGRAMS - SKEWNESS AND KURTOSIS
%sample images
skew_dogs_top = cell(nFilesEach);
skew_cats_top = cell(nFilesEach);
kurtosis_dogs_top  = cell(nFilesEach);
kurtosis_cats_top  = cell(nFilesEach);

%test images
skew_dogs_top_test = cell(nFilesEach_test);
skew_cats_top_test  = cell(nFilesEach_test);
kurtosis_dogs_top_test  = cell(nFilesEach_test);
kurtosis_cats_top_test  = cell(nFilesEach_test);

for i = 1:nFilesEach
    skew_dogs_top{i} = skewness(hist_LBP_MedFilt_DogTop{i});
    skew_cats_top{i} = skewness(hist_LBP_MedFilt_CatTop{i});
    kurtosis_dogs_top{i}  = kurtosis(hist_LBP_MedFilt_DogTop{i});
    kurtosis_cats_top{i} = kurtosis(hist_LBP_MedFilt_CatTop{i});
    
    if i <= nFilesEach_test
        skew_dogs_top_test{i} = skewness(hist_LBP_MedFilt_DogTopTest{i});
        skew_cats_top_test{i} = skewness(hist_LBP_MedFilt_CatTopTest{i});
        kurtosis_dogs_top_test{i}  = kurtosis(hist_LBP_MedFilt_DogTopTest{i});
        kurtosis_cats_top_test {i} = kurtosis(hist_LBP_MedFilt_CatTopTest{i});
    end
end

skew_avg_dogs = sum([skew_dogs_top{:}])/nFilesEach;
skew_avg_cats = sum([skew_cats_top{:}])/nFilesEach;
  
kurt_avg_dogs = sum([kurtosis_dogs_top{:}])/nFilesEach; % 161
kurt_avg_cats = sum([kurtosis_cats_top{:}])/nFilesEach; % 243


%SKEW results too similar, will compare to kurtosis
kurt_difference_dogs_results = cell(nFilesEach_test);
kurt_difference_cats_results = cell(nFilesEach_test);
for i = 1:nFilesEach_test
    %Dog Test Images
    kurt_difference_VS_dogs = abs(kurt_avg_dogs - kurtosis_dogs_top_test{i});
    kurt_difference_VS_cats =abs(kurt_avg_cats - kurtosis_dogs_top_test{i});
    
    if kurt_difference_VS_dogs > kurt_difference_VS_cats
        kurt_difference_dogs_results{i} = "cat";
    elseif kurt_difference_VS_dogs < kurt_difference_VS_cats
        kurt_difference_dogs_results{i} = "dog";
    end
    
    %Cat Test Images
    kurt_difference_VS_dogs = abs(kurt_avg_dogs - kurtosis_cats_top_test{i});
    kurt_difference_VS_cats = abs(kurt_avg_cats - kurtosis_cats_top_test{i});
    
    if kurt_difference_VS_dogs > kurt_difference_VS_cats
        kurt_difference_cats_results{i} = "cat";    
    elseif kurt_difference_VS_dogs < kurt_difference_VS_cats
        kurt_difference_cats_results{i} = "dog";
    end   
    
end

%SAMPLE IMAGES
kurt_difference_dogs_results_SAMPLE = cell(nFilesEach);
kurt_difference_cats_results_SAMPLE = cell(nFilesEach);
for i = 1:nFilesEach
    %Dog Test Images
    kurt_difference_VS_dogs = abs(kurt_avg_dogs - kurtosis_dogs_top{i});
    kurt_difference_VS_cats =abs(kurt_avg_cats - kurtosis_dogs_top{i});
    
    if kurt_difference_VS_dogs > kurt_difference_VS_cats
        kurt_difference_dogs_results_SAMPLE{i} = "cat";
    elseif kurt_difference_VS_dogs < kurt_difference_VS_cats
        kurt_difference_dogs_results_SAMPLE{i} = "dog";
    end
    
    %Cat Test Images
    kurt_difference_VS_dogs = abs(kurt_avg_dogs - kurtosis_cats_top{i});
    kurt_difference_VS_cats = abs(kurt_avg_cats - kurtosis_cats_top{i});
    
    if kurt_difference_VS_dogs > kurt_difference_VS_cats
        kurt_difference_cats_results_SAMPLE{i} = "cat";    
    elseif kurt_difference_VS_dogs < kurt_difference_VS_cats
        kurt_difference_cats_results_SAMPLE{i} = "dog";
    end   
    
end


    
