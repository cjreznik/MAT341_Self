%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Function that compares uses Barzilai-Borwein Step-Size method that takes
%%%a tolerance input and returns the number of iterations to achieve an
%%%error tolerance with a fixed gamma step size 

function N = Gradient_Descent_2(tol)

xn = [1.0,1.5]; %initial guess vector

gamma = 0.5; %initial gamma 

err = 1; %initial error

N = 0; %initialize counter
 
while err > tol %while loop runs as error is greater than tolerance
    
    N = N + 1; %increment counter
    
    xn1 = xn - (gamma*Grad(xn)); %put value in matrix
    
    gamma = abs((xn1 - xn).' * (Grad(xn1)-Grad(xn)))/(Grad(xn1) - Grad(xn).' * (Grad(xn1)-Grad(xn))); %Barzilai-Borwein Step-Size
    
    err = sqrt ((xn1-xn).' * (xn1-xn));%calculating error l^2 norm
    
    xn = xn1; %set new value equal to previous value 
    
end

N
xn
function val = Grad(x) %Gradient function 

val = [-cos(x(1)); sin(x(2))]; 


%%% a) Using the initial point above it takes 6 iterations to achieve 1e-6
%%% accuracy
%%% b) Using the initial point above it takes 7 iterations to achieve 1e-10
%%% accuracy
