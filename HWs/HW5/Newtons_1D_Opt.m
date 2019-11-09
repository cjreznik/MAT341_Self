%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Function that utilizes Newtons method that takes the tolerance as input
%%%and returns the number of iterations N necessary to achieve the error
%%%in finding a local minimum%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Newtons_1D_Opt(tol)

err = 1; %initialize error
x_n = 1.5; %initialize guess point
N = 0; %initialize counter

while err > tol %while loop runs while the error is greater than the tolerance
    
    N = N + 1; %increment counter
    
    x_n1 = x_n - (fprime(x_n)/fdblprime(x_n)); %newtons method formula for finding the next point
    
    err = abs(x_n1 - x_n); %compute error between the 2 points
    
    x_n = x_n1; %set previous point equal to new point
end

x_n %print out minimum

N %print out number of iterations
function val = f(x)

val = 0.5-x*exp(-x^2)' %function we are finding the minimum of

function val = fprime(x)

val = -exp(-x^2) + 2*exp(-x^2)*x^2; %first derivative of the function

function val = fdblprime(x) %second derivative of the function

val = -4*exp(-x^2)*x^3 + 6*exp(-x^2)*x;


%a) It takes 6 iterations to find the minimum within a tolerance of 1e-8.
%b) In this case, it takes 736 iterations to "find" a minimum although it
%doesn't print out a number. This is a bad initial guess.