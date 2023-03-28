%Find the minimum hamming distance between a word and a code
function check = relativeDist(word, code, d, size)
    minDist = sum(word);
    check = 1; %Assume codeword maintains distance requirements
    
    %Start at 2 so we keep the zero vector
    for i = 2:size
        %If minimum distance is too low then the codeword should be
        %discarded
        if minDist < d
            check = 0;
            break
        end
        nextDist = sum(bitxor(word, code(i, :)));
        if nextDist < minDist
            minDist = nextDist;
        end
    end
end