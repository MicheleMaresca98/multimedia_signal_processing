function [OUT] = get_img(subjects, test, enhanced)
    
    % GET_IMG(subject,test,enhanced) getting images by subject
    % Subject is an integer which identify pearson or an array of subjects
    % Test is boolean, if true we are selecting testing images
    % Enhanced is boolean, if true the images we are selecting are enanched
    % getting all images by suject parameter
    
    % parameters
    LEN_TEST = get_test_size();
    LEN_TRAIN = get_train_size();
    LEN_IMG = LEN_TRAIN + LEN_TEST;
    LEN_SUBJS = length(subjects);
    STEP = round(LEN_IMG/LEN_TEST);
    
    STR = struct('file_name',string,'dir_name',string,'img',zeros(192,168));
    OUT_ROWS = [LEN_IMG-LEN_TEST LEN_TEST];
    OUT_ROWS = OUT_ROWS(test+1);
    OUT(1:OUT_ROWS, 1:LEN_SUBJS) = repmat(STR, OUT_ROWS, LEN_SUBJS);

    % for each subject
    for z=1:length(subjects)

        % get subject
        subject = subjects(z); 

        % selecting directory
        directory = ['original_img'; 'enhanced_img'];
        directory = directory(enhanced+1, :);

        % adding padding
        subject_str = num2str(subject);
        if(subject<10)
            subject_str = strcat('0', subject_str);
        end

        % selecting files
        directory = strcat('../../data/', directory, '/yaleB', subject_str, '/');
        Files = dir(strcat(directory, '*.*'));
        Files = Files(3:length(Files));

        % getting images by test and enhanced parameters
        i = 1; 
        for k=1:length(Files)
            
            % select a test image every STEP times
            if((mod(k,STEP)==0 && test==1) || (mod(k,STEP)~=0 && test==0))
               
               % set record file name
               OUT(i,z).file_name = Files(k).name;
               
               % set record directory name
               OUT(i,z).dir_name = strcat('yaleB', subject_str);
               
               % severals opening modes by image type
               if(enhanced~=1)
                    OUT(i,z).img = double(imread(strcat(directory, OUT(i,z).file_name)));
               else
                    fid = fopen(strcat(directory, OUT(i,z).file_name),'r');
                    OUT(i,z).img = fread(fid, [168 192], 'double').';
                    fclose(fid);
               end
               
               % counter increment
               i = i + 1;

            end

        end

    end
    
    % return the array of imgs
    OUT = OUT(:); 
end

