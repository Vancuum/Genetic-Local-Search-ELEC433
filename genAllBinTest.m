%% Small n
n = 5;
d = 2;

allBin = genAllBin(n,d);
assert(height(allBin) == 27)

%% Larger n & d
n = 10;
d = 4;

allBin = genAllBin(n,d);
assert(height(allBin) == 849, "Expected: 849. Actual: %d", height(allBin));

%% Same d and n
n = 20;
d = 8;

allBin = genAllBin(n,d);
assert(height(allBin) == 2, "Expected: 2. Actual: %d", height(allBin));

fprintf("All tests passed!")