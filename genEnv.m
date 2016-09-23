function [ out ] = genEnv( in,time )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global fs;
dt = 1/fs;

A = linspace(0, 1, 0.1*(fs*time)); 
D = linspace(1, 0.7, 0.15*(fs*time)); 
S = linspace(0.7, 0.7, 0.5*(fs*time)); 
R = linspace(0.7, 0, 0.25*(fs*time));

ADSR = [A D S R];

out = in.*ADSR;

end

