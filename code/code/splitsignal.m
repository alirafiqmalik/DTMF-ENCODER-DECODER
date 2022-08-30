function [nstart,nend,numofdig]=splitsignal(compsig,fs,silent_time)
%----------------------------------------------
%compsig=complete signal to be analysed 
%for silent zones(time b/w key presses) b/w digit tones
%fs= sampling frequency
%silent_time= assumed time between key presses

%takes signal, fs ,silent_time as input and returns start and end times for digits and
%number of digits 
%---------------------------------------------


compsig = compsig(:)' / max(abs(compsig)); % normalize compsig

silenttime_n = round(silent_time*fs);%assuming time b/w key presses is less that silent_time

compsig = filter(ones(1,silenttime_n) / silenttime_n, 1, abs(compsig));%filtering signal



compsig=compsig > 0.05;%setting everything below 0.05 to 0 and above it to 1 
compsig = diff(compsig);%taking difference of adjacent terms 
compsig
nzi = find(compsig ~= 0)';%vector of non-zero indices(which are start and end of key signals)


ind = [];


while length(nzi)>1
	if nzi(2)>(nzi(1)+10*silenttime_n)
		ind = [ind, nzi(1:2)];
	end
	nzi(1:2) = [];
end


nstart=ind(1,:);
nend=ind(2,:);
numofdig=length(ind(1,:));


end