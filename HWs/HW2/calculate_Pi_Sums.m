%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function that Calculates two different sums of pi using two taylor series
%%a_N: 6/(sqrt(3)) * ((-1)^k)/((3^k)*(2*k+1))
%%b_N: 16*((-1)^k)/(5^(2*k+1)*(2*k+1))-4*((-1)^k)/(239^(2*k+1)*(2*k+1))
%%N_A and N_B are the smallest integers such that the error is less than
%%10^-6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function calculate_Pi_Sums()

tol = 1e-6; %tolerance (set to 10^-6)
err_A = 1; %initialize the error so while loop works
N_A = -1; %initialize N_A

%%Series a_N
while err_A > tol %while loop that runs until error is less than 10^-6
    
    N_A = N_A +1; %Counter for N_A that increases as we go through the loop with values
     
    sumA = 0;% initialize sumA
    
    for k = 0:N_A  %for loop that runs from 0 the smallest int N_A s.t. error is less than 10^-6
      
        sumA = sumA + 6/(sqrt(3)) * ((-1)^k)/((3^k)*(2*k+1)); %calculate sum
    end
    
    err_A = abs(sumA-pi); %compute error btw our value and MATLAB's value of pi
    
end

N_A  %print N_A 

%%Series b_N 
err_B = 1;
N_B = -1;

while err_B > tol %while loop that runs until error is less than 10^-6
    
    N_B = N_B + 1; %Counter for N_B that increases as we go through the loop with values
    
    sumB = 0;%initialize sumB
    
    for k = 0:N_B %for loop that runs from 0 the smallest int N_B s.t. error is less than 10^-6
        sumB = sumB + 16*((-1)^k)/(5^(2*k+1)*(2*k+1))-4*((-1)^k)/(239^(2*k+1)*(2*k+1)); %calculate sum
    end
    
    err_B = abs(sumB-pi); %compute error btw our value and MATLAB's value of pi   
end

N_B %print N_B

end
















    