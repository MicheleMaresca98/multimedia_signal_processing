function [OUT] = get_feature_via_lbp(x, BLOCK_SIZE)
%GET_FEATURE_VIA_LBP apply colfilt
    
    % apply filter
    IMG = colfilt(padarray(x,[1 1]), [3, 3], 'slinding', @LBP);
    %IMG = colfilt(x, [3, 3], 'slinding', @LBP);
    [M,N] = size(IMG);
    IMG = IMG(2:M-1,2:N-1);
    figure;imshow(IMG,[]); 
    % return feature
    OUT = partitioned_histogram(IMG, BLOCK_SIZE);
    
end

% LBP patch function
function y = LBP(x)
    a = [1; 128; 64; 2; 0; 32; 4; 8; 16];
    mask = (x - x(5,:))>=0;
    b = a.*mask;
    y = sum(b);
end