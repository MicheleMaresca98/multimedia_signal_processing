function [OUT] = get_train_features(LTP_FLAG, NUM_DIV)
% GET_TRAIN_FREATURES get train features by subject
    OUT = get_features_lables(LTP_FLAG, NUM_DIV, 0);
    OUT = OUT.FEATURES;
end

