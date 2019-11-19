%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Function that takes two inputs, tol and gamma and returns the number of 
%%% iterations, N, needed to achieve a certain error tolerance
%%% using a specific fixed step size gamma

function N = Gradient_Descent_1(tol,gamma) 

xn = [1,1.5]; %initial vector

err = 1; %intial error

N = 0; %initialize counter

while err > tol %while loop runs as the error is greater than tolerance
    
    N = N + 1; %increment counter
    
    xn1 = xn - gamma*Grad(xn); %plugging our value into the matrix
    
    err = sqrt((xn1 - xn).'*(xn1-xn)); %calculating error l^2 norm
    
    xn = xn1; %set new value equal to previous value
    
end

N 
err %print iterations and error

function val = Grad(x) %gradient function


val =  [-cos(x(1)); sin(x(2))];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Using the initial condition above:
%a)34 iterations to achieve 1e-10 accuracy using gamma 0.5
%b)12 iterations to achieve 1e-10 accuracy using gamma 0.9
%c)35 iterations to achieve 1e-10 accuracy using gamma 1.5
