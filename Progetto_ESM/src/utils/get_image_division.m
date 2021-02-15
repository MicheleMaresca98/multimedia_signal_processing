function [OUT] = get_image_division()
%GET_IMAGE_DIVISION 
CONFIG = get_config();
OUT = CONFIG.CONFIG.IMAGE_DIVISION(1)*CONFIG.CONFIG.IMAGE_DIVISION(2);
end

