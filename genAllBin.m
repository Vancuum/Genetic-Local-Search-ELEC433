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

    %Remove all of the elements with weight less than d
end
