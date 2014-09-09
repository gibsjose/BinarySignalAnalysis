function [receivedDigits] = matchfilter(signal, r, Ep, SNRL, gamma, pulse)
%Usage: [receivedDigits] = matchfilter(signal)
%Where receivedDigits is the vector containing the digits
%received by the filter, signal is the clean input signal, r is the
%unscaled random noise to be applied to the signal,
%Ep is the mean of the signal, SNRL is the linear 
%signal to noise ratio, gamma is the optimum threshold, and
%pulse is the original pulse template

%Determine the length of the signal and the random noise
L = length(signal);
Lr = length(r);

%Check for noise mismatch
if(L ~= Lr)
    error('The length of the noise does not match the signal');
end

%Determine sigma
sigma = sqrt(Ep / SNRL);

%Scale the random signal
noise = sigma .* r;

%Add the noise to the original signal
signal = signal + noise;

%Define the binary vector
receivedDigits = zeros(L/20, 1);

%Define the signal sum;
sum = 0;

%Create a pulse vector the length of the binary vector
pulseV = [];

for i = 1:(L/20)
    pulseV = [pulseV; pulse;];
end

%Create a temp vector for integrating
temp = zeros(20, 1);

%Align the signal to the pulse template, integrate the signal, and
%determine a 1 or 0
b = 1;

for i = 1:20:L
    
    c = 1;
    
    for j = i:i+(20 - 1)
        temp(c) = signal(j) * pulseV(j);
        c = c + 1;
    end
    
    %Integrate the signal
    sum = trapz(temp);
    
    %Determine 1 or 0
    if(sum > gamma)
        receivedDigits(b) = 1;
    else
        receivedDigits(b) = 0;
    end
    
    b = b + 1;
end

