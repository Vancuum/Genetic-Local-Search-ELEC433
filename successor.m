%Find the successor of an element
function succ = successor(currentIndex, n, allBin)
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

    currentIndex = currentIndex + 1;

    if(currentIndex == height(allBin))
        succ = ones(1,n);
    else
        succ = allBin(currentIndex, :);
    end

end