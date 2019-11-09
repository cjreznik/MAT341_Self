%%%%%%%%%%%%%%%%Function that takes a tolerance input and returns the
%%%%%%%%%%%%%%%%number of iterations,N, to achieve a certain error
%%%%%%%%%%%%%%%%tolerance when finding the minimum of f(x)


function N = successive_Parabolic_Interpolation(tol)

err = 1; %initialize error to run loop

x_1 = 0; % initial x values
x_2 = 0.6;
x_3 = 1.2;

a = 0; %lower end of interval
b = 2; %higher end of interval
N = 0; % initialize number of iterations
while err > tol  %while loop that runs when error is greater than tolerance
    
    N = N + 1; %increment counter each time loop runs
    
    A = [x_1^2 x_1 1; x_2^2 x_2 1; x_3^2 x_3 1]; %vector of parabola variables
        coeffs = inv(A)* [f(x_1) f(x_2) f(x_3)]'; %vector of parabola coefficients
    
    a = coeffs(1); %make two coefficient vectors
    b = coeffs(2);
    
    vertex = -b/(2*a); %calculate the vertex of the parabola
    
    x_3 = x_2;
    x_2 = x_1;
    x_1 = vertex; %shift the points closer once new vertex is found
    
    err = abs(x_3 - x_1); %calculate error 
    
end

N %print number of iterations
function val = f(x)
 
val = 0.5 - x*exp(-x^2); %function we are calling to find the minimum of

%% a) It takes 227 iterations to get 1e-8 accuracy with initial guess
%% b) MATLAB issues a warning about the Matrix being singular or badly scaled which means it is hard to 
%% find the inverse of the matrix so the program has to work harder to find the answer