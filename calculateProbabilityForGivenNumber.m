function cumulativeProbability  = calculateProbabilityForGivenNumber(img,probMatrix,number)
imgVec = img(:); %convert image into vector
cumulativeProbability =1;
for i=1:size(imgVec,1)
    pixelVal = imgVec(i); %extract pixel value
    prob= probMatrix(i,number); %Find probability of that pixel to be one for the given number
    cumulativeProbability=cumulativeProbability*((prob^pixelVal)*((1-prob)^(1-pixelVal))); %Multiply it with cumulative probability
end
