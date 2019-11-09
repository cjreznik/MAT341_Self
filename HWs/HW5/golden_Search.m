%%%%%%%%%%%%%%Function that uses golden search algorithm takes a tolerance 
%%%%%%%%%%%%%%input and returns the number of iterations,N it takes to achieve the specified 
%%%%%%%%%%%%%%error tolerance when finding the minimum of f(x)

function N = golden_Search(tol)
err = 1; %initialize error so while loop runs

tau = (sqrt(5)-1)/2; %golden ratio 

a = 0; %lower end of interval

b = 2; %higher end of interval

N = 0; %initialize N, iterations

x_1 = a + (1-tau)*(b-a); %defines first x_1 value
x_2 = a + tau*(b-a); %defines first x_2 value
f1 = f(x_1); %calls function below to get f(x) values
f2 = f(x_2);
  
while err > tol %while loop runs while the error is greater than specified tolerance
    N = N + 1; %increase counter each time loop runs
  
    if f1 > f2 
        
        %if the function value of x_1 is greater than x_2 a moves over to
        %become x_1 and x_1 becomes x_2 (shrinking interval) and a new x_2
        %is calculated
        a = x_1;
        x_1 = x_2;
        f1 = f2;
        x_2 = a + tau*(b - a);
        f2 = f(x_2);
        
    else 
        
        %otherwise b becomes x_2 and x_2 becomes x_1 and a new x_1 is
        %calculated
        b = x_2;
        x_2 = x_1;
        f2 = f1;
        x_1 = a + (1-tau)*(b-a);
        f1 = f(x_1);
        
    end
    
        err = b-a; %calculates error of the new interval surronding the extrema
end
    

function val = f(x)


val = 0.5 - x*exp(-x^2); %function we are finding extrema of 

%%a) It takes 40 Iterations to achieve 1e-8 accuracy.

