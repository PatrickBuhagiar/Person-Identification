function [y] = Predict(weightVector, testingDirectory, parametersFile)
    
    %Index: Imheight, ImLength, groupsize1,groupsize2, #ofbins, blocksize1, blocksize2,
    %overlap1, overlap2, VectorSize, learning rate
    Params = csvread(parametersFile);
    w = csvread(weightVector);
    
    %define # of postive and negative images (just for statistics)
    n_pos = 690;
    n_neg = 1511;
    
    %% Load Images
    train_path = [testingDirectory '\test\'];
    image_list = dir([train_path '*png']);
    boundary_list = dir([train_path '*txt']);
    n = size(image_list, 1);
    
    %% Compute feature vector
    x = Compute_feature_vector(Params, train_path, image_list, boundary_list, n);
    y = zeros(1,size(x,1));
    for i=1:size(x,1)
        sigm = p([1.0 x(i,:)]*w');
        if sigm >= 0.5 %threshold 
            y(i) = 1;
        else 
            y(i) = 0;
        end
    end
    
   %% Statistical results will be outputted to result.txt
    neg = y(1:1511);
    pos = y(1512:end);
    predict_pos = sum(pos(:) == 1);
    predict_neg = sum(neg(:) == 0);
    
    res(1) = ((predict_neg/n_neg)*100);
    res(2) = ((predict_pos/n_pos)*100);
    
    csvwrite('result.txt',res);
    
end