function  probMatrix = generateBernoulliProbabilityMatrix(trainingImgs,trainingLabels)
    sampleImg = trainingImgs(:,:,1); % extract sample image to initialise data structure
    labelNumbCount = zeros(10,1);   % initialise array for label number count 
    probMatrix = zeros(size(sampleImg,1)*size(sampleImg,2),10); % initialise probability matrix
    imgSetSize = size(trainingImgs,3);
    for i=1:imgSetSize
        numbVal = trainingLabels(i);
        labelNumbCount(numbVal+1)=labelNumbCount(numbVal+1)+1; % increment count of the instance of the number
        extractedImg = trainingImgs(:,:,i);
        imgVec = extractedImg(:); 
        for j=1:size(imgVec,1)        
            probMatrix(j,numbVal+1) = probMatrix(j,numbVal+1)+  imgVec(j);
        end    
    end
    for i= 1:10
        probMatrix(:,i)=probMatrix(:,i)/labelNumbCount(i);
    end