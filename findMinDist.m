function min = findMinDist(code)
    %Find number of words in the code
    numWords = height(code);
    %Check to see if the code only has the zero vector so it doesn't throw
    %an error. Give it a minimum distance of d so it doesn't make the tests
    %fail.
    if numWords == 1
        min = d;
        return
    end

    min = sum(bitxor(code(1,:),code(2,:)));
    
    %Compare every word with every other word
    for  i = 1:numWords-1
        checkWord = code(i,:);
        
        %Can start from i+1 since we've already compared this word with all
        %words indexed i or less
        for j = i+1:numWords
            %Don't compare a codeword with itself
            next = sum(bitxor(checkWord, code(j, :)));
             %Store the minimum
            if next < min
                min = next;
            end
        end
    end
end
