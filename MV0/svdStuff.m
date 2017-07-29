dark = double(rgb2gray(imread('flower.bmp')));
top_ten = svds(dark,10);
all_singulars = svd(dark);
rankings = 1:1:size(all_singulars,1);
plot(rankings, all_singulars);

[U,S,V] = svd(dark);
tmp_matrix = U*S*V';
imshow(uint8(tmp_matrix));
k = 100;
U_k = U(:,1:k);
V_K = V(:,1:k);
U_tmp = U;
V_tmp = V;
S_tmp = zeros(size(S));
U_tmp(:,1:k) = U_k;
V_tmp(:,1:k) = V_K;
S_tmp(1:k,1:k) = S(1:k,1:k);
tmp_matrix = U_tmp * S_tmp * V_tmp';
imshow(uint8(tmp_matrix));

size(S)

