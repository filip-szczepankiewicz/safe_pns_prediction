function hw = safe_hw_from_asc(fn_asc, verbose)
% function hw = safe_hw_from_asc(fn_asc, verbose)

if nargin < 2
    verbose = 0;
end

[~,b,~] = fileparts(fn_asc);

hw.name       = b;
hw.fn_asc     = fn_asc;

STR = fileread(fn_asc);
STR = STR(~isspace(STR));
str = lower(STR);

str_list = {
    
'checksum',                         'checksum', '';
'$INCLUDE',                         'dependency', '';
'flgSWDStimulationLimitX=',         'x', 'stim_limit';
'flgSWDStimulationLimitY=',         'y', 'stim_limit';
'flgSWDStimulationLimitZ=',         'z', 'stim_limit';

'flgSWDStimulationThresholdX=',     'x', 'stim_thresh';
'flgSWDStimulationThresholdY=',     'y', 'stim_thresh';
'flgSWDStimulationThresholdZ=',     'z', 'stim_thresh';

'flgSWDTauX[0]=',                   'x', 'tau1';
'flgSWDTauX[1]=',                   'x', 'tau2';
'flgSWDTauX[2]=',                   'x', 'tau3';
'flgSWDTauY[0]=',                   'y', 'tau1';
'flgSWDTauY[1]=',                   'y', 'tau2';
'flgSWDTauY[2]=',                   'y', 'tau3';
'flgSWDTauZ[0]=',                   'z', 'tau1';
'flgSWDTauZ[1]=',                   'z', 'tau2';
'flgSWDTauZ[2]=',                   'z', 'tau3';

'flgSWDAX[0]=',                     'x', 'a1';
'flgSWDAX[1]=',                     'x', 'a2';
'flgSWDAX[2]=',                     'x', 'a3';
'flgSWDAY[0]=',                     'y', 'a1';
'flgSWDAY[1]=',                     'y', 'a2';
'flgSWDAY[2]=',                     'y', 'a3';
'flgSWDAZ[0]=',                     'z', 'a1';
'flgSWDAZ[1]=',                     'z', 'a2';
'flgSWDAZ[2]=',                     'z', 'a3';

'GScaleFactorX=',                   'x', 'g_scale';
'GScaleFactorY=',                   'y', 'g_scale';
'GScaleFactorZ=',                   'z', 'g_scale';

};

for i = 1:size(str_list, 1)
    
    ind = strfind(str, lower([str_list{i,1}])) + length(str_list{i,1});
    
    switch (str_list{i,1})
        case 'checksum'
            hw.(str_list{i,2}) = regexp( str(ind:end), '\d+', 'match', 'once' );
            
        case '$INCLUDE'
            hw.(str_list{i,2}) = regexp( STR(ind:end), '\w+', 'match', 'once' );
            
        otherwise
            hw.(str_list{i,2}).(str_list{i,3}) = sscanf(str(ind:end), '%g', 1);
    end
    
end


% At the introduction of XA systems (possibly earlier), the hardware specifications
% started having dependencies, such that the PNS parameters were taken from
% sibling systems. Therefore we attempt to complete the hw specifications
% from files that may be present in the same folder as the original
% .asc. This is a bit dangereous since it assumes a specific file structure.

if ~isempty(hw.dependency)
    warning(['Reading PNS parameters from other system (' hw.name ' is based on ' hw.dependency ')'])
    
    [a,b,c]    = fileparts(fn_asc);
    fn_asc_dep = [a filesep hw.dependency c];
    hw_dep     = safe_hw_from_asc(fn_asc_dep, verbose);
    hw         = safe_hw_mergeIfNotEmpty(hw, hw_dep);
    
end


if verbose
    try
        safe_hw_verify(hw)
    catch me
        disp(me.message)
    end
end
