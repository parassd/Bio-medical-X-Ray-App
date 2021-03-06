clc;
clear all;
%close all;

Image = double(imread('sample1.png'))/255;
%figure, imshow(Image);

%If coloured image, convert it to gray
if size(Image,3)== 3
    GrayImage = rgb2gray(Image);
    %figure, imshow(GrayImage);
    Image = GrayImage;
end

%Median Filter
MedianFilteredImage = medfilt2(Image);
%figure,imshow(MedianFilteredImage);

BilateralFilteredImage = BfilterGray(MedianFilteredImage, 3, 3, 10);
%figure, imshow(BilateralFilteredImage)

%Implementing Canny Edge Detection
BW = edge(BilateralFilteredImage,'log');
figure, imshow(BW);