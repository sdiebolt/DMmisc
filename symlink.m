function [status, message] = symlink(source, destination)
    % Create a symbolic link pointing to a file
    % FORMAT [status, message] = SYMLINK(source, destination)
    %
    % source        path to the source file
    % destination   path to the symbolic link
    %__________________________________________________________________________
    % Copyright (c) 2021 Samuel Diebolt

    if isunix
        [status, message] = system(['ln -s ', source, ' ', destination]);
    elseif ispc
        if isWindowsAdmin()
            [status, message] = system(['mklink ', destination, ' ', source]);
        else
            error('DMmisc:PrivilegesError', ...
                  'Please run MATLAB as administrator')
        end
    else
        error('DMmisc:UnsupportedArchitectureError', ...
              'Unsupported architecture')
    end

    if status
        error( ...
            'DMmisc:SymlinkError', ...
            ['Could not create symbolic link, the following error was ', ...
             'raised: ', message] ...
        );
    end
end
