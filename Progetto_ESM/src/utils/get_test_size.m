function [OUT] = get_test_size()
%GET_TEST_SIZE get test size
    
    CONFIG = get_config();
    OUT = CONFIG.CONFIG.NUM_TEST_IMAGE;
    
end

