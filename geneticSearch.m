%--------------------------------------------------%          
% Genetic Local Search algorithm to find good codes%
%--------------------------------------------------%
% n - codeword length
% d - minimum distance
% p - population size
% maxSize - maximum size for starting population(LB/10)
function maxCode = geneticSearch(n,p,d,maxSize,best)
    %Might need to find a more clever way to find successor since the message 
    %array is currently limiting how large codes we can check since it grows 
    %with 2^n. That said, it is also pretty quick. Maybe there is an equally
    %fast(or faster) algorithm that doesn't use memory though.
    allBin = genAllBin(n,d);
    
    % Randomly generate input population of codes
    codePop = genInitPop(n, p, d, maxSize);
    
    for i = 1:50
        % Search for better codes in the neighbourhood of given codes
        for j = 1:p
            codePop{j} = localSearch(codePop{j}, n, d, allBin);
            fprintf("\n")
            fprintf("New Code %d Generated", j)
        end
         
        % Recombine new codes together to vary population
        codePop = recombine(codePop, p, n, d);
        
        % Stop the search if an optimal code is found
        maxCode = codePop{findMaxIndex(codePop, p)};
        if height(maxCode) == best
            fprintf("Upper bound met!")
            return
        end
        fprintf("\n\nGeneration %d completed.Best code: %d\n",i, ...
            height(maxCode))
    end
end


	

