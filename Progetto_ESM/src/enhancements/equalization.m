function [OUT] = equalization(x)
%EQUALIZATION equalize image x
    
    % parameters
    alpha = 0.1; tau=10;
    
    % stage 1
    y = x./(mean2(abs(x).^alpha))^(1/alpha);
    
    % stage 2
    y = y./(mean2(min(tau,abs(y(:))).^alpha)).^(1/alpha);
    
    % stage 3
    OUT = tau.*tanh(y./tau);
  
end

