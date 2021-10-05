close all;
SVMModel = fitcsvm(x_data,y_data);
sv = model.SupportVectors;

gscatter(x_data(:,3),x_data(:,4),y_data)
hold on
plot(sv(:,3),sv(:,4),'ko','MarkerSize',10)
legend('cat','dog','Support Vector')
hold off

prediction = predict(SVMModel,x_data_test);
%score = classperf(y_data_test,prediction);


%CVSVMModel = crossval(SVMModel);
classLoss = kfoldLoss(CVSVMModel)


