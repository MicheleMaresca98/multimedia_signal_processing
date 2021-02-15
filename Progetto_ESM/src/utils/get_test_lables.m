function [OUT] = get_test_lables(LTP_FLAG, NUM_DIV)
%GET_TEST_LABLES get test lables by subject
    OUT = get_features_lables(LTP_FLAG, NUM_DIV, 1);
    OUT = OUT.LABLES;
end

