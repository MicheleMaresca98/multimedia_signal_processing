function [OUT] = gamma_correction(x)
%GAMMA_CORRECTION make gamma correction
    
    % parameters
    alfa = 0.2;
    
    % enhance
    OUT = x.^alfa;
   
end

