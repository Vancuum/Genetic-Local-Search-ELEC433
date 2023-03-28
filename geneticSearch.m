%--------------------------------------------------%          
% Genetic Local Search algorithm to find good codes%
%--------------------------------------------------%

n = 20; %Codeword length
d = 4; %Minimum distance
p = 100; %Population size
%Maximum size for input codes found from taking largest known lower
%bound/10
maxSize = 2616;

%Need to find a more clever way to find successor since the message array
%is currently limiting how large codes we can check since it grows with 2^n
allBin = genAllBin(n);

% Randomly generate input population of codes
codePop = genInitPop(n, p, d, maxSize);

% Search for better codes in the neighbourhood of given codes

% Recombine new codes with old codes to get new population

% Terminate the algorithm

%Search for optimal solutions
function code = localSearch(C_s, n)
%Preallocate enough space for size purposes

code = [C_s, zeros(2^(n-1), n)];
next = zeros(1,n);

    while next ~= ones(1,n)
        if relativeDist(next, code, d) == 0 
            code = [code; next];
        end
        next = successor(next, allBin);
    end
end

%Find the successor of an element
function succ = successor(x, allBin, n)
	%Start with all zeros since this has no predecessor
    succ = zeros(1, n);
	
    for i = 1 : 2^n
	    if succ == x 
			succ = allBin(i+1,:);
			return;
        end
		succ = allBin(i+1,:);
    end
end
	
%Generate all binary numbers of a given size
function allBin = genAllBin(n)
    allBin = zeros(2^n, n);

    %Generate the final column of the message array
    for i = 1:2^n
        allBin(i,n) = mod(i+1,2); 
    end

    %Generate the rest of the messages
    %Algorithm to generate all binary messages:
    %If the column index is odd, copy the element from [column, row+1]
    %If the column index is even copy the element from [column - 1, row+1]
    for j = n-1:-1:1
            count = 0;
        for i = 1:2^n
          allBin(i,j) = allBin(i-mod(i-1,2)-fix(count./2),j+1);
          count = count + 1;
        end
    end
end

