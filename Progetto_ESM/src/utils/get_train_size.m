function [OUT] = get_train_size()
%GET_TRAIN_SIZE get train size
    CONFIG = get_config();
    OUT = CONFIG.CONFIG.NUM_IMAGE - CONFIG.CONFIG.NUM_TEST_IMAGE;
end

