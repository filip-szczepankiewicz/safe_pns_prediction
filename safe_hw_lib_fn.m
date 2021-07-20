function fn_lib = safe_hw_lib_fn()
% function fn_lib = safe_hw_lib_fn()
%
% Returns filepath of safe hardware library file.

p = mfilename('fullpath');

fn_lib = [fileparts(p) filesep 'safe_hw_lib.mat'];