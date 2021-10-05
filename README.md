# CatVsDogImageAnalysis
Matlab code analyzing features of cats and dogs, using 25 images of one cat breed and 25 images of one dog breed, with attempts to distinguish the animal.

dogs_sample_images and cats_sample_images contain the original sample images that analysis was done on  

dogs_test_images and cats_test_images contain images that were used in attempts to distinguish the two animals, no images from the sample folders were used here

File order to get to end results:

final_run_and_classify
    - this will run the following MatLab files and store prediction results in "finalDogTestResult" and "finalCatTestResult"


final_RGB_Read_and_Split

final_RGB_Read_and_Split_TEST

final_GRAY_Read_and_Split

final_GRAY_Read_and_Split_TEST

Final_LBP_9x9

Final_LBP_9x9_Top_Chi

final_GrayAverageValues

finalFeaturesEdgeDetectionAreasAPPLIED

finalFeaturesEdgeDetectionAreasAPPLIEDtoTESTimages

finalFeaturesEYES

final_Convolution_EYES

note: finalFeaturesEyesScanTestImages is unused, it was bad code and a poor way to do it, but I included file in email

final_RGB_White_Pixel_Count

final_skewness_kurtosis

final_SVM_Data_Fill

final_SVM_Run
