function [name, variant] = safe_hw_verify(hw)
% function [name, variant] = safe_hw_verify(hw)
%
% This function checks if the input hardware specification is the same as
% one of the specs in Filip's library by comparing sha keys.
%
% Example:
% safe_hw_verify(safe_example_hw());
%
% Specification matches: EXAMPLE_SYS (#checksum)(variant 1)

sha = safe_hw_to_sha(hw);

switch sha
    
    case '6CEA231F642CB0B0F4A68CC531FCFCC043321752A250F3F4618761DDE0B557E6'
        name = 'EXAMPLE_SYS';
        variant = 1;
        checksum = 0123456789;
        
    case '09E62D18B5A3BB554A475F734A9307E8BE2E8BA570EFE9285CFC87B1C6DE56FA'
        name = 'MP_GPA_K2259_1500V_550A_AS05';
        variant = 1;
        checksum = 3046993442;
        
    case '06228A0FDEC64BADEE17DEF134E26EEC9DD4101EC270DCE0191F9CA8CC8903C9'
        name = 'MP_GPA_K2279_1200V_150A_GC60';
        variant = 1;
        checksum = 3418571724;
        
    case '9D07DDAFF7FFB05D34FF03D85AF43ABEBD531B2E114CDE8A8BBB4435A72B9413'
        name = 'MP_GPA_K2279_1200V_150A_GC60_FB';
        variant = 1;
        checksum = 921432508;
        
    case 'FEE500C04F43820B12E40557EBD2180C9D7C31DA165C2165E67B1900C58FC0AD'
        name = 'MP_GPA_K2298_2250V_950A_AS097';
        variant = 1;
        checksum = 3885005186;
        
    case '3BF8B9B16EE367ED357B15EE50372C1B212507C1C7C5D503FF4AEA7217C30ABD'
        name = 'MP_GPA_K2309_2000V_651A_GC98Q';
        variant = 1;
        checksum = 3834555520;
        
    case '712BE9E2CE24F537B5CF77DD149F80163EF182FAAA1942A0FD9B7A2C837489F8'
        name = 'MP_GPA_K2309_2000V_651A_GC99';
        variant = 1;
        checksum = 3711535605;
        
    case '95654E4F6080D4710B37400E74F96E2669119BA0D675CF6DE208F58FEF6558BB'
        name = 'MP_GPA_K2309_2250V_951A_AS82';
        variant = 1;
        checksum = 499993810;
        
    case '5C881015F8B048B0AB8179B6EAAC083189A9F6270D4299F2BF973B83F82F5ECC'
        name = 'MP_GPA_K2309_2250V_951A_GC98SQ';
        variant = 1;
        checksum = 3417715184;
        
    case 'CBCE8708AE27E5838986134B957E724E1DFE30036EB0E88DBEBBB02CC82277A4'
        name = 'MP_GPA_K2309_2250V_951A_AS82';
        variant = 2;
        checksum = 2217737351;
        
    case '91CAD85FCF93E1F22A3D7078B1092FE4C76E5FFF06BF42D0314816A2884BE597'
        name = 'CONNECTOME300';
        variant = 1;
        checksum = 0;
        
    otherwise
        error('Hardware specification not part of known systems!')
        
end


if nargout < 1
    disp(['Spec matches: ' name ' (var ' num2str(variant) ')' ' (sha ' sha ') (checksum of origin ' num2str(checksum) ')']);
end

