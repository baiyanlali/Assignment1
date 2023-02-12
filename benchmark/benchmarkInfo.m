% Information of benchmark
%
% Author: Jialin Liu
% Email: liujl@sustech.edu.cn
% Website: http://www.liujialin.tech/
% Last revision: 12-Feb-2023
%

% Benchmark functions
benchmark(1).funcName={'sphere'};
benchmark(1).description={'Sphere Model'};
benchmark(1).dimension=30;
benchmark(1).bounds=[ -100, 100];
benchmark(1).optimum=zeros(1,benchmark(1).dimension);

benchmark(2).funcName={'rosenbrock'};
benchmark(2).description={'Rosenbrock''s Function'};
benchmark(2).dimension=30;
benchmark(2).bounds=[ -30, 30];
benchmark(2).optimum=zeros(1,benchmark(2).dimension);

benchmark(3).funcName={'step'};
benchmark(3).description={'Step Function'};
benchmark(3).dimension=30;
benchmark(3).bounds=[ -100, 100];
benchmark(3).optimum=zeros(1,benchmark(3).dimension);

benchmark(4).funcName={'noisyQuartic'};
benchmark(4).description={'Noisy Quartic'};
benchmark(4).dimension=30;
benchmark(4).bounds=[ -1.28, 1.28];
benchmark(4).optimum=zeros(1,benchmark(4).dimension);

benchmark(5).funcName={'schwefel226'};
benchmark(5).description={'Schwefel''s Problem 2.26'};
benchmark(5).dimension=30;
benchmark(5).bounds=[ -500, 500];
benchmark(5).optimum=420.9687*ones(1,benchmark(5).dimension);

benchmark(6).funcName={'ackley'};
benchmark(6).description={'Ackley'};
benchmark(6).dimension=30;
benchmark(6).bounds=[ -32, 32];
benchmark(6).optimum=zeros(1,benchmark(6).dimension);

benchmark(7).funcName={'schwefel222'};
benchmark(7).description={'Schwefel''s Problem 2.22'};
benchmark(7).dimension=30;
benchmark(7).bounds=[ -10, 10];
benchmark(7).optimum=zeros(1,benchmark(2).dimension);

benchmark(8).funcName={'holder'};
benchmark(8).description={'HolderTable'};
benchmark(8).dimension=2;
benchmark(8).bounds=[ -10, 10];
benchmark(8).optimum=[ 8.05502,9.66459];
benchmark(8).optimum2=[ 8.05502,-9.66459];
benchmark(8).optimum3=[ -8.05502,9.66459];
benchmark(8).optimum4=[ -8.05502,-9.66459];

benchmark(9).funcName={'camel3'};
benchmark(9).description={'ThreeHumpCamel'};
benchmark(9).dimension=2;
benchmark(9).bounds=[ -5, 5];
benchmark(9).optimum=[ 0,0];

benchmark(10).funcName={'michal'};
benchmark(10).description={'Michalewicz'};
benchmark(10).dimension=2;
benchmark(10).bounds=[ 0, pi];
benchmark(10).optimum=[ 2.20, 1.57];