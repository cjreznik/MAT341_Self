%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function that takes a tolerance input and and returnes the number of
%%iterations necessary to achieve the inputted tolerance when finding the
%%minimum using the Nedler Mead method%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function Nelder_Mead(tol)

err = 1; % Initialize error

%Pick 3 (x,y) points
x1 = .35;
x2 = 4;
x3 = 4.5;
y1 = 2.8;
y2 = 4;
y3 = 4.5;



%Put points in x and y vectors and create a function vector
    xVec = [x1 x2 x3];
    yVec = [y1 y2 y3];
    fVec = [f(x1,y1) f(x2,y2) f(x3,y3)];
    
    N = 0; %initialize counter

while err > tol %keep running while error is greater than tolerance
    
 
    
    [fNew, indsVec] = sort(fVec); %Reorder points so that f(x_1) <= f (x_2) <= f(x_3)
    
    xleast = xVec(indsVec(1)); 
    xmid = xVec(indsVec(2));
    xgreat = xVec(indsVec(3));
    
    yleast = yVec (indsVec(1));
    ymid = yVec(indsVec(2));
    ygreat = yVec(indsVec(3));
    
    xmidpt = 1/2*(xleast + xmid); %Compute midpoint vector between x_1 and x_2 x_min = 1/2*(x_1 + x_2)
    xreach = xmidpt + (xmidpt - xgreat); %Compute a "reach vector", x_r, x_r = x_m + (x_m - x_3)
    
    ymidpt = 1/2*(yleast + ymid); %Compute a midpoint and reach vector for the y components
    yreach = ymidpt + (ymidpt - ygreat);
    
    if f(xreach,yreach) < f(xgreat,ygreat) %if the reach is less than the greatest point, move reach to be the greatest point
       xgreat = xreach;
       ygreat = yreach;
       
    else
        if f(xreach,yreach) > f(xgreat,ygreat) %if the reach is greater, move center to be halfway between midpt and greatest point
        xcenter = 1/2*(xmidpt + xgreat); 
        ycenter = 1/2*(ymidpt + ygreat);
            
            if f(xcenter,ycenter) < f(xgreat,ygreat) %if the center is less than the greatest point move the greatest point to the center
            xgreat = xcenter;
            ygreat = ycenter;
            
            else
                
            xmid = 1/2*(xleast+xmid); %otherwise move the midpoint between the smallest and middle point and greatest point between the least and greatest
            xgreat = 1/2*(xleast + xgreat); 
            ymid = 1/2*(yleast+ymid);
            ygreat = 1/2*(yleast+ygreat);
            end
    end
end

  
  
   
    xVec = [xleast xmid xgreat]; %create new x, y and fVec
    yVec = [yleast ymid ygreat];
    fVec = [f(xleast,yleast) f(xmid,ymid) f(xgreat,ygreat)];
    
 
    
    err = abs(f(xgreat,ygreat)-f(xleast,yleast)); %compute new error
    
N = N + 1; %increment counter
    
end

xleast %print minimum, and N
yleast
N

end
       
    function val = f(x,y) %function that we are finding the minimum of
    
    val = -(sin(x) + cos(y));
    
    end
    
  %a) It takes 29 iterations using the initial points to achieve 1e-8
  %accuracy.
  %b) The point converges to  (1.5715, 7.9827e-04) when the actual local
  %minimum is (pi/2,0). This is the point closest enough within the
  %specificed tolerance of 1e-8. 
  %c)Changing the intial point, it takes 58 iterations for a tolerance of
  %1e-8.It found a new minimum of (1.5709, -1.1087e-04). This happened
  %because we picked an initial condition that just happened to be a bad
  %guess for finding the minimum in a small number of iterations.
  %d)In this case, the minimum found is (-4.7123,-2.8363e-04) after 53
  %iterations. 
