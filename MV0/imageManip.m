%reads in the image, converts it to grayscale, and converts the intensities
%from uint8 integers to doubles. (Brightness must be in 'double' format for
%computations, or else MATLAB will do integer math, which we don't want.)
dark = double(rgb2gray(imread('u2dark.png')));

%%%%%% Your part (a) code here: calculate statistics
maximum_value = max(max(dark));
minimum_value = min(min(dark));
average_value = mean(mean(dark));
%%%%%% Your part (b) code here: apply offset and scaling
fixedimg = (dark - minimum_value)*(256 / (maximum_value-minimum_value));

%displays the image
%imshow(uint8(fixedimg));

%%%%%% Your part (c) code here: apply the formula to increase contrast,
% and display the image
contrasted = uint8(2*(fixedimg - 128)+128);
imshow(contrasted);
