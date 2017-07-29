function featuresNorm = NormalizeFeatures(features)
% Normalize image features to have zero mean and unit variance. This
% normalization can cause k-means clustering to perform better.
%
% INPUTS
% features - An array of features for an image. features(i, j, :) is the
%            feature vector for the pixel img(i, j, :) of the original
%            image.
%
% OUTPUTS
% featuresNorm - An array of the same shape as features where each feature
%                has been normalized to have zero mean and unit variance.

    features = double(features);
    featuresNorm = features;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%                                                                              %
%                HINT: The functions mean and std may be useful                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    h = size(features,1);
    w = size(features,2);
    d = size(features,3);
    means = mean(reshape(features,w*h,d));
    stds = std(reshape(features,w*h,d)); 
    for i = 1:h  
        for j = 1:w  
            cur_fij = reshape(features(i,j,:),1,d);
            featuresNorm(i,j,:) = (cur_fij-means)./stds;  
        end  
    end  
end