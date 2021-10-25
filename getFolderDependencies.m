function toolboxes = getFolderDependencies(folder)
    % getFolderDependencies Get MATLAB toolboxes dependencies from a folder.
    toolboxes = {};

    paths = dir(fullfile(folder, '**', '*.m'));
    pw = PoolWaitbar(length(paths), 'Analysing MATLAB files...');
    parfor path_index = 1:length(paths)
        [~, p_list] = matlab.codetools.requiredFilesAndProducts( ...
            fullfile(paths(path_index).folder, paths(path_index).name) ...
        );
        toolboxes{path_index} = {p_list.Name};
        increment(pw)
    end
    pw.delete()

    toolboxes = unique([toolboxes{:}]);
end
