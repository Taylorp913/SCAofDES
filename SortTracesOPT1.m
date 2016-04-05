function Traces = SortTraces(filelocation,files,plaintexts);
% % filelocation = 'C:\Users\Taylor\Desktop\SCA Files\CSV2\';
% files = dir(strcat(filelocation,'*bin.csv'));
% plaintexts = extracthex(files);
disp('Sorting Traces');
num = length(files)-1;

A = [(1:num)',  zeros(num,1)];

for i=1:num%length(files)
    A(i,2) = sum(hex2bi(plaintexts(1,1:16))==hex2bi(plaintexts(i,1:16)));
    %Data = csvread(strcat(filelocation, files(i).name));
    %A(i,2) = max(Data(5730:5740,2)); 
end

A = sortrows(A,2);
i = 0;
for j=1:2:num
    out(j)=A(i+1,1);
    out(j+1)=A(num-i,1);
    i = i+1;
end
Traces = out;


%% out =A([150:350],1);
% out1 = flipud(out);
% Traces = out1';
