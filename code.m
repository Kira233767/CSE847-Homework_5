% Homework 5, Principle component analysis
clear, clc; clf;


load('USPS.mat');

A = A';

% % Show some of the imagines
% A2 = reshape(A(:, 1), 16, 16);
% imshow(A2')

% Part I: Apply Principal Component Analysis to the data using  p = 10, 50,
%         100, 200 principal components 

% Mean
mean_A=mean(A, 2);  


% Centralization, get the correlation coefficient matrix
[a, b] = size(A);
X = zeros(a, b);

for i=1 : b  
X( : ,i) = A(:,i)-mean_A;  
end  

Sigma = (X * X')./b;

% Making the eign decomposition to the Sigma, with different number of
% components
[U1, V1] = eigs(Sigma, 10);
[U2, V2] = eigs(Sigma, 50);
[U3, V3] = eigs(Sigma, 100);
[U4, V4] = eigs(Sigma, 200);
Y1 = zeros(10, b);
Y2 = zeros(50, b);
Y3 = zeros(100, b);
Y4 = zeros(200, b);
% The dimension reduction data
for i = 1 : b
    Y1(:, i) = U1' * X(:, i);
    Y2(:, i) = U2' * X(:, i);
    Y3(:, i) = U3' * X(:, i);
    Y4(:, i) = U4' * X(:, i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Part II: Reconstruct the image and compute the error.

% Compute the reconstruct vector
Re_X1 = zeros(a, b);
Re_X2 = zeros(a, b);
Re_X3 = zeros(a, b);
Re_X4 = zeros(a, b);
for i = 1 : b  
 Re_X1(:, i) = U1 * Y1( :, i) + mean_A;
 Re_X2(:, i) = U2 * Y2( :, i) + mean_A;
 Re_X3(:, i) = U3 * Y3( :, i) + mean_A;
 Re_X4(:, i) = U4 * Y4( :, i) + mean_A;
end  

% Error
E1 = Re_X1 - A;
E2 = Re_X2 - A;
E3 = Re_X3 - A;
E4 = Re_X4 - A;
total_e1 = 0;
total_e2 = 0;
total_e3 = 0;
total_e4 = 0;
for i = 1 : b
    total_e1 = total_e1 + norm(E1(:, i));
    total_e2 = total_e2 + norm(E2(:, i));
    total_e3 = total_e3 + norm(E3(:, i));
    total_e4 = total_e4 + norm(E4(:, i));
end

A3_10 = reshape(Re_X1(:, 1), 16, 16);
A3_50 = reshape(Re_X2(:, 1), 16, 16);
A3_100 = reshape(Re_X3(:, 1), 16, 16);
A3_200 = reshape(Re_X4(:, 1), 16, 16);
figure(1)
imshow(A3_10')
figure(2)
imshow(A3_50')
figure(3)
imshow(A3_100')
figure(4)
imshow(A3_200')

A4_10 = reshape(Re_X1(:, 2), 16, 16);
A4_50 = reshape(Re_X2(:, 2), 16, 16);
A4_100 = reshape(Re_X3(:, 2), 16, 16);
A4_200 = reshape(Re_X4(:, 2), 16, 16);
figure(5)
imshow(A4_10')
figure(6)
imshow(A4_50')
figure(7)
imshow(A4_100')
figure(8)
imshow(A4_200')








