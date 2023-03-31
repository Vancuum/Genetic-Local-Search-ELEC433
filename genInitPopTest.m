%% ValidCode
% Generate a random input population matrix and check that it satisfies
% minimum distance requirements
d = 4;
p = 10;
n = 20;

testCode = genInitPop(n, p, d, 2616);

for i = 1:p
    fprintf('Code %d correct!\n', i)
    numWords = height(testCode{i});
    for  j = 1:numWords
        checkWord = testCode{i}(j,:);
        for k = 2:numWords
            %Don't compare a codeword with itself
            if(j ~= k)
                weight = sum(bitxor(checkWord, testCode{i}(k, :)));
                %assert throws an error if the condition is false
                assert(sum(bitxor(checkWord, testCode{i}(k,:))) >= d, ...
                    "Incorrect Codewords in Code %d. Positions: %d and %d\n" ...
                    ,i, j, k);
            end
        end
    end
end






















