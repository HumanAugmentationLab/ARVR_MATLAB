% instantiate the library
addpath(genpath('./../../dependencies/liblsl-Matlab/'))
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving a Markers stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type', 'Markers'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');
i = 0;
while i < 10000
    % get data from the inlet
    [mrks,ts] = inlet.pull_sample();
    % and display it
    fprintf('got %s at time %.5f\n',mrks,ts);
    i = i + 1;
end