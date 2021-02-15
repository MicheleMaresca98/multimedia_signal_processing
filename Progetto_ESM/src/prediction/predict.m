close; clc; clear;
addpath('./../utils');

% parameters
TEST_SIZE = get_test_size();
NUM_SUBJECT = get_num_subject();
NUM_DIV = get_image_division();
LTP_FLAG = isLTP();

% classifier model
MODEL = load('../../data/models/model.mat');
MODEL = MODEL.MODEL;

% get training labels
EXACT_RESP = get_test_lables(LTP_FLAG, NUM_DIV);

% get features struct
FEATURES_TO_TEST = get_test_features(LTP_FLAG, NUM_DIV);

% make prediction
PREDICTED = MODEL.predict(FEATURES_TO_TEST);

% increment success counter
RES = EXACT_RESP - PREDICTED;
success_counter = length(RES(RES==0));

% reporting
fprintf("* ----------------------------------------\n")
fprintf("* Report \n* ----------------------------------------\n");
fprintf("* volti riconosciuti con successo : %d\n", success_counter);
fprintf("* numero di casi di test totali   : %d\n", TEST_SIZE*NUM_SUBJECT);
fprintf("* percentuale di successo         : %d%%  \n", success_counter/(TEST_SIZE*NUM_SUBJECT)*100);
