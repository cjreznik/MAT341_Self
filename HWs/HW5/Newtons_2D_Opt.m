%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function that takes a tolerance input and returns the number of iterations
%% necessary to achieve the certain tolerance using Newton's 2D method to find the 
%%local minimum with an initial guess%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function N = Newtons_2D_Opt(tol)

x_0 = [-4.5; 4.5] %initial vector guess
x_1 = [0;0] 
err = 1; %initialize error
N = 0; %initialize counter

while err > tol  %while loop runs while error is greater than the tolerance
     
    N = N + 1; %initialize counter
   
    x_1 = x_0 - Hessian(x_0(1), x_0(2))* grad(x_0(1), x_0(2)); %next point is equal to the previous -Hessian times the gradient
     
    err = sqrt(((x_1-x_0).')*(x_1-x_0)); %compute error between the two points
    
    x_0 = x_1; %set previous point equal to new point
end

N %print number of iterations
err %print error
x_0%print x0

    function val= Hessian(x,y)

    val = inv([sin(x), 0; 0, cos(y)]); %Hessian matrix of the function



    function val= grad(x,y)
        
    val = [-cos(x); sin(y)]; %gradient of the function
     %%% a)For this point it takes 5 iterations with a tolerance of 1e-8. The minimum is
   %%%(-4.7124, 0)
   %%% b)For this point it takes 4 iterations with a tolerance of
   %%% 1e-8. The minimum is still (-4.7124, 0)
