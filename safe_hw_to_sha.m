function sha = safe_hw_to_sha(hw)
% function sha = safe_hw_to_sha(hw)

string       = hw_to_str(hw);
sha256hasher = System.Security.Cryptography.SHA256Managed;
sha256       = uint8(sha256hasher.ComputeHash(uint8(string)));
dh           = dec2hex(sha256);
sha          = dh(:)';

end


function str = hw_to_str(hw)

format = '%012.6f';
str    = '';

str = cat(2, str, num2str(hw.look_ahead, format));

fl = {'x', 'y', 'z'};
fn = {'tau1', 'tau2', 'tau3', 'a1', 'a2', 'a3', 'stim_limit', 'stim_thresh'};

for i = 1:numel(fl)
    for j = 1:numel(fn)
        str = cat(2, str, num2str(hw.(fl{i}).(fn{j}), format));
    end
end

end
