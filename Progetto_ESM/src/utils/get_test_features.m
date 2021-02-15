function [OUT] = get_test_features(LTP_FLAG, NUM_DIV)
%GET_TEST_FEATURES get test features by subject
    OUT = get_features_lables(LTP_FLAG, NUM_DIV, 1);
    OUT = OUT.FEATURES;
end

