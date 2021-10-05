%READS EYE IMAGES
%CREATES:
%catEyesEdgesAvg
%   -Average Eye LBP and Edge Detection 


close all;
catsEyes = cell(25);
catsEyesRGB = cell(25);
animals(2) = "cat";
commandPrefix = "imresize(rgb2gray(imread('";
commandSuffix = "eye.jpg')),[600 600]);";

commandPrefixRGB = "imresize((imread('";
commandSuffixRGB = "eye.jpg')),[78 78]);";

for fileToLoad = 1:nFilesEach

   %cats     
          command = sprintf('%s%s%d%s', ...           
            commandPrefix, ... 
            animals(2), ...
            fileToLoad, ... 
            commandSuffix);
        catsEyes{fileToLoad} = eval(command);
        
   %cats     
          command = sprintf('%s%s%d%s', ...           
            commandPrefixRGB, ... 
            animals(2), ...
            fileToLoad, ... 
            commandSuffixRGB);
        catsEyesRGB{fileToLoad} = eval(command);
        
        
end

catEyesAvgRGB = zeros(size(catsEyesRGB{1}));
catEyesEdges = cell(nFilesEach);
catEyesEdgesAvg = zeros(size(catsEyes{1}));
for i=1:nFilesEach
    
%CATS EDGES
    x = catsEyes{i};
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

    catEyesEdges{i} = y > 50;
    %figure;
    %imshow(catEyesEdges{i},[]);
    catEyesEdgesAvg = catEyesEdgesAvg + catEyesEdges{i};
    
    catEyesAvgRGB = double(catEyesAvgRGB) + double(catsEyesRGB{i});
end

catEyesEdgesAvg = catEyesEdgesAvg./nFilesEach;
catEyesAvgRGB = uint8(catEyesAvgRGB./nFilesEach);
figure;
imshow(catEyesEdgesAvg);
figure;
imshow(catEyesAvgRGB);

%Filter and Binarize
catEyesEdgesAvg = medfilt2(catEyesEdgesAvg,[3,3]);
%catEyesEdgesAvg = catEyesEdgesAvg > 10/255;
catEyesEdgesAvg = imbinarize(catEyesEdgesAvg);

catEyesEdgesAvg = double(imresize(catEyesEdgesAvg,.13));
figure;
imshow(catEyesEdgesAvg);









