clear all;
clc;
filelocation = 'C:\Users\Taylor\Desktop\SCA Files\CSV\';
files = dir(strcat(filelocation,'*bin.csv'));
plaintexts = extracthex(files);

%%%%%%%%'6a65786a65786a65'%%%%%%%%%%%THE KEY

TraceArray = zeros(length(files), 20003);
keyreal = [0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1];
key = zeros(1,64);

hamms = zeros(length(files), 64, 8);
old = 0;
cnt = 0;

TargetSubkey =[57;12;60;39;1;14;26;56];

Traces=SortTraces(filelocation,files);
%Traces = 1:length(files);
TotalTraces = 0;
index = 1;

for Trace = Traces  
    Data = csvread(strcat(filelocation, files(Trace).name));
    TraceArray(index,:) = Data(:,2);
    
    binPT = hex2bi(char(plaintexts(Trace,:)));
    
    hamms(index,:,:) = permute(DESHAMM(binPT,'ENC',key),[3,2,1]);
    
    Corrs = zeros(8, 64, 11); 
    Subkey = zeros(8, 1);
    Ish = zeros(8, 1);
    for k=1:8
        Corrs(k, :, :) = corr(hamms(1:index, :, k),TraceArray(1:index, 5739:5749));
        [~,Ish(k)] = max(max(Corrs(k, :, :)));
        [~,Subkey(k)] = max(Corrs(k, :, Ish(k)));
    end
    disp((Subkey==TargetSubkey)');
    cnt 
    index=index+1
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


%TargetSubkey =[57;12;60;39;1;14;26;56]; %technically it is this minus 1. The minus one is doen in the findKey function.
hexkey = FindKey(Subkey);
disp(hexkey);