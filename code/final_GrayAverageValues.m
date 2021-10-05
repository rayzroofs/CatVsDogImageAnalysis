% Histograms to use:
%histCatAvgTop
%histDogAvgTop
%histCatAvgBot
%histDogAvgBot

%AVERAGE the average histogram of sample images
close all;

%CROPPING - removing border pixels created from LBP earlier
croppedDogSampleAvgImageAfterLBPfilt = zeros(size(dogSampleAvgImageAfterLBPfilt)-10);
croppedCatSampleAvgImageAfterLBPfilt = zeros(size(catSampleAvgImageAfterLBPfilt)-10);


[rows columns numberOfColorBands] = size(croppedDogSampleAvgImageAfterLBPfilt);
for i = 1:rows
    for j = 1: columns
        croppedDogSampleAvgImageAfterLBPfilt(i,j) = dogSampleAvgImageAfterLBPfilt(i+5,j+5);
        croppedCatSampleAvgImageAfterLBPfilt(i,j) = catSampleAvgImageAfterLBPfilt(i+5,j+5);
    end
end


%Average LBP Filtered Img Split-------------------------------------------------
%SIZES same for all images, resized
dogCorn1 = zeros(round(size(croppedDogSampleAvgImageAfterLBPfilt)/4));
dogCorn2 = zeros(round(size(croppedDogSampleAvgImageAfterLBPfilt)/4));
dogCorn3 = zeros(round(size(croppedDogSampleAvgImageAfterLBPfilt)/4));
dogCorn4 = zeros(round(size(croppedDogSampleAvgImageAfterLBPfilt)/4));

catCorn1 = zeros(round(size(croppedCatSampleAvgImageAfterLBPfilt)/4));
catCorn2 = zeros(round(size(croppedCatSampleAvgImageAfterLBPfilt)/4));
catCorn3 = zeros(round(size(croppedCatSampleAvgImageAfterLBPfilt)/4));
catCorn4 = zeros(round(size(croppedCatSampleAvgImageAfterLBPfilt)/4));
for row = 1 : rows/2  
    for col = 1 : columns/2
    %splitImage(col,row) = dog(col,row);
    dogCorn1(row,col) = croppedDogSampleAvgImageAfterLBPfilt(row,col); 
    dogCorn2(row,col) = croppedDogSampleAvgImageAfterLBPfilt(row,col+round(columns/2));
    dogCorn3(row,col) = croppedDogSampleAvgImageAfterLBPfilt(row+round(rows/2),col);
    dogCorn4(row,col) = croppedDogSampleAvgImageAfterLBPfilt(row+round(rows/2),col+round(columns/2));
    
    catCorn1(row,col) = croppedCatSampleAvgImageAfterLBPfilt(row,col); 
    catCorn2(row,col)  = croppedCatSampleAvgImageAfterLBPfilt(row,col+round(columns/2));
    catCorn3(row,col)  = croppedCatSampleAvgImageAfterLBPfilt(row+round(rows/2),col);
    catCorn4(row,col)  = croppedCatSampleAvgImageAfterLBPfilt(row+round(rows/2),col+round(columns/2));
    end     
end

dogTop = zeros(rows/2,columns);
catTop = zeros(rows/2,columns);
for row = 1 : rows/2
    for col = 1 : columns
        dogTop(row,col) = croppedDogSampleAvgImageAfterLBPfilt(row,col);
        catTop(row,col) = croppedCatSampleAvgImageAfterLBPfilt(row,col);
    end
end
%{
figure;
imshow(croppedCatSampleAvgImageAfterLBPfilt,[]);
%}

dogBot = zeros(rows/2,columns);
catBot = zeros(rows/2,columns);

for row = 1 : rows/2
    for col = 1 : columns
        dogBot(row,col) = croppedDogSampleAvgImageAfterLBPfilt(row+rows/2,col);
        catBot(row,col) = croppedCatSampleAvgImageAfterLBPfilt(row+rows/2,col);
    end
