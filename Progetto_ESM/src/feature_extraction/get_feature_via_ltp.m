function [OUT] = get_feature_via_ltp(x, BLOCK_SIZE)
%GET_FEATURE_VIA_LTB apply colfilt

    % set treshold
    th = 0.2;
    x = padarray(x,[1 1]);

    % apply filter
    a = [1; 128; 64; 2; 0; 32; 4; 8; 16];
    mask_down_calc = @(x) sum(a.*(x-x(5)<-th));
    mask_upp_calc = @(x) sum(a.*(x-x(5)>th));
    xlow = colfilt(x, [3 3], 'sliding', @(b) mask_upp_calc(b));
    xupp = colfilt(x, [3 3], 'sliding', @(b) mask_down_calc(b));
    
    % reshaping image
    [M,N] = size(xlow);
    xlow = xlow(2:M-1,2:N-1);
    xupp = xupp(2:M-1,2:N-1);
    
    % getting image features
    hlow = partitioned_histogram(xlow, BLOCK_SIZE);
    hupp = partitioned_histogram(xupp, BLOCK_SIZE);
    OUT=[hupp,hlow];
end
