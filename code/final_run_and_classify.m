nFilesEach = 25;
nFilesEach_test = 15;
run('final_RGB_Read_and_Split');
run('final_RGB_Read_and_Split_TEST');
run('final_GRAY_Read_and_Split');
run('final_GRAY_Read_and_Split_TEST');
run('Final_LBP_9x9');
run('final_LBP_9x9_Top_Chi');
run('final_GrayAverageValues');
run('finalFeaturesEdgeDetectionAreasAPPLIED');
run('finalFeaturesEdgeDetectionAreasAPPLIEDtoTESTimages');
run('final_RGB_White_Pixel_Count');
run('final_skewness_kurtosis');

close all;
dogs_correct_counter_test = zeros(nFilesEach_test,1);
cats_correct_counter_test = zeros(nFilesEach_test,1);


finalDogTestResult = cell(nFilesEach_test);
finalCatTestResult = cell(nFilesEach_test);

for i = 1:nFilesEach_test
    %LBP Chi
    if chidogs_testImageTopAgainstDogs{i} < chidogs_testImageTopAgainstCats{i}
        dogs_correct_counter_test(i) = dogs_correct_counter_test(i) + 1;
    end
    
    if chicats_testImageTopAgainstCats{i} < chicats_testImageTopAgainstDogs{i}
        cats_correct_counter_test(i) = cats_correct_counter_test(i) + 1;
    end
    
    %Gray Avg
    if abs(dogTestAvgGrayCorn1{i} - dogAvgGrayCorn1) < abs(dogTestAvgGrayCorn1{i} - catAvgGrayCorn1)
        dogs_correct_counter_test(i)=dogs_correct_counter_test(i)+1;
    end
    
    if abs(catTestAvgGrayCorn1{i} - catAvgGrayCorn1) < abs(catTestAvgGrayCorn1{i} - dogAvgGrayCorn1)
        cats_correct_counter_test(i)=cats_correct_counter_test(i)+1;
    end
    
    %Edge Bottom Pixels
    if resultDogBottomEdgeTests{i} == "dog"
        dogs_correct_counter_test(i)=dogs_correct_counter_test(i)+1;
    end
    if resultCatBottomEdgeTests{i} == "cat"
        cats_correct_counter_test(i)=cats_correct_counter_test(i)+1;
    end
    
    %RGB White Count
    if results_whiteThreshedPixels_dog_test{i} == "dog"
        dogs_correct_counter_test(i)=dogs_correct_counter_test(i)+1;
    end
    if results_whiteThreshedPixels_cat_test{i} == "cat"
        cats_correct_counter_test(i)=cats_correct_counter_test(i)+1;
    end
     
    %Kurtosis
    if kurt_difference_dogs_results{i} == "dog"
        dogs_correct_counter_test(i)=dogs_correct_counter_test(i)+1;
    end

    if kurt_difference_cats_results{i} == "cat"
        cats_correct_counter_test(i)=cats_correct_counter_test(i)+1;
    end    
    
    %Tally
    if dogs_correct_counter_test(i) > 2
        finalDogTestResult{i} = "dog";
    else
        finalDogTestResult{i} = "cat";
    end
    
    if cats_correct_counter_test(i) > 2
        finalCatTestResult{i} = "cat";
    else 
        finalCatTestResult{i} = "dog";
    end
end


%16/20 Correct!
% 80% Accuracy


dogs_correct_counter = zeros(nFilesEach,1);
cats_correct_counter = zeros(nFilesEach,1);


finalDogSampleResult = cell(nFilesEach);
finalCatSampleResult = cell(nFilesEach);

for i = 1:nFilesEach
    %LBP Chi
    if chiDogSampleImageTopAgainstDogs{i} < chiDogSampleImageTopAgainstCats{i}
        dogs_correct_counter(i) = dogs_correct_counter(i) + 1;
    end
    
    if chiCatSampleImageTopAgainstCats{i} < chiCatSampleImageTopAgainstDogs{i}
        cats_correct_counter(i) = cats_correct_counter(i) + 1;
    end
    
    %Gray Avg
    if abs(dogSampleAvgGrayCorn1{i} - dogAvgGrayCorn1) < abs(dogSampleAvgGrayCorn1{i} - catAvgGrayCorn1)
        dogs_correct_counter(i)=dogs_correct_counter(i)+1;
    end
    
    if abs(catSampleAvgGrayCorn1{i} - catAvgGrayCorn1) < abs(catSampleAvgGrayCorn1{i} - dogAvgGrayCorn1)
        cats_correct_counter(i)=cats_correct_counter(i)+1;
    end
    
    %Edge Bottom Pixels
    if resultDogBottomEdgeSamples{i} == "dog"
        dogs_correct_counter(i)=dogs_correct_counter(i)+1;
    end
    if resultCatBottomEdgeSamples{i} == "cat"
        cats_correct_counter(i)=cats_correct_counter(i)+1;
    end
    
    %RGB White Count
    if results_whiteThreshedPixels_dog{i} == "dog"
        dogs_correct_counter(i)=dogs_correct_counter(i)+1;
    end
    if results_whiteThreshedPixels_cat{i} == "cat"
        cats_correct_counter(i)=cats_correct_counter(i)+1;
    end
     
    %Kurtosis
    if kurt_difference_dogs_results_SAMPLE{i} == "dog"
        dogs_correct_counter(i)=dogs_correct_counter(i)+1;
    end

    if kurt_difference_cats_results_SAMPLE{i} == "cat"
        cats_correct_counter(i)=cats_correct_counter(i)+1;
    end    
    
    %Tally
    if dogs_correct_counter(i) > 2
        finalDogSampleResult{i} = "dog";
    else
        finalDogSampleResult{i} = "cat";
    end
    
    if cats_correct_counter(i) > 2
        finalCatSampleResult{i} = "cat";
    else 
        finalCatSampleResult{i} = "dog";
    end
end
