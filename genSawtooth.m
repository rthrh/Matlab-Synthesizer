function [ xSaw ] = genSawtooth( freq, timeSaw, oct, detune, phase, inv )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


global fs;
dt = 1/fs;
tSaw = 0:dt:timeSaw-dt;
xSaw = inv.*sawtooth(2.*pi.*(freq + detune*freq*0.02).*(2.^str2num(oct)).*tSaw + 2.*pi.*(phase/360));

end

