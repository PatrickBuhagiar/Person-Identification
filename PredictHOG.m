function [y] = PredictHOG(weightVector, ImageName, parametersFile)

 Params = csvread(parametersFile);
 w = csvread(weightVector);
 image_list = dir([ImageName '*png']);
 boundary_list = dir([ImageName '*txt']);
 n = size(image_list, 1);
 
 x = Compute_feature_vector(Params, '', ImageName, boundary_list, 1);
    for i=1:size(x,1)
        sigm = p([1.0 x(i,:)]*w');
        if sigm >= 0.5
            y = 1;
        else 
            y = 0;
        end
    end
 
end