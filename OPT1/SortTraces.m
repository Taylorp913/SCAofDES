function Traces = SortTraces(filelocation,files);
disp('Sorting Traces');
num = 500;%length(files);

A = [(1:num)',  zeros(num,1)];

for i=1:num%length(files)
    Data = csvread(strcat(filelocation, files(i).name));
    A(i,2) = max(Data(5730:5740,2)); 
end

A = sortrows(A,2);
for j=1:2:(num/2)+1
    out(j)=A(j,1);
    out(j+1)=A(num-j,1);
end


Traces = out;



% for Trace = 1:2000
% 
%    
% end
%Traces = 1:10:length(files);
%Traces = 500:length(files);