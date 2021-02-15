close; clc; clear;
addpath('./../utils');

% LTP_FLAG is a boolen, if tre we are using ltp algorithm, if false we are
% using lbp algorithm
LTP_FLAG = isLTP();
TEST_SIZE = get_test_size();
TRAIN_SIZE = get_train_size();
NUM_SUBJECT = get_num_subject();

% get all TRAIN and TEST imgs
TRAIN_IMGS = get_enhanced_train_img(1:NUM_SUBJECT);
TEST_IMGS = get_enhanced_test_img(1:NUM_SUBJECT);

% path to save
PATH = strcat('../../data/feature_tables');

% algorithm string definition
ALG = ['LBP'; 'LTP'];
ALG = [ALG(LTP_FLAG+1, :) '_' num2str(get_image_division())];

% image division
[IMG_ROWS, IMG_COLUMNS] = size(TRAIN_IMGS(1).img);
IMG_DIV = get_division_vectorized();
BLOCK_SIZE = [IMG_ROWS, IMG_COLUMNS]./IMG_DIV; 

% train features
FEATURES = get_features_by_imgs(TRAIN_IMGS, LTP_FLAG, BLOCK_SIZE);
LABLES = repelem(1:10,TRAIN_SIZE).';

% save train feature
FILE_TO_SAVE = [PATH, '/features_', ALG, '_train.mat'];
save(FILE_TO_SAVE, 'FEATURES', 'LABLES');

% test features
FEATURES = get_features_by_imgs(TEST_IMGS, LTP_FLAG, BLOCK_SIZE);
LABLES = repelem(1:10,TEST_SIZE).';

% save test feature
FILE_TO_SAVE = [PATH, '/features_', ALG, '_test.mat'];
save(FILE_TO_SAVE, 'FEATURES', 'LABLES');

