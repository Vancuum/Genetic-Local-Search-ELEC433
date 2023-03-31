function maxIndex = findMaxIndex(codePop, numCodes)
    maxIndex = 1;
    for i = 1:numCodes
        if height(codePop{i}) > height(codePop{maxIndex})
            maxIndex = i;
        end
    end
end