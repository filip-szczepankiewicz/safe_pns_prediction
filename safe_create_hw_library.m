function fn_l = safe_create_hw_library(fn_l, fn_lib)
% function fn_l = safe_create_hw_library(fn_l, fn_lib)
%
% fn_l is cell array with absolute paths to .asc files that contain
% information on SAFE model.

if nargin < 1
    % This funciton searches for all .asc files in a folder, and is not
    % provided on the git repository.
    global dir_safe_hw; %#ok<TLEV>
    
    if isempty(dir_safe_hw)
        error('Global variable not found!!!')
    end
    
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

