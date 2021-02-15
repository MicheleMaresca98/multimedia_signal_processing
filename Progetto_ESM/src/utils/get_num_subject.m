function [OUT] = get_num_subject()
%GET_NUM_SUBJECT 
    CONFIG = get_config();
    OUT = CONFIG.CONFIG.NUM_SUBJECT;
end

