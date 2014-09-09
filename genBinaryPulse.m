function [signal, binary] = genBinaryPulse(N, pulse);
%Usage: [signal, binary] = genBinaryPulse(N, pulse)
%Where signal is the vector containing the pulse waveform for
%each binary value, binary is the binary vector, N is the
%length of the binary vector, and pulse is the pulse waveform for
%a value of '1'

%Generate the random vector
r = rand(N, 1);

%Initialize the binary vector
binary = zeros(N, 1);

%Determine the binVector
for i = 1:N
    if(r(i)>= 0.5)
        binary(i) = 1;
    else
        binary(i) = 0;
    end
end

%Initialize the binPulse
signal = zeros(0, 1);

%Determine the binPulse
for i = 1:N
    if(binary(i) == 1)
        signal = [signal; pulse];
    else
        signal = [signal; -pulse];
    end
end
