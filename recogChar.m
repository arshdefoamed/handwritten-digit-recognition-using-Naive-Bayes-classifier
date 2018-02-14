close all hidden;clear;clc; %clear past data
tic; % start timer
importDataFromScratch = false;
imgSetSize = 60000; % training data size
showDemo = true;
if importDataFromScratch
    [trainingImgs,trainingLabels] = readMNIST('train-images.idx3-ubyte', 'train-labels.idx1-ubyte', imgSetSize, 0); % import training data
    probMatrix = generateBernoulliProbabilityMatrix(trainingImgs,trainingLabels); %generate bernoulli probabilities matrix
else
    load('probMatrix.mat');
end
testSetSize = 10000;  % test data size
[testImgs,testLabels] = readMNIST('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte', testSetSize, 0); % import test data
correctCount = 0;
% testing the accuracy of model generated
for imageNumber = 1: testSetSize
    myImg = testImgs(:,:,imageNumber); %convert image into vector
    numb = predictNumber(myImg,probMatrix);
    if(numb==testLabels(imageNumber))
        correctCount = correctCount+1;
    end
end

correctPercentage=(correctCount/testSetSize)*100  % display result in console
%  choosing a random image from test set and predicting its value
if showDemo == true
    imageNumber = randi([1 testSetSize]);
    myImg = testImgs(:,:,imageNumber); %convert image into vector
    numb = predictNumber(myImg,probMatrix);
    imshow(myImg);title(strcat('Calculated value: ',num2str(numb)));
end
toc;   % end timer