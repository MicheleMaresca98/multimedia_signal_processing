function [OUT] = get_feature_via_ltp(x, DIVISION)
%GET_FEATURE_VIA_LTB apply colfilt

    % apply filter
    xlow = colfilt(padarray(x,[1 1]),[3 3],'sliding',@LTP_low_cl);

    xupp = colfilt(padarray(x,[1 1]),[3,3],'sliding',@LTP_upp_cl);
    
    % reshaping image
    [M,N] = size(xlow);
    xlow = xlow(2:M-1,2:N-1);
    xupp = xupp(2:M-1,2:N-1);
    
    % getting image features
    hlow = partitioned_histogram(xlow, DIVISION);
    
    hupp = partitioned_histogram(xupp, DIVISION);
    
    OUT=[hupp,hlow];
end

function y = LTP_upp_cl(x)
    t = 0.2;
    a = [1; 128; 64; 2; 0; 32; 4; 8; 16];
    mask = (x - x(5)) <-t;
    b = a.*mask;
    y = sum(b);
end
function y = LTP_low_cl(x)
    t = 0.2;
    a = [1; 128; 64; 2; 0; 32; 4; 8; 16];
    mask = (x - x(5)) >t;
    b = a.*mask;
    y = sum(b);
end
