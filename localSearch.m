%Search for optimal solutions
function code = localSearch(C_s, n, d, allBin)
%Preallocate enough space for size purposes
code = [C_s; zeros(2^(n), n)];
count = height(C_s) + 1;
next = [zeros(1,n-d), 1, zeros(1, d-1)];

    while ~isequal(next, ones(1,n)) == 1
        if relativeDist(next, code, d, count) == 1
            code(count, :) = next;
            count = count + 1;
        end
        next = successor(next, n, allBin);
    end

%Cut away extra elements
code(count:2^n+height(C_s), :) = [ ];
end