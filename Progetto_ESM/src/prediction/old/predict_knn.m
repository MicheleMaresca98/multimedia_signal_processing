clc; clear; close;

% test size
test_size = get_test_size();

X = [];
Y = [];
%X = zeros(get_train_size()*10, get_feature_size()*get_image_division());
%Y = zeros(get_train_size()*10, 1);

% foreach subject
for i=1:10
    
    % get features struct
    STRR = get_train_features(i);
    X = [X; STRR.TRAIN_FEATURE.FEATURES];
    Y = [Y; i*(ones(get_train_size(),1))];

end

FEATURES_TO_TEST = [];
EXPECTED = [];
% foreach subject
for i=1:10
    
    % get features struct
    STR = get_test_features(i);
    
    % feature to test
    FEATURES_TO_TEST = [FEATURES_TO_TEST; STR.TEST_FEATURE.FEATURES];
    
    EXPECTED = [EXPECTED; i*(ones(get_test_size(),1))];
end

Z = KNN(FEATURES_TO_TEST, X, Y, 1).';

MASK = Z - EXPECTED
[[1:100]' MASK]
length(MASK(MASK==0))

function resultlabel = KNN(inx,data,labels,k)
    resultlabel = [];
    distanceMat = distChiSq(inx,data);
    [B , IX] = sort(distanceMat,2);
    len = min(k,length(B));
    for i = 1:size(IX,1)
        result = mode(labels(IX(i,1:len)));
        resultlabel = [resultlabel,result];
    end
end

function D = distChiSq( X, Y )
 
    %%% supposedly it's possible to implement this without a loop!
    %% X: vector or matrix; Y: vector or matrix.
    m = size(X,1);  n = size(Y,1);
    mOnes = ones(1,m); D = zeros(m,n);
    for i=1:n
      yi = Y(i,:);  yiRep = yi( mOnes, : );
      s = yiRep + X;    d = yiRep - X;
      D(:,i) = sum( d.^2 ./ (s+eps), 2 );
    end
    D = D/2;
end