function [h,frq] = bpfilt(L,cf,fs,mkplots)
%       input arguments
%-------------------------------
% L = length
% cf = center frequency
% fs = Nyquist Rate
% sig = Signal -1 second (fs samples)
% mkplots = boolean for making plots
%-------------------------------

order=L-1; %filter order
%fir1(order,[Normalized Lower Cutoff Frequency , Normalized Upper Cutoff Frequency]);
bp=fir1(order,[(cf-10)/fs (cf+10)/fs],'bandpass');
%freqz(coeff_num,coeff_den,sampling frequency);
[h,w]=freqz(bp,1,fs);
%h=transfer function in frequency domain
%w=frequency in rads/cycles
f=w/pi*fs; %converting into physical frequency
h=reshape(h(1:length(h)),[1,length(h)]);
frq=reshape(f(1:length(f)),[1,length(f)]);
if mkplots==1
   subplot(3,1,1);plot(f,20*log(h)) ;title('Bandpass Filter','FontSize',14,'Color','blue') 
end
h=ifft(h);

%            output
%----------------------------------------
%h=magnitude of frequency response
%frq=frequency scale
%----------------------------------------
end

