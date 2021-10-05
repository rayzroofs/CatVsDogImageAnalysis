close all;

LbpDog = cell(nFilesEach);
LbpCat = cell(nFilesEach);
%Preallocate/instantiate array for the local binary pattern.
for fileToLoad = 1:nFilesEach
    LbpDog{fileToLoad} = zeros(size(dogs{fileToLoad}));
    LbpCat{fileToLoad} = zeros(size(cats{fileToLoad}));
end



%9X9 LBP
localBinaryPatternImage = zeros(size(dogs{1}));
w0 = zeros(size(dogs{1}));
w1 = zeros(size(dogs{1}));
w2 = zeros(size(dogs{1}));
w3 = zeros(size(dogs{1}));
w4 = zeros(size(dogs{1}));
w5 = zeros(size(dogs{1}));
w6 = zeros(size(dogs{1}));
w7 = zeros(size(dogs{1}));

[rows columns numberOfColorBands] = size(dogs{1});
%LBP math-------------------------------------------------------------------------------------------------------
for fileToLoad = 1:nFilesEach
    for row = 5 : rows - 4
        for col = 5 : columns - 4
        %dogs
    
        %window1
        currRow = row;
        currCol = col-3;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w0(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window2
        currRow = row-3;
        currCol = col-3;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w7(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window3
        currRow = row-3;
        currCol = col;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w6(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window4
        currRow = row-3;
        currCol = col+3;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w5(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window5
        currRow = row;
        currCol = col+3;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w4(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window6
        currRow = row+3;
        currCol = col+3;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w3(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
            
        %window7
        currRow = row+3;
        currCol = col;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w2(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window8
        currRow = row+3;
        currCol = col-3;
        centerPixel = dogs{fileToLoad}(currRow, currCol);
        pixel7=dogs{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w1(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
       % localBinaryPatternImage(row,col) = uint8((w7(row,col)+w6(row,col)+w5(row,col)+w4(row,col)+w3(row,col)+w2(row,col)+w1(row,col)+w0(row,col))/8);
   
        %center window      
        centerPixel = dogs{fileToLoad}(row, col);
        pixel7=w7(row, col) > centerPixel;  
        pixel6=w6(row, col) > centerPixel;   
        pixel5=w5(row, col) > centerPixel;  
        pixel4=w4(row, col) > centerPixel;     
        pixel3=w3(row, col) > centerPixel;    
        pixel2=w2(row, col) > centerPixel;      
        pixel1=w1(row, col) > centerPixel;     
        pixel0=w0(row, col) > centerPixel;       
        LbpDog{fileToLoad}(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        
        %CATS

        %window1
        currRow = row;
        currCol = col-3;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w0(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window2
        currRow = row-3;
        currCol = col-3;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w7(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window3
        currRow = row-3;
        currCol = col;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w6(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window4
        currRow = row-3;
        currCol = col+3;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w5(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window5
        currRow = row;
        currCol = col+3;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w4(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window6
        currRow = row+3;
        currCol = col+3;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w3(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
            
        %window7
        currRow = row+3;
        currCol = col;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w2(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window8
        currRow = row+3;
        currCol = col-3;
        centerPixel = cats{fileToLoad}(currRow, currCol);
        pixel7=cats{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w1(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
       % localBinaryPatternImage(row,col) = uint8((w7(row,col)+w6(row,col)+w5(row,col)+w4(row,col)+w3(row,col)+w2(row,col)+w1(row,col)+w0(row,col))/8);
   
        %center window      
        centerPixel = cats{fileToLoad}(row, col);
        pixel7=w7(row, col) > centerPixel;  
        pixel6=w6(row, col) > centerPixel;   
        pixel5=w5(row, col) > centerPixel;  
        pixel4=w4(row, col) > centerPixel;     
        pixel3=w3(row, col) > centerPixel;    
        pixel2=w2(row, col) > centerPixel;      
        pixel1=w1(row, col) > centerPixel;     
        pixel0=w0(row, col) > centerPixel;       
        LbpCat{fileToLoad}(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
    

        end
    end
 
end  




%DISPLAY
%IMAGES/LBP/FILTER------------------------------------------------------------------------------------------------
LBP_MedFilt_Dog = cell(nFilesEach);
LBP_MedFilt_Cat = cell(nFilesEach);
LBP_MedFilt_Split_dog = cell(nFilesEach,4); %4 sections for each image
LBP_MedFilt_Split_cat = cell(nFilesEach,4); %4 sections for each image
hist_LBP_MedFilt_Dog = cell(nFilesEach);
hist_LBP_MedFilt_Cat = cell(nFilesEach);
hist_LBP_MedFilt_DogTop = cell(nFilesEach);
hist_LBP_MedFilt_CatTop = cell(nFilesEach);
hist_LBP_MedFilt_DogBot = cell(nFilesEach);
hist_LBP_MedFilt_CatBot = cell(nFilesEach);
hist_LBP_MedFilt_DogCorners = cell(nFilesEach,4);
hist_LBP_MedFilt_CatCorners = cell(nFilesEach,4);

dogSampleAvgImageAfterLBPfilt = double(zeros(size(LbpDog{1})));
catSampleAvgImageAfterLBPfilt = double(zeros(size(LbpCat{1})));
for i = 1:nFilesEach

    %FILTERS-------------------------------------------------------------
    LBP_MedFilt_Dog{i} = medfilt2(LbpDog{i},[3,3]);
    LBP_MedFilt_Cat{i} = medfilt2(LbpCat{i},[3,3]);
    %getting average of sample images after processing
    dogSampleAvgImageAfterLBPfilt = dogSampleAvgImageAfterLBPfilt + double(LBP_MedFilt_Dog{i});
    catSampleAvgImageAfterLBPfilt = catSampleAvgImageAfterLBPfilt + double(LBP_MedFilt_Cat{i});

    %Filtered Image Split-------------------------------------------------
    %SIZES same for all images, resized
    LBP_MedFilt_Split_dog{i,1} = LBP_MedFilt_Dog{i}(1:rows/2,1:columns/2); 
    LBP_MedFilt_Split_cat{i,1} = LBP_MedFilt_Cat{i}(1:rows/2,1:columns/2);
    
    LBP_MedFilt_Split_dog{i,2} = LBP_MedFilt_Dog{i}(1:rows/2,(columns/2)+1:columns); 
    LBP_MedFilt_Split_cat{i,2} = LBP_MedFilt_Cat{i}(1:rows/2,(columns/2)+1:columns);
    
    LBP_MedFilt_Split_dog{i,3} = LBP_MedFilt_Dog{i}((rows/2)+1:rows,1:columns/2); 
    LBP_MedFilt_Split_cat{i,3}= LBP_MedFilt_Cat{i}((rows/2)+1:rows,1:columns/2);
        
    LBP_MedFilt_Split_dog{i,4} = LBP_MedFilt_Dog{i}((rows/2)+1:rows,(columns/2)+1:columns);  
    LBP_MedFilt_Split_cat{i,4} = LBP_MedFilt_Cat{i}((rows/2)+1:rows,(columns/2)+1:columns); 
    
    %HISTOGRAMS ON SPLIT---------------------------------------------------
    h1 = hist(LBP_MedFilt_Split_dog{i,1}(:),256);
    h2 = hist(LBP_MedFilt_Split_dog{i,2}(:),256);
    h3 = hist(LBP_MedFilt_Split_dog{i,3}(:),256);
    h4 = hist(LBP_MedFilt_Split_dog{i,4}(:),256);
    h1 = h1./sum(h1);
    h2 = h2./sum(h2);
    h3 = h3./sum(h3);
    h4 = h4./sum(h4);
    
    hist_LBP_MedFilt_Dog{i} = cat(2,h1,h2,h3,h4); %concatenate hists
    hist_LBP_MedFilt_DogTop{i} = cat(2,h1,h2);
    hist_LBP_MedFilt_DogBot{i} = cat(2,h3,h4);
    hist_LBP_MedFilt_DogCorners{i,1} = h1;
    hist_LBP_MedFilt_DogCorners{i,2} = h2;
    hist_LBP_MedFilt_DogCorners{i,3} = h3;
    hist_LBP_MedFilt_DogCorners{i,4} = h4;
   
    
    %HISTOGRAMS ON SPLIT--------------------------------------------------
    h1 = hist(LBP_MedFilt_Split_cat{i,1}(:),256);
    h2 = hist(LBP_MedFilt_Split_cat{i,2}(:),256);
    h3 = hist(LBP_MedFilt_Split_cat{i,3}(:),256);
    h4 = hist(LBP_MedFilt_Split_cat{i,4}(:),256);
    h1 = h1./sum(h1);
    h2 = h2./sum(h2);
    h3 = h3./sum(h3);
    h4 = h4./sum(h4);
   
    
    hist_LBP_MedFilt_Cat{i} = cat(2,h1,h2,h3,h4); %concatenate hists
    hist_LBP_MedFilt_CatTop{i} = cat(2,h1,h2);
    hist_LBP_MedFilt_CatBot{i} = cat(2,h3,h4);
    hist_LBP_MedFilt_CatCorners{i,1} = h1;
    hist_LBP_MedFilt_CatCorners{i,2} = h2;
    hist_LBP_MedFilt_CatCorners{i,3} = h3;
    hist_LBP_MedFilt_CatCorners{i,4} = h4;
    %END
   
end  
close all;

%getting average of sample images after processing
dogSampleAvgImageAfterLBPfilt= uint8(dogSampleAvgImageAfterLBPfilt./nFilesEach);
catSampleAvgImageAfterLBPfilt = uint8(catSampleAvgImageAfterLBPfilt./nFilesEach);



%{
figure;
subplot(2, 2, 1);
imshow(LBP_MedFilt_Split_cat{7,1},[]);
subplot(2, 2, 2);
imshow(LBP_MedFilt_Split_cat{7,2},[]);
subplot(2, 2, 3);
imshow(LBP_MedFilt_Split_cat{7,3},[]);
subplot(2, 2, 4);
imshow(LBP_MedFilt_Split_cat{7,4},[]);


figure;
subplot(2, 2, 1);
imshow(LBP_MedFilt_Split_dog{7,1},[]);
subplot(2, 2, 2);
imshow(LBP_MedFilt_Split_dog{7,2},[]);
subplot(2, 2, 3);
imshow(LBP_MedFilt_Split_dog{7,3},[]);
subplot(2, 2, 4);
imshow(LBP_MedFilt_Split_dog{7,4},[]);
%}


%NEXT STEP - CHI FOR HISTS ------------------------------------------------

%figuring out how many comparisons to make for chi 
q = 1;
for i = 1:nFilesEach
    for j = i:nFilesEach-1
        q = q+1;
    end
end
q = q-1;

%temp = hist_LBP_MedFilt_DogTop{1}(2);
chiDogTop = cell(q);
chiCatTop = cell(q);
chiDogBot = cell(q);
chiCatBot = cell(q);
%chiCatBot = zeros(q,1);

chiDog = zeros(q,1);
chiCat = zeros(q,1);
%CHI Square comparing dog portions/whole to every other dog. Same for cats
chiTempSum = 0;
t = 1;
for i = 1:nFilesEach
    for j = i:nFilesEach-1
        %limit is # of hist values       
        %Dog TOP
        for u = 1: 512
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogTop{i}(u) - hist_LBP_MedFilt_DogTop{j+1}(u))^2) / (hist_LBP_MedFilt_DogTop{i}(u) + hist_LBP_MedFilt_DogTop{j+1}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end        
        end
        chiDogTop{t} = chiTempSum;
        chiTempSum = 0;
        
        %Cat TOP
        for u = 1: 512
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTop{i}(u) - hist_LBP_MedFilt_CatTop{j+1}(u))^2) / (hist_LBP_MedFilt_CatTop{i}(u) + hist_LBP_MedFilt_CatTop{j+1}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end    
        end
        chiCatTop{t} = chiTempSum;
        chiTempSum = 0;
        
        %Dog BOTTOM      
        for u = 1: 512
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogBot{i}(u) - hist_LBP_MedFilt_DogBot{j+1}(u))^2) / (hist_LBP_MedFilt_DogBot{i}(u) + hist_LBP_MedFilt_DogBot{j+1}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end    
        end
        chiDogBot{t} = chiTempSum;
        chiTempSum = 0;
        
        %Cat BOTTOM
        for u = 1: 512
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatBot{i}(u) - hist_LBP_MedFilt_CatBot{j+1}(u))^2) / (hist_LBP_MedFilt_CatBot{i}(u) + hist_LBP_MedFilt_CatBot{j+1}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end    
        end
        chiCatBot{t} = chiTempSum;
        chiTempSum = 0;
        
        %Dog WHOLE (concat)
        for u = 1: 1024
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_Dog{i}(u) - hist_LBP_MedFilt_Dog{j+1}(u))^2)/(hist_LBP_MedFilt_Dog{i}(u) + hist_LBP_MedFilt_Dog{j+1}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end    
        end
        chiDog(t,1) = chiTempSum;
        chiTempSum = 0;
        
        %Cat WHOLE (concat)
        for u = 1: 1024
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_Cat{i}(u) - hist_LBP_MedFilt_Cat{j+1}(u))^2)/(hist_LBP_MedFilt_Cat{i}(u) + hist_LBP_MedFilt_Cat{j+1}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end    
        end
        chiCat(t,1) = chiTempSum;
        chiTempSum = 0;
        t = t+1;
    end
end
t = t-1; %was 1 higher than should be for indexing and average calculation



chiAvgDogTop = (sum([chiDogTop{:}]))/q;
chiAvgCatTop = (sum([chiCatTop{:}]))/q;
chiAvgDogBot = (sum([chiDogBot{:}]))/q;
chiAvgCatBot = (sum([chiCatBot{:}]))/q;
chiAvgDogWhole = (sum(chiDog,'all'))/q; %concatenated hists
chiAvgCatWhole = (sum(chiCat,'all'))/q; %concatenated hists




%CHI CAT/DOG COMPARISONS: TOP, BOT,WHOLE ------------------------------

%WHOLE
chiDogCat = zeros(nFilesEach^2,1);%25x25=625
z = 1;
chiTempSum = 0;
for i = 1:nFilesEach
    for j = 1:nFilesEach
        for u = 1:1024
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_Dog{i}(u) - hist_LBP_MedFilt_Cat{j}(u))^2)/(hist_LBP_MedFilt_Dog{i}(u) + hist_LBP_MedFilt_Cat{j}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end   
        end
        chiDogCat(z,1) = chiTempSum;
        chiTempSum = 0;
        z = z+1;
    end
end
z = z-1; %was 1 higher than should be for indexing and average calculation

%AVERAGE of every chi between dogs and cats
chiAvgDogCat = (sum(chiDogCat,'all'))/z; %concatenated hists

%TOP----------------------------------------------------------
chiDogCatTop = zeros(nFilesEach^2,1);%25x25=625
v = 1;
chiTempSum = 0;
for i = 1:nFilesEach
    for j = 1:nFilesEach
        for u = 1:512
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogTop{i}(u) - hist_LBP_MedFilt_CatTop{j}(u))^2)/(hist_LBP_MedFilt_DogTop{i}(u) + hist_LBP_MedFilt_CatTop{j}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end   
        end
        chiDogCatTop(v,1) = chiTempSum;
        chiTempSum = 0;
        v = v+1;
    end
end
v = v-1; %was 1 higher than should be for indexing and average calculation

%AVERAGE TOP of every chi between dogs and cats
chiAvgDogCatTop = (sum(chiDogCatTop,'all'))/z; %concatenated hists

%BOTTOM----------------------------------------------------------
chiDogCatBot = zeros(nFilesEach^2,1);%25x25=625
b = 1;
chiTempSum = 0;
for i = 1:nFilesEach
    for j = 1:nFilesEach
        for u = 1:512
            chiTempSum = chiTempSum + (((hist_LBP_MedFilt_DogBot{i}(u) - hist_LBP_MedFilt_CatBot{j}(u))^2)/(hist_LBP_MedFilt_DogBot{i}(u) + hist_LBP_MedFilt_CatBot{j}(u)));
            if isnan(chiTempSum) %NaN's amount to 0 if top is 0
                chiTempSum = 0;
            end   
        end
        chiDogCatBot(b,1) = chiTempSum;
        chiTempSum = 0;
        b = b+1;
    end
end
b = b-1; %was 1 higher than should be for indexing and average calculation

%AVERAGE BOTTOM of every chi between dogs and cats
chiAvgDogCatBot = (sum(chiDogCatBot ,'all'))/z; %concatenated hists





%TEST AN IMAGE-----------------------------------------------------

%get Average Histograms of Cats and Dogs, then chi test image with them
%DOGS
hist_LBP_MedFilt_DogAvg = zeros(size(hist_LBP_MedFilt_Dog{1}));
hist_LBP_MedFilt_DogAvgTop = zeros(size(hist_LBP_MedFilt_DogTop{1}));
hist_LBP_MedFilt_DogAvgBot = zeros(size(hist_LBP_MedFilt_DogBot{1}));
hist_LBP_MedFilt_DogAvgCorners = zeros(size(hist_LBP_MedFilt_DogCorners{1}));
for i=1:nFilesEach
    hist_LBP_MedFilt_DogAvg = hist_LBP_MedFilt_DogAvg + hist_LBP_MedFilt_Dog{i};
    hist_LBP_MedFilt_DogAvgTop = hist_LBP_MedFilt_DogAvgTop + hist_LBP_MedFilt_DogTop{i};
    hist_LBP_MedFilt_DogAvgBot = hist_LBP_MedFilt_DogAvgBot + hist_LBP_MedFilt_DogBot{i};
    hist_LBP_MedFilt_DogAvgCorners = hist_LBP_MedFilt_DogAvgCorners + hist_LBP_MedFilt_DogCorners{i};
end
hist_LBP_MedFilt_DogAvg = hist_LBP_MedFilt_DogAvg/nFilesEach;
hist_LBP_MedFilt_DogAvgTop = hist_LBP_MedFilt_DogAvgTop/nFilesEach;
hist_LBP_MedFilt_DogAvgBot = hist_LBP_MedFilt_DogAvgBot/nFilesEach;
%avghistsumtestdog = sum(hist_LBP_MedFilt_DogAvg);
hist_LBP_MedFilt_DogAvgCorners = hist_LBP_MedFilt_DogAvgCorners/nFilesEach;

%CATS
hist_LBP_MedFilt_CatAvg = zeros(size(hist_LBP_MedFilt_Cat{1}));
hist_LBP_MedFilt_CatAvgTop = zeros(size(hist_LBP_MedFilt_CatTop{1}));
hist_LBP_MedFilt_CatAvgBot = zeros(size(hist_LBP_MedFilt_CatBot{1}));
hist_LBP_MedFilt_CatAvgCorners = zeros(size(hist_LBP_MedFilt_CatCorners{1}));
for i=1:nFilesEach
    hist_LBP_MedFilt_CatAvg = hist_LBP_MedFilt_CatAvg + hist_LBP_MedFilt_Cat{i};
    hist_LBP_MedFilt_CatAvgTop = hist_LBP_MedFilt_CatAvgTop + hist_LBP_MedFilt_CatTop{i};
    hist_LBP_MedFilt_CatAvgBot = hist_LBP_MedFilt_CatAvgBot + hist_LBP_MedFilt_CatBot{i};
    hist_LBP_MedFilt_CatAvgCorners = hist_LBP_MedFilt_CatAvgCorners + hist_LBP_MedFilt_CatCorners{i};
end
hist_LBP_MedFilt_CatAvg = hist_LBP_MedFilt_CatAvg/nFilesEach;
hist_LBP_MedFilt_CatAvgTop = hist_LBP_MedFilt_CatAvgTop/nFilesEach;
hist_LBP_MedFilt_CatAvgBot = hist_LBP_MedFilt_CatAvgBot/nFilesEach;
%avghistsumtestcat = sum(hist_LBP_MedFilt_CatAvg);
hist_LBP_MedFilt_CatAvgCorners = hist_LBP_MedFilt_CatAvgCorners/nFilesEach;





%IMAGE TESTS 

%9x9 LBP---------------------------------------
Lbpdogs_test = cell(nFilesEach_test);
Lbpcats_test = cell(nFilesEach_test);
%Preallocate/instantiate array for the local binary pattern.
for fileToLoad = 1:nFilesEach_test
    Lbpdogs_test{fileToLoad} = zeros(size(dogs_test{fileToLoad}));
    Lbpcats_test{fileToLoad} = zeros(size(cats_test{fileToLoad}));
end



[rows columns numberOfColorBands] = size(dogs_test{1});
%LBP math-------------------------------------------------------------------------------------------------------
for fileToLoad = 1:nFilesEach_test
    for row = 5 : rows - 4
        for col = 5 : columns - 4
        %dogs
    
        %window1
        currRow = row;
        currCol = col-3;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w0(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window2
        currRow = row-3;
        currCol = col-3;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w7(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window3
        currRow = row-3;
        currCol = col;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w6(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window4
        currRow = row-3;
        currCol = col+3;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w5(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window5
        currRow = row;
        currCol = col+3;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w4(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window6
        currRow = row+3;
        currCol = col+3;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w3(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
            
        %window7
        currRow = row+3;
        currCol = col;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w2(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window8
        currRow = row+3;
        currCol = col-3;
        centerPixel = dogs_test{fileToLoad}(currRow, currCol);
        pixel7=dogs_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=dogs_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=dogs_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=dogs_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=dogs_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=dogs_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=dogs_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=dogs_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w1(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
       % localBinaryPatternImage(row,col) = uint8((w7(row,col)+w6(row,col)+w5(row,col)+w4(row,col)+w3(row,col)+w2(row,col)+w1(row,col)+w0(row,col))/8);
   
        %center window      
        centerPixel = dogs_test{fileToLoad}(row, col);
        pixel7=w7(row, col) > centerPixel;  
        pixel6=w6(row, col) > centerPixel;   
        pixel5=w5(row, col) > centerPixel;  
        pixel4=w4(row, col) > centerPixel;     
        pixel3=w3(row, col) > centerPixel;    
        pixel2=w2(row, col) > centerPixel;      
        pixel1=w1(row, col) > centerPixel;     
        pixel0=w0(row, col) > centerPixel;       
        Lbpdogs_test{fileToLoad}(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        
        %CATS

        %window1
        currRow = row;
        currCol = col-3;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w0(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window2
        currRow = row-3;
        currCol = col-3;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w7(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window3
        currRow = row-3;
        currCol = col;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w6(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window4
        currRow = row-3;
        currCol = col+3;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w5(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window5
        currRow = row;
        currCol = col+3;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w4(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window6
        currRow = row+3;
        currCol = col+3;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w3(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
            
        %window7
        currRow = row+3;
        currCol = col;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w2(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
        %window8
        currRow = row+3;
        currCol = col-3;
        centerPixel = cats_test{fileToLoad}(currRow, currCol);
        pixel7=cats_test{fileToLoad}(currRow-1, currCol-1) > centerPixel;  
        pixel6=cats_test{fileToLoad}(currRow-1, currCol) > centerPixel;   
        pixel5=cats_test{fileToLoad}(currRow-1, currCol+1) > centerPixel;  
        pixel4=cats_test{fileToLoad}(currRow, currCol+1) > centerPixel;     
        pixel3=cats_test{fileToLoad}(currRow+1, currCol+1) > centerPixel;    
        pixel2=cats_test{fileToLoad}(currRow+1, currCol) > centerPixel;      
        pixel1=cats_test{fileToLoad}(currRow+1, currCol-1) > centerPixel;     
        pixel0=cats_test{fileToLoad}(currRow, currCol-1) > centerPixel;       
        w1(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
        
       % localBinaryPatternImage(row,col) = uint8((w7(row,col)+w6(row,col)+w5(row,col)+w4(row,col)+w3(row,col)+w2(row,col)+w1(row,col)+w0(row,col))/8);
   
        %center window      
        centerPixel = cats_test{fileToLoad}(row, col);
        pixel7=w7(row, col) > centerPixel;  
        pixel6=w6(row, col) > centerPixel;   
        pixel5=w5(row, col) > centerPixel;  
        pixel4=w4(row, col) > centerPixel;     
        pixel3=w3(row, col) > centerPixel;    
        pixel2=w2(row, col) > centerPixel;      
        pixel1=w1(row, col) > centerPixel;     
        pixel0=w0(row, col) > centerPixel;       
        Lbpcats_test{fileToLoad}(row, col) = uint8(...
            pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0);
    

        end
    end
end


%{
figure;
imshow(LbpDog{25},[]);
figure;
imshow(LbpCat{24},[]);
%}

%DISPLAY IMAGES/LBP/FILTER------------------------------------------------------------------------------------------------
LBP_MedFilt_dogs_test = cell(nFilesEach_test);
LBP_MedFilt_cats_test = cell(nFilesEach_test);
LBP_MedFilt_Split_dog_test = cell(nFilesEach_test,4); %4 sections for each image
LBP_MedFilt_Split_cat_test = cell(nFilesEach_test,4); %4 sections for each image
hist_LBP_MedFilt_dogs_test = cell(nFilesEach_test);
hist_LBP_MedFilt_cats_test = cell(nFilesEach_test);
hist_LBP_MedFilt_DogTopTest = cell(nFilesEach_test);
hist_LBP_MedFilt_CatTopTest = cell(nFilesEach_test);
hist_LBP_MedFilt_DogBotTest = cell(nFilesEach_test);
hist_LBP_MedFilt_CatBotTest = cell(nFilesEach_test);

hist_LBP_MedFilt_DogCornersTest = cell(nFilesEach_test,4);
hist_LBP_MedFilt_CatCornersTest = cell(nFilesEach_test,4);
for i = 1:nFilesEach_test
    %DOGS------------------------------------------------------------------------
   
    %FILTERS-------------------------------------------------------------
    LBP_MedFilt_dogs_test{i} = medfilt2(Lbpdogs_test{i},[3,3]);
    LBP_MedFilt_cats_test{i} = medfilt2(Lbpcats_test{i},[3,3]);

    %Filtered Image Split-------------------------------------------------
    %SIZES same for all images, resized
    LBP_MedFilt_Split_dog_test{i,1} = LBP_MedFilt_dogs_test{i}(1:rows/2,1:columns/2); 
    LBP_MedFilt_Split_cat_test{i,1} = LBP_MedFilt_cats_test{i}(1:rows/2,1:columns/2);
    
    LBP_MedFilt_Split_dog_test{i,2} = LBP_MedFilt_dogs_test{i}(1:rows/2,(columns/2)+1:columns); 
    LBP_MedFilt_Split_cat_test{i,2} = LBP_MedFilt_cats_test{i}(1:rows/2,(columns/2)+1:columns);
    
    LBP_MedFilt_Split_dog_test{i,3} = LBP_MedFilt_dogs_test{i}((rows/2)+1:rows,1:columns/2); 
    LBP_MedFilt_Split_cat_test{i,3}= LBP_MedFilt_cats_test{i}((rows/2)+1:rows,1:columns/2);
        
    LBP_MedFilt_Split_dog_test{i,4} = LBP_MedFilt_dogs_test{i}((rows/2)+1:rows,(columns/2)+1:columns);  
    LBP_MedFilt_Split_cat_test{i,4} = LBP_MedFilt_cats_test{i}((rows/2)+1:rows,(columns/2)+1:columns); 
    
    %HISTOGRAMS ON SPLIT---------------------------------------------------
    h1 = hist(LBP_MedFilt_Split_dog_test{i,1}(:),256);
    h2 = hist(LBP_MedFilt_Split_dog_test{i,2}(:),256);
    h3 = hist(LBP_MedFilt_Split_dog_test{i,3}(:),256);
    h4 = hist(LBP_MedFilt_Split_dog_test{i,4}(:),256);
    h1 = h1./sum(h1);
    h2 = h2./sum(h2);
    h3 = h3./sum(h3);
    h4 = h4./sum(h4);
    
    hist_LBP_MedFilt_dogs_test{i} = cat(2,h1,h2,h3,h4); %concatenate hists
    hist_LBP_MedFilt_DogTopTest{i} = cat(2,h1,h2);
    hist_LBP_MedFilt_DogBotTest{i} = cat(2,h3,h4);
    
    hist_LBP_MedFilt_DogCornersTest{i,1} = h1;
    hist_LBP_MedFilt_DogCornersTest{i,2} = h2;
    hist_LBP_MedFilt_DogCornersTest{i,3} = h3;
    hist_LBP_MedFilt_DogCornersTest{i,4} = h4;


    %HISTOGRAMS ON SPLIT--------------------------------------------------
    h1 = hist(LBP_MedFilt_Split_cat_test{i,1}(:),256);
    h2 = hist(LBP_MedFilt_Split_cat_test{i,2}(:),256);
    h3 = hist(LBP_MedFilt_Split_cat_test{i,3}(:),256);
    h4 = hist(LBP_MedFilt_Split_cat_test{i,4}(:),256);
    h1 = h1./sum(h1);
    h2 = h2./sum(h2);
    h3 = h3./sum(h3);
    h4 = h4./sum(h4);
   
    
    hist_LBP_MedFilt_cats_test{i} = cat(2,h1,h2,h3,h4); %concatenate hists
    hist_LBP_MedFilt_CatTopTest{i} = cat(2,h1,h2);
    hist_LBP_MedFilt_CatBotTest{i} = cat(2,h3,h4);
    
    hist_LBP_MedFilt_CatCornersTest{i,1} = h1;
    hist_LBP_MedFilt_CatCornersTest{i,2} = h2;
    hist_LBP_MedFilt_CatCornersTest{i,3} = h3;
    hist_LBP_MedFilt_CatCornersTest{i,4} = h4;
    %END
    %CATS----------------------------------------------------------------
   
end  


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
chiCatSampleImageTopAgainstDogs = cell(nFilesEach_test);
chiCatSampleImageTopAgainstCats = cell(nFilesEach_test);
for i = 1:nFilesEach_test
    chiTempSum = 0;
    for u = 1: 512       
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTop{i}(u) - hist_LBP_MedFilt_DogAvgTop(u))^2) / (hist_LBP_MedFilt_CatTop{i}(u) + hist_LBP_MedFilt_DogAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chicats_testImageTopAgainstDogs{i}= chiTempSum;
    
    
    chiTempSum = 0;
    for u = 1: 512
        chiTempSum = chiTempSum + (((hist_LBP_MedFilt_CatTop{i}(u) - hist_LBP_MedFilt_CatAvgTop(u))^2) / (hist_LBP_MedFilt_CatTop{i}(u) + hist_LBP_MedFilt_CatAvgTop(u)));
        if isnan(chiTempSum) %NaN's amount to 0 if top is 0
            chiTempSum = 0;
        end        
    end
    chicats_testImageTopAgainstCats{i} = chiTempSum;
    
end

%DOG IMAGE TESTING -------------------------------------------
chiDogSampleImageTopAgainstDogs = cell(nFilesEach_test);
chiDogSampleImageTopAgainstCats = cell(nFilesEach_test);
for i = 1:nFilesEach_test
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






