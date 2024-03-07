function hw = safe_hw_from_asc(fn_asc, verbose, mode)
% function hw = safe_hw_from_asc(fn_asc, verbose, mode)
%
% 2024-02-28 - FSz
% New version of funciton that is compatible with old and new hardware
% specification files. Old file format can be run in mode = 0, whereas the
% new format yields peripheral nerve stimulation parameters (PNS, mode = 1)
% or cardiac nerve stimation (CarNS, mode = 2).

if nargin < 2 || isempty(verbose)
    verbose = 0;
end

if nargin < 3 || isempty(mode)
    mode = -1;
end


switch mode
    case {-1, 'auto'}
        mode = safe_asc_fn_to_mode(fn_asc);
        hw = safe_hw_from_asc(fn_asc, verbose, mode);
        return

    case {0, 'none'}
        model  = 'Peripheral';
        prefix = '';

    case {1, 'PNS'}
        model  = 'Peripheral';
        prefix = '.PNS.';

    case {2, 'CarNS'}
        model  = 'Cardiac';
        prefix = '.CarNS.';

    otherwise
        error('Mode not recognized!')
end


[~,b,~] = fileparts(fn_asc);

hw.name       = b;
hw.model      = model;
hw.fn_asc     = fn_asc;

STR = fileread(fn_asc);
STR = STR(~isspace(STR));
str = lower(STR);

str_list = {

'checksum=',                                 'checksum', '';
'$INCLUDE',                                  'dependency', '';

'GScaleFactorX=',                            'x', 'g_scale';
'GScaleFactorY=',                            'y', 'g_scale';
'GScaleFactorZ=',                            'z', 'g_scale';

[prefix 'flgSWDStimulationLimitX='],         'x', 'stim_limit';
[prefix 'flgSWDStimulationLimitY='],         'y', 'stim_limit';
[prefix 'flgSWDStimulationLimitZ='],         'z', 'stim_limit';

[prefix 'flgSWDStimulationThresholdX='],     'x', 'stim_thresh';
[prefix 'flgSWDStimulationThresholdY='],     'y', 'stim_thresh';
[prefix 'flgSWDStimulationThresholdZ='],     'z', 'stim_thresh';

[prefix 'flgSWDTauX[0]='],                   'x', 'tau1';
[prefix 'flgSWDTauX[1]='],                   'x', 'tau2';
[prefix 'flgSWDTauX[2]='],                   'x', 'tau3';
[prefix 'flgSWDTauY[0]='],                   'y', 'tau1';
[prefix 'flgSWDTauY[1]='],                   'y', 'tau2';
[prefix 'flgSWDTauY[2]='],                   'y', 'tau3';
[prefix 'flgSWDTauZ[0]='],                   'z', 'tau1';
[prefix 'flgSWDTauZ[1]='],                   'z', 'tau2';
[prefix 'flgSWDTauZ[2]='],                   'z', 'tau3';

[prefix 'flgSWDAX[0]='],                     'x', 'a1';
[prefix 'flgSWDAX[1]='],                     'x', 'a2';
[prefix 'flgSWDAX[2]='],                     'x', 'a3';
[prefix 'flgSWDAY[0]='],                     'y', 'a1';
[prefix 'flgSWDAY[1]='],                     'y', 'a2';
[prefix 'flgSWDAY[2]='],                     'y', 'a3';
[prefix 'flgSWDAZ[0]='],                     'z', 'a1';
[prefix 'flgSWDAZ[1]='],                     'z', 'a2';
[prefix 'flgSWDAZ[2]='],                     'z', 'a3';

};


for i = 1:size(str_list, 1)

    ind = strfind(str, lower([str_list{i,1}])) + length(str_list{i,1});

    switch (str_list{i,1})
        case 'checksum='
            hw.(str_list{i,2}) = regexp( str((ind+4):end), '\d+', 'match', 'once' );

        case '$INCLUDE'
            hw.(str_list{i,2}) = regexp( STR(ind:end), '\w+', 'match', 'once' );

        case {'GScaleFactorX=', 'GScaleFactorY=', 'GScaleFactorZ='}
            % The scale factors are not explicitly attributed to PNS or CNS
            % so we dont know which is which. Hopefully they are the same
            % so we can just use one of them.

            if numel(ind)<=1
                hw.(str_list{i,2}).(str_list{i,3}) = sscanf(str(ind:end), '%g', 1);

            else
                for j = 1:numel(ind)
                    tmp(j) = sscanf(str(ind(j):end), '%g', 1);
                end

                if any(tmp-tmp(1))
                    % Here we have detected several values for the same
                    % parameter and we dont know for sure how to treat
                    % them. Remove at your own peril!
                    error('Several scale factors were found and the correct one cannot be determined!')
                else
                    hw.(str_list{i,2}).(str_list{i,3}) = tmp(1);
                end
            end

        otherwise
            if numel(ind)>1
                error('The string matching was not unique! DANGER! Try using specific mode 1 or 2!')
            end

            hw.(str_list{i,2}).(str_list{i,3}) = sscanf(str(ind:end), '%g', 1);
    end

end


% At the introduction of XA20/30 systems (possibly earlier), the hardware specifications
% started having dependencies, such that the PNS parameters were taken from
% sibling systems. Therefore we attempt to complete the hw specifications
% from files that may be present in the same folder as the original
% .asc. This is a bit dangereous since it assumes a specific file structure.

if ~isempty(hw.dependency)
    warning(['Reading PNS parameters from other system (' hw.name ' is based on ' hw.dependency ')'])

    [a,b,c]    = fileparts(fn_asc);
    fn_asc_dep = [a filesep hw.dependency c];
    hw_dep     = safe_hw_from_asc(fn_asc_dep, verbose, mode);
    hw         = safe_hw_mergeIfNotEmpty(hw, hw_dep);

end


if verbose
    try
        safe_hw_verify(hw);
        safe_hw_check(hw);
    catch me
        disp(me.message)
    end
end
