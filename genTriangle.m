function [ xTr ] = genTriangle( freq, timeTr, duty, oct, detune, phase, inv)
%function to generate triangle wave

global fs;

duty = duty/100;
dt = 1/fs;
tTr = 0:dt:timeTr-dt;
xTr = inv.*sawtooth(2*pi*(freq + detune*freq*0.01)*tTr.*(2.^str2num(oct)) + 2.*pi.*(phase/360),duty);

end

