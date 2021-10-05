%x = im2double(rgb2gray(imread('dogwalk3.jpg')));
close all;
%CREATES:
%EDGE DETECTION IMAGES
%   -whole images and corners
edges_Cat = cell(nFilesEach);
edges_Dog = cell(nFilesEach);
for i=1:nFilesEach
    %DOGS EDGES
    x = dogs{i};
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
    edges_Dog{i} = y > 235;
    %figure;
    %imshow(final,[]);
    
    
    %CATS EDGES
    x = cats{i};


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
    
    edges_Cat{i} = y > 235;
      
end



%Img Split-------------------------------------------------
%SIZES same for all images, resized
edges_Split_dog = cell(nFilesEach,4);
edges_Split_cat = cell(nFilesEach,4);
edges_Top_dog = cell(nFilesEach);
edges_Top_cat = cell(nFilesEach);
edges_Bot_dog = cell(nFilesEach);
edges_Bot_cat = cell(nFilesEach);


[rows columns numberOfColorBands] = size(edges_Dog{1});
%initialize corners and top/bot

%getting CORNERS for SAMPLE Images
%getting TOPS/BOTS for SAMPLE Images
for i = 1: nFilesEach
    edges_Split_dog{i,1} = edges_Dog{i}(1:rows/2,1:columns/2); 
    edges_Split_cat{i,1} = edges_Cat{i}(1:rows/2,1:columns/2);
    
    edges_Split_dog{i,2} = edges_Dog{i}(1:rows/2,(columns/2)+1:columns); 
    edges_Split_cat{i,2} = edges_Cat{i}(1:rows/2,(columns/2)+1:columns);
    
    edges_Split_dog{i,3} = edges_Dog{i}((rows/2)+1:rows,1:columns/2); 
    edges_Split_cat{i,3}= edges_Cat{i}((rows/2)+1:rows,1:columns/2);
        
    edges_Split_dog{i,4} = edges_Dog{i}((rows/2)+1:rows,(columns/2)+1:columns);  
    edges_Split_cat{i,4} = edges_Cat{i}((rows/2)+1:rows,(columns/2)+1:columns);
    
    edges_Bot_dog{i} = edges_Dog{i}((rows/2)+1:rows,1:columns);
    edges_Bot_cat{i} = edges_Cat{i}((rows/2)+1:rows,1:columns);
    edges_Top_dog{i} = edges_Dog{i}(1:rows/2,1:columns);
    edges_Top_cat{i} = edges_Cat{i}(1:rows/2,1:columns);  
end

figure;
imshow(edges_Split_dog{23,1},[]);



figure;
imshow(edges_Top_cat{23},[]);


figure;
imshow(edges_Bot_cat{23},[]);


%AVERAGE Edge Pixels of SAMPLE Images
edges_CatPixelAvg = 0;
edges_DogPixelAvg = 0;
edges_CatPixelCount = cell(nFilesEach);
edges_DogPixelCount =  cell(nFilesEach);
for i=1:nFilesEach
    edges_CatPixelCount{i} = 0;
    edges_DogPixelCount{i} = 0;
    for j=1:rows
        for k=1:columns
            edges_CatPixelCount{i} = edges_Cat{i}(j,k) + edges_CatPixelCount{i};
            edges_DogPixelCount{i} = edges_Dog{i}(j,k) + edges_DogPixelCount{i};
        end
    end
end

for i=1:nFilesEach
    edges_CatPixelAvg = edges_CatPixelAvg + edges_CatPixelCount{i};
    edges_DogPixelAvg = edges_DogPixelAvg + edges_DogPixelCount{i};
end
edges_CatPixelAvg = edges_CatPixelAvg/nFilesEach; %12078.64
edges_DogPixelAvg = edges_DogPixelAvg/nFilesEach; %158623.96


%AVERAGE TOP LEFT CORNER Edge Pixels of Sample Images
edges_CatCorner1PixelAvg = 0;
edges_DogCorner1PixelAvg = 0;
edges_CatCorner1PixelCount = cell(nFilesEach);
edges_DogCorner1PixelCount = cell(nFilesEach);
for i=1:nFilesEach
    edges_CatCorner1PixelCount{i} = 0;
    edges_DogCorner1PixelCount{i} = 0;
    for j=1:rows/2
        for k=1:columns/2
            edges_CatCorner1PixelCount{i} = edges_Split_cat{i,1}(j,k) + edges_CatCorner1PixelCount{i};
            edges_DogCorner1PixelCount{i} = edges_Split_dog{i,1}(j,k) + edges_DogCorner1PixelCount{i};
        end
    end

end

for i=1:nFilesEach
    edges_CatCorner1PixelAvg = edges_CatCorner1PixelAvg + edges_CatCorner1PixelCount{i};
    edges_DogCorner1PixelAvg = edges_DogCorner1PixelAvg + edges_DogCorner1PixelCount{i};
end
edges_CatCorner1PixelAvg = edges_CatCorner1PixelAvg/nFilesEach; %3076.12000000000
edges_DogCorner1PixelAvg = edges_DogCorner1PixelAvg/nFilesEach; %5114.80000000000

%AVERAGE BOTTOM Edge Pixels of Sample Images
edges_CatBotPixelCount = cell(nFilesEach);
edges_DogBotPixelCount = cell(nFilesEach);
edges_CatBotPixelAvg = 0;
edges_DogBotPixelAvg = 0;
[rows columns numberOfColorBands] = size(edges_Bot_cat{1});
for i=1:nFilesEach
    edges_CatBotPixelCount{i} = 0;
    edges_DogBotPixelCount{i} = 0;
    for j=1:rows
        for k=1:columns
            edges_CatBotPixelCount{i} = edges_Bot_cat{i}(j,k) + edges_CatBotPixelCount{i};
            edges_DogBotPixelCount{i} = edges_Bot_dog{i}(j,k) + edges_DogBotPixelCount{i};
        end
    end
end
for i=1:nFilesEach
    edges_CatBotPixelAvg = edges_CatBotPixelAvg + edges_CatBotPixelCount{i};
    edges_DogBotPixelAvg = edges_DogBotPixelAvg + edges_DogBotPixelCount{i};
end
edges_CatBotPixelAvg = edges_CatBotPixelAvg/nFilesEach; %[5,942.96000000000]
edges_DogBotPixelAvg = edges_DogBotPixelAvg/nFilesEach; %[11,923.8400000000]

%edges_CatBotPixelAvg = edges_CatBotPixelAvg/nFilesEach; %[70432.7600000000]
%edges_DogBotPixelAvg = edges_DogBotPixelAvg/nFilesEach; %[158623.960000000]   %SIGNIFICANTLY higher, by 1 whole order, than cat avg

