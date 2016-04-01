function success=TestKey(key)

TestPlaintext = [0,1,1,0,0,1,1,1,1,1,0,0,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,1,0,0,1,1,0,1,0,1,0,0,0,1,1,1,1,1,1,1,1,1,0,1,0,0,1,0,1,0,1,1,1,0,1,1,0,0];
TargetCyphertext = [1 1 0 0 0 1 0 1 0 1 0 0 1 0 1 1 1 0 1 0 1 1 1 0 1 1 1 0 0 1 0 1 1 1 1 1 1 1 0 0 1 0 0 0 0 0 0 0 0 1 1 1 0 1 0 1 0 1 1 0 1 0 1 0];

Output = DES(TestPlaintext,'ENC',key); 

if Output==TargetCyphertext
    disp('Success!: KEY HAS BEEN DISCOVERED');
    success = 1;
else
    disp('ERROR OF ERRORS: INCORRECT KEY');
    success = 0;
end
