%Find the successor of an element
function succ = successor(x, n, allBin)
%     succ = 0;
% 	%Start with all zeros since this has no predecessor
%     if size(x) == 1
%         if(x == 0)
%             succ = 1;
%         else 
%             succ = 0;
%         end
%         return
%     end
%     succ = [succ, successor(x(1,1:n-1), n-1)];

    i = 1 + sum(x.*(2.^[length(x)-1 : -1 : 0]));

    if(i == 2^n)
        succ = ones(1,n);
    else
        succ = allBin(i+1, :);
    end

end