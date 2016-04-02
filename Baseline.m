clear all;
clc;

files = dir('C:\Users\Taylor\Desktop\SCA Files\CSV\*.csv');
plaintexts = textread('MValues.csv','%s');

%%%%%%%%'6a65786a65786a65'%%%%%%%%%%%THE KEY

TraceArray = zeros(length(files), 20003);
keyreal = [0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1];
key = zeros(1,64);

outs = zeros(length(files), 64, 8);
iOld = 0;
iter = 0;

for Trace = 1:length(files) 
    Data = csvread(strcat('C:\Users\Taylor\Desktop\SCA Files\CSV\', files(Trace).name));
    TraceArray(Trace,:) = Data(:,2);
    
    binPT = hex2bi(char(plaintexts(Trace)));
    
    X = DESHAMM(binPT,'ENC',key);
    
    outs(Trace,:,:) = permute(X,[3,2,1]);
    
    Gcorr = zeros(8, 64, 11); 
    I = zeros(8, 1);
    Ish = zeros(8, 1);
    for mk=1:8
        Gcorr(mk, :, :) = corr(outs(1:Trace, :, mk),TraceArray(1:Trace, 5739:5749));
        [~,Ish(mk)] = max(max(Gcorr(mk, :, :)));
        [~,I(mk)] = max(Gcorr(mk, :, Ish(mk)));
    end
    
        disp(I);
        disp(iter);
    if ~isequal(iOld, I)
        %disp(iter);
        iter = 0;
    end
    iter = iter+1;
    %disp(iter);
    if iter > 100
        break;
    end
    iOld = I;
    
    

end


Subkey =[57;12;60;39;1;14;26;56]; %technically it is this minus 1. The minus one is doen in the findKey function.
Subkey = I;
hexkey = FindKey(Subkey);
disp(hexkey);