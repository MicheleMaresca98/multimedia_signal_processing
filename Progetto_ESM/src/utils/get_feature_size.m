function [OUT] = get_feature_size()
%GET_FEATURE_SIZE check dimension of histogram
    if isLTP()
    
        OUT = 256*2;
    
    else
        
        OUT = 256;
    
    end
    
    OUT = OUT * get_image_division();
    
end

