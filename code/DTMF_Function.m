function [x]=DTMF_Function(phone_no,fs,time,silent_time)
%__________________________________________________________________
%   phone_no     : Phone number dialed by the user
%   fs           : Sampling Frequency in Hz
%   ontime       : signal time in seconds
%   ts           : Sampling Time
%   dialed_key   : Certain key of telephone
%   freq1        : Value for row frequency in encoding table
%   freq2        : Value for column frequency in encoding table
%__________________________________________________________________

if ~exist('time','var') || isempty(time)
    time = 0.2;
end
if ~exist('silent_time','var') || isempty(silent_time)
    silent_time = 0.05;
end



n=length(phone_no);
ts=1/fs;
x=[];

for k=1:n

dialed_key=phone_no(k);

%   Initializing freq1 with corresponding value of frequency from encoding
%   table according to the key pressed.

switch (dialed_key);                  
        case {1 2 3 };
            freq1=697;
        case {4 5 6 };
            freq1=770;
        case {7 8 9 };
            freq1=852;
        case {'*' 0 '#'};
            freq1=941;
        otherwise
            disp(' ');              
            disp('ERROR: incorrect entry !');
            disp('only entry: 1 2 3 4 5 6 7 8 9 0 # * ');
            disp(' ');
            return;
end
%   Initializing freq2 with corresponding value of frequency from encoding
%   table according to the key pressed.

    switch (dialed_key);                     
        case {1 4 7 '*'};
            freq2=1209;
        case {2 5 8 0 '0'};
            freq2=1336;
        case {3 6 9 '#'};
            freq2=1477;
        otherwise
            disp(' ');              
            disp('ERROR: incorrect entry !');
            disp('only entry: 1 2 3 4 5 6 7 8 9 0 # * ');
            disp(' ');
    end
  
t = 0:ts:time;
xk = sin(2*pi*freq1*t)+sin(2*pi*freq2*t);

x=[x,xk,zeros(1,fs*silent_time)];


end

end
