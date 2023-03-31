%% Zero
%Test that we can find the successor of the zero vector
x = [0 0 0 0 0];
n = 5;
allBin = genAllBin(n);
succ = successor(x, n, allBin)
assert(isequal(succ,[0 0 0 0 1]), "Zero Vector Failed");
fprintf("Zero Vector Passed!\n\n")

%% All Ones
% Test that we can find the successor of the ones vector
x = [1 1 1 1];
n = 4;
allBin = genAllBin(n);
succ = successor(x,n, allBin)
assert(isequal(succ, [1 1 1 1]))

%% Random Vector
% Test that we can find the successor of a random vector