function hex = log2hex(X)    

%I = [57;12;60;39;1;14;26;56]
%T = [de2bi(I-1),zeros(8,1)];
%Binary = [T(1,:),T(2,:),T(3,:),T(4,:),T(5,:),T(6,:),T(7,:),T(8,:)];
A = '';
for iter = 1:64
    if X(iter)
        A(iter)= '1';
    else
        A(iter)= '0';
    end
end

hex = bin2hex(A);