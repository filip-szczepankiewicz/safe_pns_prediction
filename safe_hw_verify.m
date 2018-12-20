function sys_name = safe_hw_verify(hw)
% function sys_name = safe_hw_verify(hw)
%
% This function checks if the input hardware specification is the same as
% one of the specs in Filips library by comparing sha keys.
%
% Example:
% safe_hw_verify(safe_example_hw());
%
% The hardware specification matches the system: EXAMPLE_SYS


sha = safe_hw_to_sha(hw);


switch sha
    
    case '88B2E3150AB3930513327AD7DC5F37AD55C9E6D475E3EF2B41AC76089AF2AB64'
        sys_name = 'EXAMPLE_SYS';
        
    case '3BF8B9B16EE367ED357B15EE50372C1B212507C1C7C5D503FF4AEA7217C30ABD'
        sys_name = 'AERA';
        
    case '0B677B5D2F47370BAF67D355E190F4BD43E2E98403C04BFE6C34CF1301A49843'
        sys_name = 'SKYRA';
        
    case '95654E4F6080D4710B37400E74F96E2669119BA0D675CF6DE208F58FEF6558BB'
        sys_name = 'PRISMA';
        
    case '91CAD85FCF93E1F22A3D7078B1092FE4C76E5FFF06BF42D0314816A2884BE597'
        sys_name = 'CONNECTOME300';
        
    otherwise
        error('Hardware specification not part of known systems!')
        
end


if nargout < 1
    disp(['The hardware specification matches the system: ' sys_name]);
end

