function [x,y] = obtain_training_set(Params,trainingDirectory)

%% Read positive training images path
train_pos_path = [trainingDirectory '\pos\'];
pos_image_list = dir([train_pos_path '*png']);
pos_boundary_list = dir([train_pos_path '*txt']);
n_pos = size(pos_image_list, 1);

%% Read negative training images path

train_neg_path = [trainingDirectory '\neg\'];
neg_image_list = dir([train_neg_path '*png']);
neg_boundary_list = dir([train_neg_path '*txt']);
n_neg = size(neg_image_list, 1);

%% Obtain x (feature vector) and y (expected output)
%for x
pos_feature_vector = Compute_feature_vector(Params, train_pos_path, pos_image_list, pos_boundary_list, n_pos);
neg_feature_vector = Compute_feature_vector(Params, train_neg_path, neg_image_list, neg_boundary_list, n_neg);

%for y
groupsPos = ones([n_pos, 1]);
groupsNeg = zeros([n_neg 1]);

%concatenation
x = vertcat(pos_feature_vector, neg_feature_vector);
x1 = ones(size(x,1), 1);
x = [x1 x];

y = vertcat(groupsPos, groupsNeg);

end