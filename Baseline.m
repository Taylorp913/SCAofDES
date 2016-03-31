

files = dir('C:\Users\Taylor\Desktop\SCA Files\CSV\*.csv');
plaintexts = textread('MValues.csv','%s');

%%%%%%%%'6a65786a65786a65'%%%%%%%%%%%THE KEY

TraceArray = zeros(length(files), 20003);
keyreal = [0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 1];
key = zeros(1,64);

for Trace = 1:1%length(files) 
    Data = csvread(strcat('C:\Users\Taylor\Desktop\SCA Files\CSV\', files(Trace).name));
    TraceArray(Trace,:) = Data(:,2);
    
    binPT = hex2bi(char(plaintexts(Trace)));
    
    X = DES(binPT,'ENC',keyreal); 
    
end

log2hex(X)