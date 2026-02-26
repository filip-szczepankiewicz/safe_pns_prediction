function [name, variant, sha] = safe_hw_verify(hw, fn_lib)
% function [name, variant, sha] = safe_hw_verify(hw, fn_lib)
%
% This function checks if the input hardware specification is the same as
% one of the specs in Filip's library by comparing sha keys.
% It may not be part of my library, but still be correct, so this list can
% be expanded freely to include all necessary systems.
%
% Example:
% safe_hw_verify(safe_example_hw());
%
% Output:
% Hardware spec matches library: MP_GPA_EXAMPLE 
% (variant 1 with SHA: D7B6EE869BEA427ECCD34CF91A65711B0B05203113F07FF0EE7D74FF54089DC5)

if nargin < 2
    fn_lib = safe_hw_lib_fn;
end

hw_lib = load(fn_lib);

sha = safe_hw_to_sha(hw);

ind = find(strcmp(hw_lib.sha_l,sha));

if ~isempty(ind)
    name = hw_lib.name_l{ind};
    variant = hw_lib.var_l(ind);
    sha = hw_lib.sha_l{ind};

    if ~isfield(hw, 'model')
        hw.model = 'EMPTY';
    end

    disp(['Hardware spec matches library: ' name ' (variant ' num2str(variant) ' for "' hw.model '" stimulation model (SHA: ' sha(1:10) '...)']);
    
else
    disp('Hardware does not match any in the library!')

end