function featureVector = Compute_feature_vector(Params, train_path, image_list, boundary_list, n)

for i= 1:n,
    i %print index
    if (n==1) %Works for predictHOG.m
        filename= strcat(train_path, [image_list '.png']);
        boundary = csvread(strcat(train_path, [image_list '.txt']));
    else %Works for Predict.m
        filename= strcat(train_path, image_list(i).name);
        boundary = csvread(strcat(train_path, boundary_list(i).name)); 
    end
    I = rgb2gray(im2double(imread(filename))); %convert to grayscale
    I = I(boundary(2):boundary(4), boundary(1):boundary(3)); %crop Image to boundary box
    I = SubSample(I, Params(1), Params(2)); %subsample
    [gradMag, gradDir] = ComputeGradients(I, [-1 0 1]); 
    binned = ComputeHistogram(gradDir, [Params(3), Params(4)], [-180 180], Params(5));
    %param(10) which is feature vector length won't come into effect
    %featureVector(i,:) = SubSample(ContrastNormalize(binned, [Params(6) Params(7)], [Params(8) Params(9)]), 1, Params(10));
    featureVector(i,:) = ContrastNormalize(binned, [Params(6) Params(7)], [Params(8) Params(9)]);
end

end