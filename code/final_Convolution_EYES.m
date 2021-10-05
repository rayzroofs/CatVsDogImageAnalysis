close all;


for i = 1:nFilesEach_test
    catEdgesToSearch = edges_Cat_test{i};
    eyeToFind = catEyesEdgesAvg;

    %montage({catEdgesToSearch,eyeToFind});
    c = normxcorr2(eyeToFind,catEdgesToSearch);
    %surf(c)
    %shading flat

    [ypeak,xpeak] = find(c==max(c(:)));
    %remove padding from sizes
    yoffSet = ypeak-size(eyeToFind,1);
    xoffSet = xpeak-size(eyeToFind,2);
    figure;
    imshow(catEdgesToSearch)
    drawrectangle(gca,'Position',[xoffSet,yoffSet,size(eyeToFind,2),size(eyeToFind,1)], ...
        'FaceAlpha',0);
    %close all;
end