clc
close all
clear all
cf=1447;
fs=8000;
L=50:50:200;
for fL=L;
    [h,f]=bpfilt(fL,cf,fs,0);
    plot(abs(fft(h)))
    hold all
end
legend('L=50','L=100','L=150','L=200')