%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function that takes an input N, the size of the matrix and returns the
% Operation count needed to row reduce it to reduced row echelon form

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function OpCount = go_Go_Gaussian_Elimination(N)

A = rand(N,N); %create random N by N matrix 

OpCount = 0; %initialize counter

%each for loop will run based upon the N, the dimensions of the matrix
%using these dummy variables to loop through
for i = 1:N 
    
    for j = 1:N
        
        for k = 1:N
        
        B = (A(j,k)/A(i,i)); %dividing the first row of the matrix
        
        OpCount = OpCount + 1; %increase operation counter by one 
        
        %if the entry is equal i then let it equal B else 
        if j == i
            
            A(j,k) = B;
            
        else
            
            entry = B*A(i,k); %create our new value
            
            OpCount = OpCount + 1; %increase operation counter by 1
            
            A(j,k) = entry - A(j,k); %change input by value minus prev entry
            
            OpCount = OpCount + 1; %increase operation conter by 1
            
            
            
            end
        end
    end
end

OpCount %print opcount


%reduced row echelon form of the matrix
for i = N:-1:2 
    
    for j = i-1:-1:1 %for loop running backwards to 1   
        
        B = A(j,i) * A(i,i); %
        
        OpCount = OpCount + 1;
        
        A(j,i) = A(j,i) - B;
        
        OpCount = OpCount +1;
    end
end



