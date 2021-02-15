function [FEATURES] = get_features_by_imgs(IMGS, LTP_FLAG, BLOCK_SIZE)
%GET_FEATURES_BY_IMGS features extraction by imgs
    
    %init
    FEATURES = zeros(length(IMGS), get_feature_size());

    % foreach train image
    for j=1:length(IMGS)
       
        % calculate
        if(LTP_FLAG)
            FEATURES(j, :) = get_feature_via_ltp(IMGS(j).img, BLOCK_SIZE);
        else    
            FEATURES(j, :) = get_feature_via_lbp(IMGS(j).img, BLOCK_SIZE);
        end
        
    end
    
end

