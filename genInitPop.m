%Generate intial code population
function codePop = genInitPop(n, p, d, maxSize)
    %Create all code matrices and fill them with all zeros.
    codePop = createArrays(p, maxSize, n);
    
    %Randomly generate the entries in each matrix
    for i = 1 : p
        numWords = randi(maxSize);
        %Shrink array to have only size required. Need numWords+1 because
        %indexing starts at 1 in MATLAB
        codePop{i}(numWords+1:maxSize, :) = []; 
        
        %Start at 2 so that we include the zero vector in our code
        for j = 2 : numWords
            codePop{i}(j, :) = newWord(codePop{i}, n, d, j);
        end
        fprintf('Code %d finished\n', i)
    end
end

%Create arrays to store generator matrices for the codes
function result = createArrays(nArrays, rows, cols)
    result = cell(1, nArrays);
    for i = 1 : nArrays
        result{i} = zeros(rows, cols);
    end
end

%Randomly generate a codeword that's not already in the code and maintains
%minimum distance requirements
function next = newWord(code, n, d, size)
    %Generate random word that satisfies minimum distance requirements
    next = randi([0,1],1, n);
    while relativeDist(next, code, d, size) == 0
        next = randi([0,1],1, n);
    end
end