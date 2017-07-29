function isFace = isFace( img )
% Decides if a given image is a human face
%   INPUT:
%       img - a grayscale image, size 120 x 100
%   OUTPUT:
%       isFace - should be true if the image is a human face, false if not.

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                     %
    %                       YOUR PART 4 CODE HERE                         %
    %                                                                     %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Design your own method to decide if the image is a human face
    testImg = img;
    [rawFaceMatrix, ~, ~, ~] = readInFaces();
    meanFace = mean(rawFaceMatrix')';
    dim = size(rawFaceMatrix,2);
    A = rawFaceMatrix - repmat(meanFace,1,dim);
    unrolled = [];
    unrolled(:,1) = (testImg(:) - meanFace); 
    testImg = unrolled;
    isFace = true;
    numComponentsToKeep = 20;
    [prinComponents, weightCols] = doPCA(A, numComponentsToKeep);
    w = prinComponents' * testImg;
    dist =pdist2(weightCols',w','euclidean','Smallest',1);   
  
    if dist < 2500
        isFace = false;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                     %
    %                            END YOUR CODE                            %
    %                                                                     %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end


