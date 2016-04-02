clear all;
clc;

files = dir('C:\Users\Taylor\Desktop\SCA Files\CSV\*.csv');
plaintexts = textread('MValues.csv','%s');
cyphertexts = textread('CValues.csv','%s');

%%%%%%%%'6a65786a65786a65'%%%%%%%%%%%THE KEY

TraceArray = zeros(length(files), 20003);
key = [0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1];
%key = zeros(1,64);

hamms = zeros(length(files), 64, 8);
old = 0;
cnt = 0;

Traces=SortTraces(files);
%Traces = 1:length(files);

for Trace = Traces 
    Data = csvread(strcat('C:\Users\Taylor\Desktop\SCA Files\CSV\', files(Trace).name));
    TraceArray(Trace,:) = Data(:,2);
    
    %binPT = hex2bi(char(plaintexts(Trace)));
    %hamms(Trace,:,:) = permute(DESHAMMOPT1(binPT,'ENC',key),[3,2,1]);
    
    binCT = hex2bi(char(cyphertexts(Trace)));
    hamms(Trace,:,:) = permute(DESHAMMOPT1(binCT,'DEC',key),[3,2,1]);

    
    Corrs = zeros(8, 64, 11); 
    Subkey = zeros(8, 1);
    Ish = zeros(8, 1);
    for k=1:8
        Corrs(k, :, :) = corr(hamms(1:Trace, :, k),TraceArray(1:Trace, 5730:2:5750));
        [~,Ish(k)] = max(max(Corrs(k, :, :)));
        [~,Subkey(k)] = max(Corrs(k, :, Ish(k)));
    end
    disp(Subkey');
    cnt 
    Trace
    if ~isequal(old,Subkey)
        cnt = 0;
    else
        cnt = cnt+1;
    end
    
    if cnt >= 99
        break;
    end
    old = Subkey;
end


%Subkey =[57;12;60;39;1;14;26;56]; %technically it is this minus 1. The minus one is doen in the findKey function.
hexkey = FindKey(Subkey);
disp(hexkey);