% Configurations
%
% Author: Jialin Liu
% Email: liujl@sustech.edu.cn
% Website: http://www.liujialin.tech/
% Last revision: 12-Feb-2023
%

addpath('./benchmark/');
addpath('./utils/');
addpath('./optimisers/');
% load benchmark
benchmarkInfo;
% Number of repetitions
configuration.numRuns=30;
configuration.funcIndices=[1:10];%length(benchmark);
configuration.budget=[300000, 300000, 300000, 300000, 3000000, 300000, ...
    20000, 20000, 20000, 20000];