end
%figure;
%imshow(dogBot,[]);


%Average Gray Level of LBP Image (average of ITSELF)
dogAvgGray = mean(croppedDogSampleAvgImageAfterLBPfilt(:)); % 133.2521
catAvgGray = mean(croppedCatSampleAvgImageAfterLBPfilt(:)); % 130.2846

dogAvgGrayTop = mean(dogTop(:)); % 141.4848
catAvgGrayTop = mean(catTop(:)); % 125.6243

dogAvgGrayBot = mean(dogBot(:)); % 125.0194
catAvgGrayBot = mean(catBot(:)); % 134.9449

dogAvgGrayCorn1 = mean(dogCorn1(:)); % 144.5718
catAvgGrayCorn1 = mean(catCorn1(:)); % 123.6037

%Test Images---------------------------------------------------------------
%CROPPING - removing border pixels created from LBP earlier
croppedDogTestImageAfterLBPfilt = cell(nFilesEach_test);
croppedCatTestImageAfterLBPfilt = cell(nFilesEach_test);
for i = 1:nFilesEach_test
    croppedDogTestImageAfterLBPfilt{i} = zeros(size(LBP_MedFilt_dogs_test{1})-10);
    croppedCatTestImageAfterLBPfilt{i} = zeros(size(LBP_MedFilt_cats_test{1})-10);
end

[rows columns numberOfColorBands] = size(croppedDogTestImageAfterLBPfilt{1});
for c = 1:nFilesEach_test
    for i = 1:rows
        for j = 1: columns
            croppedDogTestImageAfterLBPfilt{c}(i,j) = LBP_MedFilt_dogs_test{c}(i+5,j+5);
            croppedCatTestImageAfterLBPfilt{c}(i,j) = LBP_MedFilt_cats_test{c}(i+5,j+5);
        end
    end
end

%figure;
%imshow(croppedCatTestImageAfterLBPfilt{3},[]);

%Average LBP Filtered Img Split-------------------------------------------------
%SIZES same for all images, resized

dogTestCorn = cell(nFilesEach_test,4);
catTestCorn = cell(nFilesEach_test,4);
dogTestTop = cell(nFilesEach_test);
catTestTop = cell(nFilesEach_test);
dogTestBot = cell(nFilesEach_test);
catTestBot = cell(nFilesEach_test);

%initialize corners and top/bot
for i = 1:nFilesEach_test
    for j = 1:4       
        dogTestCorn{i,j} = zeros(round(size(croppedDogTestImageAfterLBPfilt{i})/4));
        catTestCorn{i,j} = zeros(round(size(croppedCatTestImageAfterLBPfilt{i})/4));
    end
    dogTestBot{i} = zeros(size(rows/2,columns));
    catTestBot{i} = zeros(size(rows/2,columns));
end

%getting CORNERS for TEST Images
for i = 1: nFilesEach_test
    for row = 1 : rows/2  
        for col = 1 : columns/2
            %splitImage(col,row) = dog(col,row);
            dogTestCorn{i,1}(row,col) = croppedDogTestImageAfterLBPfilt{i}(row,col); 
            dogTestCorn{i,2}(row,col) = croppedDogTestImageAfterLBPfilt{i}(row,col+round(columns/2));
            dogTestCorn{i,3}(row,col) = croppedDogTestImageAfterLBPfilt{i}(row+round(rows/2),col);
            dogTestCorn{i,4}(row,col) = croppedDogTestImageAfterLBPfilt{i}(row+round(rows/2),col+round(columns/2));

            catTestCorn{i,1}(row,col) = croppedCatTestImageAfterLBPfilt{i}(row,col); 
            catTestCorn{i,2}(row,col)  = croppedCatTestImageAfterLBPfilt{i}(row,col+round(columns/2));
            catTestCorn{i,3}(row,col)  = croppedCatTestImageAfterLBPfilt{i}(row+round(rows/2),col);
            catTestCorn{i,4}(row,col)  = croppedCatTestImageAfterLBPfilt{i}(row+round(rows/2),col+round(columns/2));
        end     
    end
