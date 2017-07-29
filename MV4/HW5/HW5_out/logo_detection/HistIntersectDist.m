function D = HistIntersectDist( I1, I2, nbins)
%HistIntersectDist
%   Compute the histogram intersection measure for the two given image
%   patches.
%
%Input:
%   I1: image patch 1
%   I2: image patch 2
%   nbins: number of bins for histograms
%
%Output:
%   D: Histogram intersection measure (a real number)
%
    if nargin == 2,
        nbins = 20;
    end
    
	D = 0;
    % YOUR CODE STARTS HERE
    H1 = Histogram(I1,nbins);
    H2 = Histogram(I2,nbins);
    for i=1:size(H1,2)
        D = D + min(H1(i),H2(i));
    end
    % YOUR CODE ENDS HERE
end