function out = isWindowsAdmin()
    % True if the current MATLAB session has administrator privileges
    if ~ispc
        error('DMmisc:OSError', 'This function can only be run on Windows')
    end
    wi = System.Security.Principal.WindowsIdentity.GetCurrent();
    wp = System.Security.Principal.WindowsPrincipal(wi);
    admin_role = System.Security.Principal.WindowsBuiltInRole.Administrator;
    out = wp.IsInRole(admin_role);
end
