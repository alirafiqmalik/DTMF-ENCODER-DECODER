function [freq]=detfreq(signal,L,fs)
%----------------------------------------------
%signal=signal to be analysed for dtmf decoding
%L=filter length for band pass filters
%fs= sampling frequency

%takes signal, fs and L as input and returns 
%the tone frequencies corresponding to the signal
%---------------------------------------------
freqvec = [697 770 852 941 1209 1336 1477];%tone freq vector  

score=[];
%score stores values of likelyhood that signal consists of ith frequency 
for i=freqvec
imp=bpfilt(L,i,fs,0);%returns impulse response for ith frequency 
score=[score,max(abs(conv(signal,imp)))];
%convoling normalized signal with impulse response and taking max value gives a number
%defining likelyhood signal consists of ith frequency and concatentates
%to score
end
sorted=sort(score,'descend');%sorting score in decending order

freq=[freqvec(find(score==sorted(1))),freqvec(find(score==sorted(2)))];
%finding index of score for largest and largest score and saving
%corresponding frequency for signal in freq vector

end