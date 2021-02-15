function [OUT] = get_feature_via_lbp_nl(x,DIVISION)
%GET_FEATURE_VIA_LBP_NL apply nlfilter

    % apply filter
    IMG = nlfilter(x,[3 3],@LBP);
    
    % return feature
    OUT = partitioned_histogram(IMG,DIVISION);
end

function y = LBP(x)
    a = [1 2 4; 128 0 8; 64 32 16];
    mask = (x - x(2,2))>=0;     
    b = a.*mask;
    y = sum(b(:));
end