close; clc; clear;
addpath('./../utils');

% parameters
TRAIN_SIZE = get_train_size();
NUM_SUBJECT = get_num_subject();
NUM_DIV = get_image_division();
LTP_FLAG = isLTP();

% FEATURES
X = get_train_features(LTP_FLAG, NUM_DIV);

% get training labels
Y = get_train_lables(LTP_FLAG, NUM_DIV);

% training model
MODEL = fitcknn(X, Y, 'NumNeighbors', 3, 'Standardize', true);

% model saving
save('../../data/models/model.mat', 'MODEL');