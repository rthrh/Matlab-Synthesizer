function [ xSin ] = genSine( freq, timeSin, oct, detune, phase, inv )
%function to generate sine wave


global fs;
dt = 1/fs;
tSin = 0:dt:timeSin-dt;
xSin = inv.*sin(2.*pi.*(freq + detune*freq*0.01).*(2.^str2num(oct)).*tSin + 2.*pi.*(phase/360));

end