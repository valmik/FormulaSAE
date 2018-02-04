files = {'FirstTest/SF5', 'FirstTest/SF3', 'FirstTest/SF2', 'FirstTest/SF1', 'FirstTest/CF3', 'FirstTest/CF2', 'FirstTest/CF1'};
arbitraries = [950, 180, 325, 400, 175, 170, 180];
offsets = [4, 2, 4, 1, 2, 2, 2];

% files = {'ST3', 'ST2', 'ST1', 'SF5', 'SF3', 'SF2', 'SF1', 'CF3', 'CF2', 'CF1'};
% arbitraries = [875, 100, 100, 950, 180, 325, 400, 175, 170, 180];
% offsets = [2, 4, 2, 4, 2, 4, 1, 2, 2, 2];

final = cell(3, length(files));
for i = 1:length(files)
    [c, m, k, R2, M_p, plot1, plot2] = DampingAnalysis_func(arbitraries(i), offsets(i), files{i});
    xi = abs(c) / (2*sqrt(abs(m)*abs(k)));
    final{1, i} = [c, m, k, R2];
    final{2, i} = plot1;
    final{3, i} = plot2;
    files{i}
    [c, m, k, xi, M_p, R2]
end

%% Second test (didn't end up needing)

files = {'SecondTest/SF1_2_1'}; %, 'SF1_2_2', 'SF1_2_3', 'SF1_2_4', 'SF1_2_5', 'SF1_2_6', 'SF1_2_7', 'SF1_2_8', 'SF1_2_9', 'SF1_2_10'};
arbitraries = [1];
offsets = [0];
final = cell(3, length(files));
for i = 1:length(files)
    [c, m, k, R2, M_p, plot1, plot2] = DampingAnalysis_func(arbitraries(i), offsets(i), files{i});
    final{1, i} = [c, m, k, R2];
    final{2, i} = plot1;
    final{3, i} = plot2;
end