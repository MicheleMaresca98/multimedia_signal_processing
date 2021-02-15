function [OUT] = get_division_vectorized()
%GET_DIVISON_VECTORIZED 
    CONFIG = get_config();
    OUT = CONFIG.CONFIG.IMAGE_DIVISION;
end

