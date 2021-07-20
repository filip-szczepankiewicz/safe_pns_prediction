function sha = safe_hw_to_sha(hw)
% function sha = safe_hw_to_sha(hw)

str = hw_to_str(hw);

% old code reliant on .Net
% sha = str_to_sha_dotnet(str);

% New code based on Java
sha = str_to_sha_java(str);

end


function str = hw_to_str(hw)

format = '%012.6f';
str    = '';

fl = {'x', 'y', 'z'};
fn = {'tau1', 'tau2', 'tau3', 'a1', 'a2', 'a3', 'stim_limit', 'stim_thresh', 'g_scale'};

for i = 1:numel(fl)
    for j = 1:numel(fn)
        str = cat(2, str, num2str(hw.(fl{i}).(fn{j}), format));
    end
end

end


function sha = str_to_sha_dotnet(str) %#ok<DEFNU>
% Non-java implememntation based on .Net by FSz

sha256hasher = System.Security.Cryptography.SHA256Managed;
sha256       = uint8(sha256hasher.ComputeHash(uint8(str)));
dh           = dec2hex(sha256);
sha          = dh(:)';

end


function sha = str_to_sha_java(str)
% Extension to non-.Net systems by Maxim Zaitsev 

import java.security.*;
import java.math.*;
import java.lang.String;

md   = MessageDigest.getInstance('SHA-256');
hash = md.digest(double(str));
bi   = BigInteger(1, hash);

sha = char(String.format('%064X', bi));

end