end
%figure;
%imshow(dogTestCorn{3,4},[]);

%getting TOPS/BOTS for TEST Images
dogTestTop = cell(nFilesEach_test);
catTestTop = cell(nFilesEach_test);


for i = 1:nFilesEach_test
    dogTestTop{i} = zeros(size(rows/2,columns));
    catTestTop{i} = zeros(size(rows/2,columns));
    for row = 1 : rows/2
        for col = 1 : columns
            dogTestTop{i}(row,col) = croppedDogTestImageAfterLBPfilt{i}(row,col);
            catTestTop{i}(row,col) = croppedCatTestImageAfterLBPfilt{i}(row,col);
        end
    end
end
%figure;
%imshow(catTestTop{3},[]);

dogTestBot = cell(nFilesEach_test);
catTestBot = cell(nFilesEach_test);

for i = 1:nFilesEach_test
    dogTestBot{i} = zeros(size(rows/2,columns));
    catTestBot{i} = zeros(size(rows/2,columns));
    for row = 1 : rows/2
        for col = 1 : columns
            dogTestBot{i}(row,col) = croppedDogTestImageAfterLBPfilt{i}(row+rows/2,col);
            catTestBot{i}(row,col) = croppedCatTestImageAfterLBPfilt{i}(row+rows/2,col);
        end
    end
end
figure;
imshow(catTestBot{3},[]);



%TEST IMAGE Average Gray Level of LBP Image
dogTestAvgGray = cell(nFilesEach_test);
catTestAvgGray = cell(nFilesEach_test);
dogTestAvgGrayTop = cell(nFilesEach_test);
catTestAvgGrayTop = cell(nFilesEach_test);
dogTestAvgGrayBot = cell(nFilesEach_test);
catTestAvgGrayBot = cell(nFilesEach_test);
dogTestAvgGrayCorn1 = cell(nFilesEach_test);
catTestAvgGrayCorn1 = cell(nFilesEach_test);

for i=1:nFilesEach_test
    dogTestAvgGray{i} = mean(croppedDogTestImageAfterLBPfilt{i}(:)); % {137.757193816885;156.664684898930;117.877229488704;139.076361474435;137.284958382878;145.734506539834;140.918596908442;144.725648038050;123.469120095125;151.458489892985}
    catTestAvgGray{i} = mean(croppedCatTestImageAfterLBPfilt{i}(:)); % {130.429524375743;130.706242568371;120.878941736029;152.712092746730;117.932437574316;102.596218787158;111.373733650416;142.952592152200;131.312556480381;133.771747919144}
    
    dogTestAvgGrayTop{i} = mean(dogTestTop{i}(:)); % {139.116456599287;160.664280618312;131.191843043995;136.944233055886;158.236076099881;158.531105826397;154.739429250892;163.579714625446;128.597788347206;165.391343638526}
    catTestAvgGrayTop{i} = mean(catTestTop{i}(:)); % {129.729203329370;126.832960760999;115.318668252081;155.944304399524;114.145873959572;96.6025683709869;107.220570749108;156.558953626635;136.060998810939;130.495291319857}

    dogTestAvgGrayBot{i} = mean(dogTestBot{i}(:)); % {136.397931034483;152.665089179548;104.562615933413;141.208489892985;116.333840665874;132.937907253270;127.097764565993;125.871581450654;118.340451843044;137.525636147444}
    catTestAvgGrayBot{i} = mean(catTestBot{i}(:)); % {131.129845422117;134.579524375743;126.439215219976;149.479881093936;121.719001189061;108.589869203329;115.526896551724;129.346230677765;126.564114149822;137.048204518430}
    
    dogTestAvgGrayCorn1{i} = mean(dogTestCorn{i,1}(:)); %{138.154577883472;173.410606420927;111.700356718193;123.717193816885;168.009655172414;174.941831153389;131.990011890606;158.251177170036;127.586492271106;164.272104637337}
    catTestAvgGrayCorn1{i} = mean(catTestCorn{i,1}(:)); %{118.546397146254;135.434815695600;102.111486325803;159.948204518430;105.272770511296;95.3658977407848;110.503115338882;171.765612366231;133.076242568371;110.724090368609}
