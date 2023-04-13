%Generate all binary numbers of a given size
function allBin = genAllBin(n, d)
    allBin = zeros(2^n, n);

    %Generate the final column of the message array
    for i = 1:2^n
        allBin(i,n) = mod(i+1,2); 
    end

    %Generate the rest of the messages
    %Algorithm to generate all binary messages:
    %If the column index is odd, copy the element from [column, row+1]
    %If the column index is even copy the element from [column - 1, row+1]
    for i = n-1:-1:1
            count = 0;
        for j = 1:2^n
          allBin(j,i) = allBin(j-mod(j-1,2)-fix(count./2),i+1);
          count = count + 1;
        end
    end

    %Remove all of the elements with weight less than d
    %Except keep the zero vector(so start at 2)
    i = 2;
    while i <= height(allBin)
        next = allBin(i,:);
        if sum(next) < d
            allBin(i,:) = [];
            i = i-1;
        end
        i = i + 1;
    end
end
