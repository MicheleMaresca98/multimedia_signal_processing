function [OUT] = isLTP()
%ISLTP check algorithm
CONFIG = get_config();
OUT = CONFIG.CONFIG.LTP_FLAG;
end