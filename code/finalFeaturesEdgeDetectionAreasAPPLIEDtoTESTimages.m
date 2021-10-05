%Test Images---------------------------------------------------------------
close all;
%CREATES:
%EDGE DETECTION IMAGES ON TEST IMAGES
%   -whole images and corners

edges_Cat_test = cell(nFilesEach_test);
edges_Dog_test = cell(nFilesEach_test);
for i=1:nFilesEach_test
    %DOGS EDGES
    x = dogs_test{i};
    g1=[5,5,5; -3,0,-3; -3,-3,-3];
    g2=[5,5,-3; 5,0,-3; -3,-3,-3];
    g3=[5,-3,-3; 5,0,-3; 5,-3,-3];
    g4=[-3,-3,-3; 5,0,-3; 5,5,-3];
    g5=[-3,-3,-3; -3,0,-3; 5,5,5];
    g6=[-3,-3,-3; -3,0,5;-3,5,5];
    g7=[-3,-3,5; -3,0,5;-3,-3,5];
    g8=[-3,5,5; -3,0,5;-3,-3,-3];


    x1=imfilter(x,g1,'replicate');
    x2=imfilter(x,g2,'replicate');
    x3=imfilter(x,g3,'replicate');
    x4=imfilter(x,g4,'replicate');
    x5=imfilter(x,g5,'replicate');
    x6=imfilter(x,g6,'replicate');
    x7=imfilter(x,g7,'replicate');
    x8=imfilter(x,g8,'replicate');

    y1=max(x1,x2);
    y2=max(y1,x3);
    y3=max(y2,x4);
    y4=max(y3,x5);
    y5=max(y4,x6);
    y6=max(y5,x7);
    y7=max(y6,x8);
    y=y7;
    
    %{
    final = y > 150;
    figure;
    imshow(final,[]);

    final = y > 200;
    figure;
    imshow(final,[]);
    %}
    edges_Dog_test{i} = y > 220;
    %figure;
    %imshow(final,[]);
    
    
    %CATS EDGES
    x = cats_test{i};
    g1=[5,5,5; -3,0,-3; -3,-3,-3];
    g2=[5,5,-3; 5,0,-3; -3,-3,-3];
    g3=[5,-3,-3; 5,0,-3; 5,-3,-3];
    g4=[-3,-3,-3; 5,0,-3; 5,5,-3];
    g5=[-3,-3,-3; -3,0,-3; 5,5,5];
    g6=[-3,-3,-3; -3,0,5;-3,5,5];
    g7=[-3,-3,5; -3,0,5;-3,-3,5];
    g8=[-3,5,5; -3,0,5;-3,-3,-3];


    x1=imfilter(x,g1,'replicate');
    x2=imfilter(x,g2,'replicate');
    x3=imfilter(x,g3,'replicate');
    x4=imfilter(x,g4,'replicate');
    x5=imfilter(x,g5,'replicate');
    x6=imfilter(x,g6,'replicate');
    x7=imfilter(x,g7,'replicate');
    x8=imfilter(x,g8,'replicate');

    y1=max(x1,x2);
    y2=max(y1,x3);
    y3=max(y2,x4);
    y4=max(y3,x5);
    y5=max(y4,x6);
    y6=max(y5,x7);
    y7=max(y6,x8);
    y=y7;
    
    %{
    final = y > 150;
    figure;
    imshow(final,[]);

    final = y > 200;
    figure;
    imshow(final,[]);
    %}
    edges_Cat_test{i} = y > 235;
    %figure;
    %imshow(final,[]);
    
end

%figure;
%imshow(edges_Dog_test{2});

edges_Split_dog_test = cell(nFilesEach,4);
edges_Split_cat_test = cell(nFilesEach,4);
edges_Top_dog_test = cell(nFilesEach);
edges_Top_cat_test = cell(nFilesEach);
edges_Bot_dog_test = cell(nFilesEach);
edges_Bot_cat_test = cell(nFilesEach);


[rows columns numberOfColorBands] = size(edges_Dog_test{1});

%getting CORNERS for TEST Images
%getting TOPS/BOTS for TEST Images
for i = 1: nFilesEach_test
    edges_Split_dog_test{i,1} = edges_Dog_test{i}(1:rows/2,1:columns/2); 
    edges_Split_cat_test{i,1} = edges_Cat_test{i}(1:rows/2,1:columns/2);
    
    edges_Split_dog_test{i,2} = edges_Dog_test{i}(1:rows/2,(columns/2)+1:columns); 
    edges_Split_cat_test{i,2} = edges_Cat_test{i}(1:rows/2,(columns/2)+1:columns);
    
    edges_Split_dog_test{i,3} = edges_Dog_test{i}((rows/2)+1:rows,1:columns/2); 
    edges_Split_cat_test{i,3}= edges_Cat_test{i}((rows/2)+1:rows,1:columns/2);
        
    edges_Split_dog_test{i,4} = edges_Dog_test{i}((rows/2)+1:rows,(columns/2)+1:columns);  
    edges_Split_cat_test{i,4} = edges_Cat_test{i}((rows/2)+1:rows,(columns/2)+1:columns);
    
    edges_Bot_dog_test{i} = edges_Dog_test{i}((rows/2)+1:rows,1:columns);
    edges_Bot_cat_test{i} = edges_Cat_test{i}((rows/2)+1:rows,1:columns);
    edges_Top_dog_test{i} = edges_Dog_test{i}(1:rows/2,1:columns);
    edges_Top_cat_test{i} = edges_Cat_test{i}(1:rows/2,1:columns);  
