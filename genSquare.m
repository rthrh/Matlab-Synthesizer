function [ xSq ] = genSquare( freq, timeSq, duty, oct ,detune, phase, inv )
%function to generate square wave


global fs;
dt = 1/fs;
tSq = 0:dt:timeSq-dt;
xSq = inv.*square(2.*pi.*tSq.*(freq + detune*freq*0.01).*(2.^str2num(oct)) + 2.*pi.*(phase/360),duty);

end

