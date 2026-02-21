function R = safe_rotmat_random(n)
% function R = safe_rotmat_random()
% Function returns a random rotation matrix (3x3).
% For more information see:
% How to generate a random unitary matrix, by Maris Ozols (March 16, 2009)
% http://home.lu.lv/~sd20008/papers/essays/Random%20unitary%20[paper].pdf

if nargin < 1
    n = 1;
end

R = zeros(3,3,n);

for i = 1:n

    [q, r] = qr(randn(3));
    R(:,:,i) = q*diag(sign(diag(r)));

end