function hex = log2hex(X)    
A = '';
for iter = 1:64
    if X(iter)
        A(iter)= '1';
    else
        A(iter)= '0';
    end
end

hex = bin2hex(A);