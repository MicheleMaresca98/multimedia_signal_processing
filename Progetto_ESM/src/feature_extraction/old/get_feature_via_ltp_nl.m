function [OUT] = get_feature_via_ltp_nl(x, DIVISION)
%GET_FEATURE_VIA_TLB Summary of this function goes here
%   Detailed explanation goes here
    xlow = nlfilter(x,[3 3],@LTP_low);
    xupp = nlfilter(x,[3,3],@LTP_upp);
    hlow = partitioned_histogram(xlow, DIVISION);
    hupp = partitioned_histogram(xupp, DIVISION);
    OUT=[hupp,hlow];
end

function mask = LTP_mask(x)
    mask =  zeros(3,3);
    t = 0.2;
    for m = 1:3
        for n = 1:3
            if abs(x(m,n) - x(2,2)) < t
                mask(m,n) = 0;
            elseif (x(m,n) - x(2,2)) <= -t
                mask(m,n) = -1;
            elseif (x(m,n) - x(2,2) ) >= t
                mask(m,n) = 1;
            end
        end
    end
end

function y = LTP_upp(x)
    a = [1 2 4; 128 0 8; 64 32 16];
    upper_pattern = LTP_mask(x)>0;
    b = a.*upper_pattern;
    y = sum(b(:));
end

function y = LTP_low(x)
    a = [1 2 4; 128 0 8; 64 32 16];
    lower_pattern = LTP_mask(x)<0;
    b = a.*lower_pattern;
    y = sum(b(:));
end
