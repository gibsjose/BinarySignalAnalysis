function [noisySignal] = noise(signal, r, Ep, SNRL)
%Usage: [noisySignal] = noise(signal)
%Where noisySignal is the clean signal with noise added,
%signal is the clean signal, r is the random noise, Ep is the signal mean,
%and SNRL is the linear Signal to Noise Ratio

%Determine sigma
sigma = sqrt(Ep / SNRL);

%Scale the random signal
noise = sigma .* r;

%Add the noise to the original signal
noisySignal = signal + noise;