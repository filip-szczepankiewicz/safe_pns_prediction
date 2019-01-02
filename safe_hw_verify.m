function sys_name = safe_hw_verify(hw)
% function sys_name = safe_hw_verify(hw)
%
% This function checks if the input hardware specification is the same as
% one of the specs in Filip's library by comparing sha keys.
%
% Example:
% safe_hw_verify(safe_example_hw());
%
% The hardware specification matches the system: EXAMPLE_SYS

sha = safe_hw_to_sha(hw);

switch sha
    
    case '64D3974352B31CD63152A4C13E89AF75DC2EB4142445B401D1FD7B79BA8C2C07'
        sys_name = 'EXAMPLE_SYS';
        
    case '3BF8B9B16EE367ED357B15EE50372C1B212507C1C7C5D503FF4AEA7217C30ABD'
        sys_name = 'AERA-XJ';
        
    case '5C881015F8B048B0AB8179B6EAAC083189A9F6270D4299F2BF973B83F82F5ECC'
        sys_name = 'AERA-XQ';
        
    case '712BE9E2CE24F537B5CF77DD149F80163EF182FAAA1942A0FD9B7A2C837489F8'
        sys_name = 'SKYRA-XQ';
        
    case 'FEE500C04F43820B12E40557EBD2180C9D7C31DA165C2165E67B1900C58FC0AD'
        sys_name = 'SKYRAFIT';
        
    case '95654E4F6080D4710B37400E74F96E2669119BA0D675CF6DE208F58FEF6558BB'
        sys_name = 'PRISMA-XR';
        
    case '91CAD85FCF93E1F22A3D7078B1092FE4C76E5FFF06BF42D0314816A2884BE597'
        sys_name = 'CONNECTOME300';
        
    otherwise
        error('Hardware specification not part of known systems!')
        
end


if nargout < 1
    disp(['The hardware specification matches the system: ' sys_name]);
end

