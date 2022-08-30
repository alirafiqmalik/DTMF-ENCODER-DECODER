clear 
clc
fs = 8000; %sampling frequency
L=10; %filter length

%the value of L needs to be such that the terms in the impulse responses for center freq cf=fc(i)   
%need to have certain difference such that  
%

fc = [697 770 852 941 1209 1336 1477];

for i=fc
cf=i;


[gain,h]=simplebpf(cf,L,fs); 
%returns gain=normalized impulse response and h=impulse response 

[H,w] = freqz(h,1,fs/2); %freq response of BPF


cf_H = abs(freqz(h,1,[0 cf*2*pi/fs]));
cf_H = cf_H(2);

plot(w*fs/(2*pi),abs(H));
xlabel('Frequency (Hz)');
ylabel('Magnitude');

    
hold on
stem(fc,abs(H(fc+1)),'g');
stem(cf,cf_H,'r');
hold off;



%ax = axis;
%axis([500 2000 0 ax(end)]);
end