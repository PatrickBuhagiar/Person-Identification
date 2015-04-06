function [w] = TrainHOG(parametersFile, trainingDirectory, outputFile)
    %% Parse Parameters
    %Index: Imheight, ImLength, groupsize1,groupsize2, #ofbins, blocksize1, blocksize2,
    %overlap1, overlap2, VectorSize, learning rate
    Params = csvread(parametersFile);

    %% obtain x and y and compute weights
    [x,y] = obtain_training_set(Params, trainingDirectory);
    w0 = zeros(1,size(x,2)); %base weight
    e = Params(11); %learning rate
    i = 200; %max iteration
    w = compute_weights(x, y, w0, i, e);
    csvwrite(outputFile, w);
end