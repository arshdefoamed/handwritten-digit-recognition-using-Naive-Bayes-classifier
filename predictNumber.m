function numb = predictNumber(myImg,probMatrix)
calculatedProbability=zeros(10,1);
for i=1:10
    calculatedProbability(i)= calculateProbabilityForGivenNumber(myImg,probMatrix,i);
end
[maxNum,index]=max(calculatedProbability);
numb=index-1;