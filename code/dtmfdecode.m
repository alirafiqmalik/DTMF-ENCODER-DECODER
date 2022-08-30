function [digits]=dtmfdecode(signal,L,fs,silent_time)
%----------------------------------------------
%signal=signal to be analysed for dtmf decoding
%L=filter length for band pass filters
%fs= sampling frequency
%silent_time= assumed time between key presses

%takes signal, fs and L as input and returns the pressed digits in the signal
%---------------------------------------------

%find the number of digits in signal and
%start and end indicies of non-zero signal b/w key presses defined by silent time

if ~exist('silent_time','var') || isempty(silent_time)
    silent_time = 0.01;
end

[nstart,nend,numofdig]=splitsignal(signal,fs,silent_time);
digits=[];
for i=1:numofdig
freq=detfreq(signal(nstart(i):nend(i)),L,fs);
%find the tone frequnencies for part of signal corresponding to single digit   
digits=[digits,DecodeDigit(freq)];
%determining the digit and saving in vector digits
end
end