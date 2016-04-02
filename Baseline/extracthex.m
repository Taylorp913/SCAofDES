function [mess] = extracthex(files);
%files = dir('C:\Users\Taylor\Desktop\SCA Files\CSV\*.csv');
%mess = [1:length(files)]';
for i = 1:(length(files)-1)
   ind = 56;
   x = files(i).name;
   while x(ind)~='='
       ind=ind+1;
   end
   mess(i,:) = x(ind+1:ind+16);
end

%mess = textread('MValues.csv','%s');