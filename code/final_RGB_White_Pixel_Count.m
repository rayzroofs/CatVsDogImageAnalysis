%CREATES:
%BINARIZES TEST images and compares to BINARIZED SAMPLE AVG
%WHITE COUNTER in CENTER
close all;

%IGNORE PREVIOUS TESTSSSSSSSSSSS
%TEST 4
%Get Average RGB Value of region that is above a threshold, trying to find
%white
%IF at least 100 pixels, then dog
RGB_thresh = 235; %if higher than this on all channels, count as white pixel
whitePixelCountThresh = 10; %if white pixel count higher than this, it's a dog

%TEST 4 ON TEST IMAGES
results_whiteThreshedPixels_dog_test = cell(nFilesEach_test);
results_whiteThreshedPixels_cat_test = cell(nFilesEach_test);
whiteThreshedPixels_dog_test = cell(nFilesEach_test);
whiteThreshedPixels_cat_test = cell(nFilesEach_test);
for i = 1:nFilesEach_test 
    
    binaryR = dogsRGB_center_test{i}(:,:,1) > RGB_thresh;
    binaryG = dogsRGB_center_test{i}(:,:,2) > RGB_thresh;
    binaryB = dogsRGB_center_test{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_dog_test{i} = sum(binaryRGBthreshed(:));
    whiteThreshedPixels_dog_test{i} = sum(binaryRGBthreshed(:));
    
    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh
        results_whiteThreshedPixels_dog_test{i} = "dog";
    else
        results_whiteThreshedPixels_dog_test{i} = "cat";
    end
    
    binaryR = catsRGB_center_test{i}(:,:,1) > RGB_thresh;
    binaryG = catsRGB_center_test{i}(:,:,2) > RGB_thresh;
    binaryB = catsRGB_center_test{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_cat_test{i} = sum(binaryRGBthreshed(:));
    whiteThreshedPixels_cat_test{i} = sum(binaryRGBthreshed(:));

    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh
        results_whiteThreshedPixels_cat_test{i} = "dog";
    else
        results_whiteThreshedPixels_cat_test{i} = "cat";
    end
end


%TEST 4 ON SAMPLE IMAGES
results_whiteThreshedPixels_dog= cell(nFilesEach);
results_whiteThreshedPixels_cat = cell(nFilesEach);
whiteThreshedPixels_dog = cell(nFilesEach);
whiteThreshedPixels_cat = cell(nFilesEach);
for i = 1:nFilesEach   
   
    binaryR = dogsRGB_center{i}(:,:,1) > RGB_thresh;
    binaryG = dogsRGB_center{i}(:,:,2) > RGB_thresh;
    binaryB = dogsRGB_center{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_dog_test{i} = sum(binaryRGBthreshed(:));
    whiteThreshedPixels_dog{i} = sum(binaryRGBthreshed(:));

    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh
        results_whiteThreshedPixels_dog{i} = "dog";
    else
        results_whiteThreshedPixels_dog{i} = "cat";
    end
    
    binaryR = catsRGB_center{i}(:,:,1) > RGB_thresh;
    binaryG = catsRGB_center{i}(:,:,2) > RGB_thresh;
    binaryB = catsRGB_center{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_cat_test{i} = sum(binaryRGBthreshed(:));
    whiteThreshedPixels_cat{i} = sum(binaryRGBthreshed(:));

    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh
        results_whiteThreshedPixels_cat{i} = "dog";
    else
        results_whiteThreshedPixels_cat{i} = "cat";
    end
end


testErrors = 0;
for i = 1:nFilesEach_test
    if results_whiteThreshedPixels_cat_test{i} == "dog"
        testErrors = testErrors + 1;
    elseif results_whiteThreshedPixels_dog_test{i} == "cat"
        testErrors = testErrors + 1;
    end
end
sampleErrors = 0;
for i = 1:nFilesEach
    if results_whiteThreshedPixels_cat{i} == "dog"
        sampleErrors = sampleErrors + 1;
    elseif results_whiteThreshedPixels_dog{i} == "cat"
        sampleErrors = sampleErrors + 1;
    end
end
disp(testErrors);
disp(sampleErrors)

%{
exampleTestDifference1 = uint8(abs(double(avgDogsRGB - dogsRGB_test{6})));

%figure;
%imshow(exampleTestDifference1);

exampleTestDifference2 = uint8(abs(double(avgCatsRGB - dogsRGB_test{6})));




%TEST 1
% 0 = CAT, 1 = DOG
% because 0 is black, 1 is white. cats should have more black
%WHICHEVER VALUE HIGHER
centerTestResults_cat = cell(nFilesEach_test);
centerTestResults_dog = cell(nFilesEach_test);
for i = 1:nFilesEach_test
    
    binarizedCenterCat_test = imbinarize(rgb2gray(catsRGB_center_test{i}));
    if (sum(binarizedCenterCat_test(:) == 1)) > (sum(binarizedCenterCat_test(:) == 0))
        centerTestResults_cat{i} = 1;
    else
        centerTestResults_cat{i} = 0;
    end
    
    binarizedCenterDog_test = imbinarize(rgb2gray(dogsRGB_center_test{i}));
    if (sum(binarizedCenterDog_test(:) == 1)) > (sum(binarizedCenterDog_test(:) == 0))
        centerTestResults_dog{i} = 1;
    else
        centerTestResults_dog{i} = 0;
    end

    
end

%TEST 2
%Test with threshold where for it to be cat, must have >70% as ZEROES
%not better
for i = 1:nFilesEach_test
    %CATS
    [dim1, dim2, c] = size(catsRGB_center_test{i});
    percentBlack = double(sum(binarizedCenterCat_test(:) == 0)) / (double(dim1) * double(dim2));
    
    binarizedCenterCat_test = imbinarize(rgb2gray(catsRGB_center_test{i}));
    
    if percentBlack >=.65
        centerTestResults_cat{i} = "cat";
    else
        centerTestResults_cat{i} = "dog";
    end
    %figure;
    %imshow(binarizedCenterCat_test);
    %DOGS
    [dim1, dim2, c] = size(dogsRGB_center_test{i});
    percentBlack = double(sum(binarizedCenterDog_test(:) == 0)) / (double(dim1) * double(dim2));
    binarizedCenterDog_test = imbinarize(rgb2gray(dogsRGB_center_test{i}));
    
    if percentBlack >=.65
        centerTestResults_dog{i} = "cat";
    else
        centerTestResults_dog{i} = "dog";
    end

    
end


%TEST 3
%RGB Test Counting pure whites
for i = 1:nFilesEach_test
    %CATS
    [dim1, dim2, c] = size(catsRGB_center_test{i});
    whiteCountCat = sum(catsRGB_center_test{i}(:) >=170);    

    
    if percentBlack >=.65
        centerTestResults_cat{i} = "cat";
    else
        centerTestResults_cat{i} = "dog";
    end

    %DOGS
    [dim1, dim2, c] = size(dogsRGB_center_test{i});
    whiteCountDog = sum(dogsRGB_center_test{i}(:) >=230);
    
    if percentBlack >=.65
        centerTestResults_dog{i} = "cat";
    else
        centerTestResults_dog{i} = "dog";
    end

    
end
%}








%{
%TEST 4 with WHOLE IMAGES

RGB_thresh = 245;
whitePixelCountThresh_whole_image = 50;

results_whiteThreshedPixels_dog_test_whole_image = cell(nFilesEach_test);
results_whiteThreshedPixels_cat_test_whole_image = cell(nFilesEach_test);
for i = 1:nFilesEach_test 
    
    binaryR = dogsRGB_test{i}(:,:,1) > RGB_thresh;
    binaryG = dogsRGB_test{i}(:,:,2) > RGB_thresh;
    binaryB = dogsRGB_test{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_dog_test{i} = sum(binaryRGBthreshed(:));
    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh_whole_image
        results_whiteThreshedPixels_dog_test_whole_image{i} = "dog";
    else
        results_whiteThreshedPixels_dog_test_whole_image{i} = "cat";
    end
    
    binaryR = catsRGB_test{i}(:,:,1) > RGB_thresh;
    binaryG = catsRGB_test{i}(:,:,2) > RGB_thresh;
    binaryB = catsRGB_test{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_cat_test{i} = sum(binaryRGBthreshed(:));
    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh_whole_image
        results_whiteThreshedPixels_cat_test_whole_image{i} = "dog";
    else
        results_whiteThreshedPixels_cat_test_whole_image{i} = "cat";
    end
end

results_whiteThreshedPixels_dog_whole_image = cell(nFilesEach);
results_whiteThreshedPixels_cat_whole_image = cell(nFilesEach);
for i = 1:nFilesEach   
   
    binaryR = dogsRGB_center{i}(:,:,1) > RGB_thresh;
    binaryG = dogsRGB_center{i}(:,:,2) > RGB_thresh;
    binaryB = dogsRGB_center{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_dog_test{i} = sum(binaryRGBthreshed(:));
    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh_whole_image
        results_whiteThreshedPixels_dog_whole_image{i} = "dog";
    else
        results_whiteThreshedPixels_dog_whole_image{i} = "cat";
    end
    
    binaryR = catsRGB_center{i}(:,:,1) > RGB_thresh;
    binaryG = catsRGB_center{i}(:,:,2) > RGB_thresh;
    binaryB = catsRGB_center{i}(:,:,3) > RGB_thresh;
    binaryRGBthreshed = binaryR & binaryG & binaryB;
    %results_whiteThreshedPixels_cat_test{i} = sum(binaryRGBthreshed(:));
    if sum(binaryRGBthreshed(:)) >= whitePixelCountThresh_whole_image
        results_whiteThreshedPixels_cat_whole_image{i} = "dog";
    else
        results_whiteThreshedPixels_cat_whole_image{i} = "cat";
    end
end

testErrorsWhole = 0;
for i = 1:nFilesEach_test
    if results_whiteThreshedPixels_cat_test_whole_image{i} == "dog"
        testErrorsWhole = testErrorsWhole + 1;
    elseif results_whiteThreshedPixels_dog_test_whole_image{i} == "cat"
        testErrorsWhole = testErrorsWhole + 1;
    end
end
sampleErrorsWhole = 0;
for i = 1:nFilesEach
    if results_whiteThreshedPixels_cat_whole_image{i} == "dog"
        sampleErrorsWhole = sampleErrorsWhole + 1;
    elseif results_whiteThreshedPixels_dog_whole_image{i} == "cat"
        sampleErrorsWhole = sampleErrorsWhole + 1;
    end
end
disp(testErrorsWhole);
disp(sampleErrorsWhole);
%}

