function [ symmetric ] = IsSymmetric( D )
%ISSYMMETRIC Summary of this function goes here
%   Detailed explanation goes here
    symmetric = isequal(D, D.');
end

