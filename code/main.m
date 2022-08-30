clear all
clc

fs = 8000; %sampling frequency
L=90; %filter length

%num = [0,1,2,3,4,5,6,7,8,9,1,2,'*','#'];
num = [1,2,3,4,5,6,7,8,9,1,2,'*','#'];
%num=[1];
%num = [1,2,3,4,5,6,'*','#'];

signal=DTMF_Function(num,fs); %generate dtmf signal corresponding to keys in num 


%spectrogram(signal,[],[],[],fs,'yaxis');
%ylim([0.5 1.5])

%[signal,fs] = audioread('8548928.wav');%8548928
%signal=signal';



%plot(signal)%plotting the signal vs time
%sound(signal, fs);%playing the signal through the speaker



number=dtmfdecode(signal,L,fs,0.005); %performing dtmf decoding to get dialed number corresponding to the signal 
disp('THE DIALED NUMBER IS: ');
disp(number);