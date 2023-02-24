function fn_l = safe_create_hw_library(fn_l, fn_lib)
% function fn_l = safe_create_hw_library(fn_l, fn_lib)
%
% fn_l is cell array with absolute paths to .asc files that contain
% information on SAFE model.

if nargin < 1
    % This funciton searches for all .asc files in a folder, to include all
    % unique files in a list. Note that the hardware specification files
    % are not shared via GitHub. Note that the function
    % 'find_files_under_folder' is not shared as part of this repo.
    % However, you can find it here: 
    % https://se.mathworks.com/matlabcentral/fileexchange/1378-files-under-folders-fuf

    dir_safe_hw = path_hw_safe;
    
    fn_l = find_files_under_folder([dir_safe_hw filesep '*.asc'], 1, 'detail');
end

if nargin < 2
    fn_lib = safe_hw_lib_fn();
end


sha_l  = {};
name_l = {};
var_l  = [];

for i = 1:numel(fn_l)
    
    hw  = safe_hw_from_asc(fn_l{i}, 0);
    
    sha = safe_hw_to_sha(hw);

    % Check if identical SHA exists
    if ~any(strcmp(sha_l,sha))

        if any(strcmp(name_l,hw.name))
            warning(['Doublet name with different specification exists! (' hw.name ')'])
        end
        
        sha_l{end+1}  = sha;
        name_l{end+1} = hw.name;
        var_l(end+1)  = sum(strcmp(name_l,hw.name));
    end
    
end

save(fn_lib, 'sha_l', 'name_l', 'var_l');