end


figure;
imshow(edges_Bot_dog_test{2},[]);


%EDGE PIXELS of TEST Images
catEdgesPixelCountTEST = cell(nFilesEach_test);
dogEdgesPixelCountTEST = cell(nFilesEach_test);
for i=1:nFilesEach_test
    catEdgesPixelCountTEST{i} = 0;
    dogEdgesPixelCountTEST{i} = 0;
    for j=1:rows
        for k=1:columns
            catEdgesPixelCountTEST{i} = edges_Cat_test{i}(j,k) + catEdgesPixelCountTEST{i}; % {13035;7959;11896}
            dogEdgesPixelCountTEST{i} = edges_Dog_test{i}(j,k) + dogEdgesPixelCountTEST{i}; % {18106;28864;15215}
        end
    end
end
figure;
imshow(edges_Dog_test{2});

%EDGE CORNER PIXELS of TEST Images
catEdgesCorner1PixelCountTEST = cell(nFilesEach_test);
dogEdgesCorner1PixelCountTEST = cell(nFilesEach_test);
for i=1:nFilesEach_test
    catEdgesCorner1PixelCountTEST{i} = 0;
    dogEdgesCorner1PixelCountTEST{i} = 0;
    for j=1:rows/2
        for k=1:columns/2
            catEdgesCorner1PixelCountTEST{i} = edges_Split_cat_test{i,1}(j,k) + catEdgesCorner1PixelCountTEST{i}; % {3283;1698;8522}
            dogEdgesCorner1PixelCountTEST{i} = edges_Split_dog_test{i,1}(j,k) + dogEdgesCorner1PixelCountTEST{i}; % {3429;7239;3462}
        end
    end
end


%EDGE BOTTOM PIXELS of TEST Images
[rows columns numberOfColorBands] = size(edges_Bot_cat_test{1});
catEdgesBotPixelCountTEST = cell(nFilesEach_test);
dogEdgesBotPixelCountTEST = cell(nFilesEach_test);
for i=1:nFilesEach_test
    catEdgesBotPixelCountTEST{i} = 0;
    dogEdgesBotPixelCountTEST{i} = 0;
    for j=1:rows
        for k=1:columns
            catEdgesBotPixelCountTEST{i} = edges_Bot_cat_test{i}(j,k) + catEdgesBotPixelCountTEST{i}; % {6986;5562;1504}
            dogEdgesBotPixelCountTEST{i} = edges_Bot_dog_test{i}(j,k) + dogEdgesBotPixelCountTEST{i}; % {10865;19443;8833}
        end
    end
end



resultCatBottomEdgeTests = cell(nFilesEach_test);
resultDogBottomEdgeTests = cell(nFilesEach_test);
%Test Predictions on Cat Images
for i = 1:nFilesEach_test
    differenceVsCat = abs(catEdgesBotPixelCountTEST{i} - edges_CatBotPixelAvg);
    differenceVsDog = abs(catEdgesBotPixelCountTEST{i} - edges_DogBotPixelAvg);
    if differenceVsCat < differenceVsDog
        resultCatBottomEdgeTests{i} = "cat";
    elseif differenceVsCat > differenceVsDog
        resultCatBottomEdgeTests{i} = "dog";
    end
end

%Test Predictions on Dog Images
for i = 1:nFilesEach_test
    differenceVsCat = abs(dogEdgesBotPixelCountTEST{i} - edges_CatBotPixelAvg);
    differenceVsDog = abs(dogEdgesBotPixelCountTEST{i} - edges_DogBotPixelAvg);
    if differenceVsCat < differenceVsDog
        resultDogBottomEdgeTests{i} = "cat";
    elseif differenceVsCat > differenceVsDog
        resultDogBottomEdgeTests{i} = "dog";
    end
end





%EDGE BOTTOM PIXELS of SAMPLE Images
[rows columns numberOfColorBands] = size(edges_Bot_cat_test{1});
edges_CatPixelCount = cell(nFilesEach);
edges_DogPixelCount = cell(nFilesEach);



resultCatBottomEdgeSamples = cell(nFilesEach);
resultDogBottomEdgeSamples = cell(nFilesEach);
%Test Predictions on Cat Images
for i = 1:nFilesEach
    differenceVsCat = abs(edges_CatBotPixelCount{i} - edges_CatBotPixelAvg);
    differenceVsDog = abs(edges_CatBotPixelCount{i} - edges_DogBotPixelAvg);
    if differenceVsCat < differenceVsDog
        resultCatBottomEdgeSamples{i} = "cat";
    elseif differenceVsCat > differenceVsDog
        resultCatBottomEdgeSamples{i} = "dog";
    end
end

%Test Predictions on Dog Images
for i = 1:nFilesEach
    differenceVsCat = abs(edges_DogBotPixelCount{i} - edges_CatBotPixelAvg);
    differenceVsDog = abs(edges_DogBotPixelCount{i} - edges_DogBotPixelAvg);
    if differenceVsCat < differenceVsDog
        resultDogBottomEdgeSamples{i} = "cat";
    elseif differenceVsCat > differenceVsDog
        resultDogBottomEdgeSamples{i} = "dog";
    end
end




