%% Small Code
% Test that a small code recombines properly
n = 17;
p = 10;
d = 6;
maxSize = 20;

code = geneticSearch(n,p,d,maxSize);

for i = 1:2:p
    min = findMinDist(code{i});
    assert(min >= d, "Code %d failed", i)
end

fprintf("\n\nSmall Code passed!\n");