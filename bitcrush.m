function [ output ] = bitcrush( input,div,bitnum,gainsrc,gaincrush )
%function creates bitcrushing effect on audio input and allows to change
%sampling fruequency
%function is currently not connected with rest of code

div = 3;  %output sampling divider
bitnum = 3;	% resolution after transform
bitdiv = input(1:div:length(input)); %take every nth sample
bitcrushed = round(2^(bitnum-1)*bitdiv)/2^(bitnum-1); %bit crushing



output = bitdiv*(10^(gainsrc/20)) + bitcrushed*(10^(gaincrush/20)); 

end

