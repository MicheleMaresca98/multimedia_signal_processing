function [OUT] = get_train_lables(LTP_FLAG, NUM_DIV)
% GET_TRAIN_LABLES get train lables by subject
    OUT = get_features_lables(LTP_FLAG, NUM_DIV, 0);
    OUT = OUT.LABLES;
end