end












%sdgfsdfgsssssssssssssssssssss

%SAMPLE Images---------------------------------------------------------------
%CROPPING - removing border pixels created from LBP earlier
croppedDogSample = cell(nFilesEach);
croppedCatSample = cell(nFilesEach);
for i = 1:nFilesEach
    croppedDogSample{i} = zeros(size(LBP_MedFilt_Dog{1})-10);
    croppedCatSample{i} = zeros(size(LBP_MedFilt_Cat{1})-10);
end

[rows columns numberOfColorBands] = size(croppedDogSample{1});
for c = 1:nFilesEach
    for i = 1:rows
        for j = 1: columns
            croppedDogSample{c}(i,j) = LBP_MedFilt_Dog{c}(i+5,j+5);
            croppedCatSample{c}(i,j) = LBP_MedFilt_Cat{c}(i+5,j+5);
        end
    end
end

%figure;
%imshow(croppedCatTestImageAfterLBPfilt{3},[]);

%Average LBP Filtered Img Split-------------------------------------------------
%SIZES same for all images, resized

dogSampleCorn = cell(nFilesEach,4);
catSampleCorn = cell(nFilesEach,4);
dogSampleTop = cell(nFilesEach);
catSampleTop = cell(nFilesEach);
dogSampleBot = cell(nFilesEach);
catSampleBot = cell(nFilesEach);

%initialize corners and top/bot
for i = 1:nFilesEach
    for j = 1:4       
        dogSampleCorn{i,j} = zeros(round(size(croppedDogSample{i})/4));
        catSampleCorn{i,j} = zeros(round(size(croppedCatSample{i})/4));
    end
    dogSampleBot{i} = zeros(size(rows/2,columns));
    catSampleBot{i} = zeros(size(rows/2,columns));
end

%getting CORNERS for Sample Images
for i = 1: nFilesEach
    for row = 1 : rows/2  
        for col = 1 : columns/2
            %splitImage(col,row) = dog(col,row);
            dogSampleCorn{i,1}(row,col) = croppedDogSample{i}(row,col); 
            dogSampleCorn{i,2}(row,col) = croppedDogSample{i}(row,col+round(columns/2));
            dogSampleCorn{i,3}(row,col) = croppedDogSample{i}(row+round(rows/2),col);
            dogSampleCorn{i,4}(row,col) = croppedDogSample{i}(row+round(rows/2),col+round(columns/2));

            catSampleCorn{i,1}(row,col) = croppedCatSample{i}(row,col); 
            catSampleCorn{i,2}(row,col)  = croppedCatSample{i}(row,col+round(columns/2));
            catSampleCorn{i,3}(row,col)  = croppedCatSample{i}(row+round(rows/2),col);
            catSampleCorn{i,4}(row,col)  = croppedCatSample{i}(row+round(rows/2),col+round(columns/2));
        end     
    end
end

%SAMPLE IMAGES Average Gray Level of LBP Images
dogSampleAvgGray = cell(nFilesEach);
catSampleAvgGray = cell(nFilesEach);
dogSampleAvgGrayTop = cell(nFilesEach);
catSampleAvgGrayTop = cell(nFilesEach);
dogSampleAvgGrayBot = cell(nFilesEach);
catSampleAvgGrayBot = cell(nFilesEach);
dogSampleAvgGrayCorn1 = cell(nFilesEach);
catSampleAvgGrayCorn1 = cell(nFilesEach);

for i=1:nFilesEach

    dogSampleAvgGrayCorn1{i} = mean(dogSampleCorn{i,1}(:));
    catSampleAvgGrayCorn1{i} = mean(catSampleCorn{i,1}(:));
end
