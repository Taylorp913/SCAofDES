function Traces = SortTraces(filelocation,files);
disp('Sorting Traces');
num = 500;%length(files);

A = [(1:num)',  zeros(num,1)];

for i=1:num%length(files)
    Data = csvread(strcat(filelocation, files(i).name));
    A(i,2) = mean(Data(5730:5740,2)); 
end

A = sortrows(A,2);
i = 0;
for j=1:2:num
    out(j)=A(i+1,1);
    out(j+1)=A(num-i,1);
    i = i+1;
end

Traces = out;



% for Trace = 1:2000
% 
%    
% end
%Traces = 1:10:length(files);
%Traces = 500:length(files);