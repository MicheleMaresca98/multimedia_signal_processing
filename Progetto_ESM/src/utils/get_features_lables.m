function [OUT] = get_features_lables(LTP_FLAG, DIV, test)
    
    % get type by test param
    type = 'train';
    if(test==1)
        type = 'test';
    end

    % algorithm string definition
    ALG = 'LBP';
    if(LTP_FLAG)
        ALG = 'LTP';
    end
    ALG = [ALG '_' num2str(DIV)];
    
    filename = strcat('../../data/feature_tables/features_', ALG);
    filename = strcat(filename, '_', type, '.mat');
    
    % return file
    OUT = load(filename);
end