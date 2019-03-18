function R = safe_rotmat_random()
% function R = safe_rotmat_random()
%
% Function returns a random rotation matrix (3x3).

[q, r] = qr(randn(3));
R = q*diag(sign(diag(r)));

