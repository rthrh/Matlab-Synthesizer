function [ out ] = mixer(chData,freq)
%function takes as an argument all channels data and a frequency of sound
%under mapped key, which is currently pressed


global fs;

time = 0.2; %how long a sound will be played (so far set as const)


%for 'Triangle' and 'Square' wave generation, third parameter (here - 50)
%is duty cycle
for k = 1:4
    switch chData{k,1}
        case 'Sawtooth'
            in{k} = genSawtooth(freq,time,chData{k,2},chData{k,3},chData{k,4},chData{k,5});
        case 'Triangle'
            in{k} = genTriangle(freq,time,50,chData{k,2},chData{k,3},chData{k,4},chData{k,5});
        case 'Square'
            in{k} = genSquare(freq,time,50,chData{k,2},chData{k,3},chData{k,4},chData{k,5});
        case 'Sine'
            in{k} = genSine(freq,time,chData{k,2},chData{k,3},chData{k,4},chData{k,5});
        otherwise
            in{k} = zeros(1,fs*time);
    end
end

sumIn = in{1}+in{2}+in{3}+in{4}; %sum of all channels

%out = sum of all channels with envelope applied
out = genEnv(sumIn,time); 

end