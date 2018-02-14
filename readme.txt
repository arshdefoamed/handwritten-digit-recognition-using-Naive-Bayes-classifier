This document contains the information pertaining to matlab files related to handwritten digit recognition based on Bayesian Probability model

Following files are available in the project folder along with their uses:
+ Root
|- t10k-labels.idx1-ubyte ---> testing data labels
|- train-labels.idx1-ubyte ---> training data labels
|- t10k-images.idx3-ubyte ---> testing images data
|- train-images.idx3-ubyte ---> training images data
|- calculateProbabilityForGivenNumber.m ---> for given image and probability matrix predict the probability of prediction 	of a given number
|- generateBernoulliProbabilityMatrix.m ---> generate probability matrix by using training data
|- predictNumber.m ---> predict the number from an input image and a probabilit matrix
|- readMNIST.m ---> library to import data from mnist dataset. Downloaded from mathworks.com.[Made a minor change to 	disable removing of padding]
|- recogChar.m ---> *Starting file of the project. Run this file to process everything*
|- probMatrix.mat ---> Processed training data to save execution time.
|- readme.txt ---> documentation for the project

Steps to run the project
1. Open recogChar.m
2. There are two variables in the file that govern the working of the project
	a) importDataFromScratch: If this variable is true, then it imports data from ubyte files and generates probabilty matrix. Else, it imports probMatrix.m [which contains preprocessed probability matrix]from project folder and uses that for later function. If this variable is kept as true, the processing time of the project will be significantly high [aroud 90 seconds on my system as compared to 6 seconds on my system]
	b) showDemo: Selects a random image from the testing data and tries to predict the value from the image. If the value selected is true, randomly selected image will be shown alongwith the predicted value.
3. Run the file. Based on value of above given variables the program will show desired result

Algorithm
1. Import data from training data files [train-images.idx3-ubyte and train-labels.idx1-ubyte] and convert all the extracted images into vectors
2. Using the extracted data, create a 2d matrix P whose elements can be represented as:
	P(i,j) = no. of occurences of 1's in ith pixel/ number of digits labelled as j in data set
3. Import data from testing data files [ t10k-images.idx3-ubyte and t10k-labels.idx1-ubyte]
4. Extract an image from testing data and convert it into a vector X
5. Calculate the probability of occurence of observed vector for each digit 
	P(X|Y=k) = Multiply over i ( (P(i,k)^X(i))*((1-P(i,k))^X(i)) ) 
	where k ranges from 0 to 9
	and i ranges from 1 to size of vector X
6. From set of 10 different values of P(X|Y=k) select the maximum value and predict the corresponding value of k as the predicted value of the given image
7. Check whether the predicted value is same as the value of label extracted from the test data. 
8. Keep track of the count of inconsistent matching and generate the accuracy percentage of the model.
9. If showDemo variable is turned on,select a random image from testing data, predict it's value and show the image alongwith its preicted value.

