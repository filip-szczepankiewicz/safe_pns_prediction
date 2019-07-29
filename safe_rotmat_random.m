function R = safe_rotmat_random()
% function R = safe_rotmat_random()
% Function returns a random rotation matrix (3x3).
% For more information see:
% How to generate a random unitary matrix, by Maris Ozols (March 16, 2009)
% http://home.lu.lv/~sd20008/papers/essays/Random%20unitary%20[paper].pdf

[q, r] = qr(randn(3));
R = q*diag(sign(diag(r)));

