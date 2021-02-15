% configuration
LTP_FLAG = 1;               % 0: LBP, 1: LTP
IMAGE_DIVISION = [4,4];     % 1x1 the algorithm is apllied over the whole img 
NUM_IMAGE = 64;             % total number of img for each subject
NUM_TEST_IMAGE = 10;        % number of img to test fo each subject
NUM_SUBJECT = 10;           % number of subjects

% save settings
CONFIG = struct('LTP_FLAG',LTP_FLAG,'IMAGE_DIVISION',IMAGE_DIVISION,...
    'NUM_IMAGE',NUM_IMAGE,'NUM_TEST_IMAGE',NUM_TEST_IMAGE,...
    'NUM_SUBJECT',NUM_SUBJECT);
FILENAME = '../config.mat';
save(FILENAME,'CONFIG');