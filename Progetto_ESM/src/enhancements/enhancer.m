close; clc; clear;
addpath('./../utils');

% foreach subject
for i=1:get_num_subject()
    
    % reporting
    fprintf("sto processando la cartella => %d\n", i);
    
    % get all images
    TRAIN_IMGS = get_original_train_img(i);
    TEST_IMGS = get_original_test_img(i);
    IMGS = [TRAIN_IMGS; TEST_IMGS];
    
    % path to save
    PATH = strcat('../../data/enhanced_img/', IMGS(1).dir_name, '/');
        
    % foreach image
    for j=1:length(IMGS)
       
        % img to enhance
        ENHANCED_IMG = enhancement_process(IMGS(j).img);
                
        % file to save
        FILE_TO_SAVE = strcat(PATH, IMGS(j).file_name);

        % save the enhanced img
        fid = fopen(FILE_TO_SAVE, 'wb');
        fwrite(fid, ENHANCED_IMG', 'double');
        fclose(fid);

    end
      
end