function [OUT] = dog_filter(x)
%DOG_FILTER difference of gaussian
    
    % inner gaussian
    g1 = fspecial('gaussian',[3 3], 1);
    
    % outer gaussian
    g2 = fspecial('gaussian',[3 3], 2);
    
    % band pass filter
    G = g1 - g2;
    
    % apply imfilter
    OUT = imfilter(x, G, 'symmetric', 'same');
end

