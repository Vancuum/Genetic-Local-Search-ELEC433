function bestCodes = recombine(parentPop, p, n, d)
    %Select parent codes
    %Find minimum number of codewords
    min = height(parentPop{1});
    for i = 2:p
        next = height(parentPop{i});
        if (next < min)
            min = next;
        end
    end
    
    %Find average distance between number of codewords in a code
    %and minimum number of codewords over the population
    prob = cell(1, p);
    
    for i =1:p
        %Create probability arrays(see paper for why we construct it this
        %way)
        prob{i}(:, 1:height(parentPop{i})-min+1) = i;
    end
    
    %Put all the different arrays together and scramble the contents so 
    %that we can get a random index
    totProb = [prob{:}];  
    totProb = totProb(randperm(length(totProb))); 

    %Create cell arrays for child codes and preallocate size for speed
    childPop = cell(1, p);
    
    %Make sure to have a step size of 2 so we don't accidentally overwrite 
    %codes
    for i = 1:2:p-1 
        %Find the parent codes that we'd like to use
        parent1 = totProb(randi(length(totProb)));
        nextProb = totProb(totProb~=parent1); %Ensure parents are different
        parent2 = nextProb(randi(length(nextProb)));
        
        %Pre-allocate size for child arrays
        size = height(parentPop{parent1}) + height(parentPop{parent2});
        childPop{i} = zeros(size, n);
        childPop{i + 1} = zeros(size, n);

        %Generate random codeword z and random integer D between 0 and n+d
        z = randi([0,1],1, n);
        D = randi([0,n+d]); %Not sure if this interval should start at 0 or d
        %Create variables to keep track of where we are in each child code
        cnt1 = 1;
        cnt2 = 1;

        %From two new codes. One from all codewords in parent1 with 
        %distance less than or equal to D-d to z and those in parent 2 with
        %distance greater than or equal to D. The other with the same
        %conditions but parent1 and parent2 swapped.
        for j = 1:height(parentPop{parent1})
            next = parentPop{parent1}(j,:);
            if sum(bitxor(next, z)) <= D-d
                childPop{i}(cnt1,:) =  next;
                cnt1 = cnt1+1;
            end
            if sum(bitxor(next, z)) >= D
                childPop{i+1}(cnt2,:) = next;
                cnt2 = cnt2+1;
            end
        end

        for j = 1:height(parentPop{parent2})
            next = parentPop{parent2}(j,:);
            if sum(bitxor(next, z)) >= D
                childPop{i}(cnt1,:) =  next;
                cnt1 = cnt1+1;
            elseif sum(bitxor(next, z)) <= D-d
                childPop{i+1}(cnt2,:) = next;
                cnt2 = cnt2+1;
            end
        end
        
        %Cut away extra zero codewords of childPop arrays
        childPop{i}(cnt1:size, :) = [];
        childPop{i+1}(cnt2:size,:) = [];
    end

    %Select the best p codes out of parent and child codes
    bestCodes = parentPop;
    leastIndex = 1;
    for i = 1:p
        %Find the smallest code stored
        for j = 1:p
            if height(bestCodes{j}) < height(bestCodes{leastIndex})
                leastIndex = j;
            end
        end
        
        if height(childPop{i}) > height(bestCodes{leastIndex})
            bestCodes{leastIndex} = childPop{i};
        end
    end
end