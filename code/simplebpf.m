function [gain,impulse] = simplebpf(cf, L, fs)
%takes input of center frequency ,length L and sample frequency fs
%and returns the impulse response for center frequency cf of length L
ln=0:L-1;
freqband = 0:pi/300:pi;   %frequency vector to calculate scale
impulse=cos(2*pi*cf*(ln)/fs);  %simple band pass filter
scale=abs(max(freqz(impulse,1,freqband))); %calculating scale to normalize impulse
gain=impulse/scale; %assigning gain=normalized impulse
end