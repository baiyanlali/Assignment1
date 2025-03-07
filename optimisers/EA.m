% bestx: the best solution found by your algorithm
% recordedAvgY: array of  average fitnesses of each generation
% recordedBestY: array of best fitnesses of each generation
function [bestx, recordedAvgY, recordedBestY]=EA(funcName,n,lb,ub,nbEvaluation)
warning on MATLAB:divideByZero
if nargin < 5
  error('input_example :  not enough input')
end

eval(sprintf('objective=@%s;',funcName)); % Do not delete this line
% objective() is the evaluation function, for example : fitness = objective(x) 

%% Your algorithm

dimension = n;
lower_bound = lb;
upper_bound = ub;
T = nbEvaluation;
nbGen = 0; % generation counter
nbEval = 0; % evaluation counter
bestSoFarFit = inf; % best-so-far fitness value
bestx = 0;
recordedAvgY = [];
recordedBestY = 0;
%% Below starting your code
% Initialise a population
mu = 30;% Population size
lambda = 30; % Offspring size
recombination_weight = 0.4;
population = rand(mu, dimension).*(upper_bound-lower_bound) + lower_bound;

fitness = objective(population);

recordedAvgY = [recordedAvgY, mean(fitness)];

% Evaluate the initial population
for i = 1:mu
%     fitness(i) = objective(population(i,:));
    if fitness(i) < bestSoFarFit
        bestx = i;
        recordedBestY = fitness(i);
        bestSoFarFit = fitness(i);
    end
    nbEval = nbEval + 1;
end
nbGen = nbGen+1;
% Start the loop
while (nbEval<T) % [QUESTION] this stopping condition is not perfect, why?
% Reproduction (selection, crossver)
%% Parent selection

Scaled_fitness = quadratic_fitness(-fitness); % fitness scaling
crossoverProb = RouletteWheel(Scaled_fitness);
offspring = nan(lambda, dimension);
% offspring_fitness = nan(lambda, 1);
for i = 1:lambda/2
    parentIndexes = nan(1,2);
    for j = 1:2
        r = rand();
        for index = 1:mu
            if r>sum(crossoverProb(1:index-1)) && r<=sum(crossoverProb(1:index))
                break;
            end
        end
        parentIndexes(j) = index;
    end
    %% Recombination method
    [offspring(2*i-1,:), offspring(2*i,:)] = Arithmetic(population(parentIndexes(1),:), population(parentIndexes(2),:), recombination_weight);
end


%% Mutation
mutation_rate = 1/dimension;
for i = 1:lambda
    offspring(i,:) = Uniform_Mutation(offspring(i,:),mutation_rate, lower_bound, upper_bound);
end

offspring_fitness = objective(offspring);

recordedAvgY = [recordedAvgY, mean(offspring_fitness)];

for i = 1:lambda
    if offspring_fitness(i) < bestSoFarFit
        bestx = nbEval;
        recordedBestY = fitness(i);
        bestSoFarFit = fitness(i);
    end
    nbEval = nbEval + 1;
end
%% Replacement(Survivor Selection)

% Scaled_fitness_all = simple_fitness_scaling(-[fitness; offspring_fitness]);
[~,sortedi] = sort(-[fitness; offspring_fitness],'descend');
parent_survivors = sortedi(sortedi(1:mu)<=mu);
offspring_survivors = sortedi(sortedi(1:mu)>mu)-mu;
population = [population(parent_survivors,:); offspring(offspring_survivors,:) ];
fitness = [fitness(parent_survivors); offspring_fitness(offspring_survivors)];

nbGen = nbGen+1;
end



end

%% Fuctions


function [offspring1,offspring2] = Arithmetic(parent1,parent2,weight)
if length(parent1) == length(parent2)
    dimension = length(parent1);
else
    error('Two parents must have the same dimension!');
end
if weight>1 || weight<0
    error('The weight must be in [0,1]');
end
offspring1 = weight.*parent1 + (1-weight).*parent2;
offspring2 = weight.*parent2 + (1-weight).*parent1;

end

function prob = RouletteWheel(fitness)
    prob = fitness./sum(fitness);
end

function prob = RankBased(fitness)
    [~, rank] = sort(fitness);
    prob = (rank)./sum(rank);
end

function selected_parents = Tournament(parents, fitness, k)
    rand_selection = randperm(numel(fitness),k);
    rand_selection = sort(rand_selection);
    random_num = fitness(rand_selection);
    [~, I] = sort(random_num);
    selected_parents = [parents(rand_selection(I(end))), parents(rand_selection(I(end-1)))];
end

function [x] = Uniform_Mutation(x,mutation_rate,lower_bound,upper_bound)
dimension = length(x);
for i = 1:dimension
    if rand<mutation_rate
        x(i) = rand*(upper_bound-lower_bound) + lower_bound;
    end
end
end

function [fitness] = quadratic_fitness(x)
fitness = sum(x.^2,2);
end