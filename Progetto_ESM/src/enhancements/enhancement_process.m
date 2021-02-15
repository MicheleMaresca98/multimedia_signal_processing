function [OUT] = enhancement_process(IN)
    
    % gamma correction
    X = gamma_correction(IN);
    
    % difference of gaussian filter
    X = dog_filter(X);
    
    % equalization
    OUT = equalization(X);
    
end

