%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function that performs non linear least squares to find a best fit
% function through data that is pulled from another script

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function perform_NonLinear_Least_Squares()

   N = 2500; %initialize N
   tol = 1e-5; %initialize tolerance
   err = 1; %initialize error
   
   
   data = give_NonLinear_Least_Squares_Data(N); %call in data from NonLinear Least Squares script
   %create x and y data columns
   xData = data(:,1); 
   yData = data(:,2);
   
   %create beta vector
   beta = [1 .5 .3]';
  
  while err > tol %while loop runs while error is greater than tol
      
      
      for i = 1:N %for loop runs from 1 to N
          
          x = xData(i); %find each x data point
          
          expy = exp(-(x-beta(2))^2/(2*beta(3)^2)); %
           
          J(i,1) = expy;
          
          J(i,2) = beta(1)*((x-beta(2))/(beta(3)^2))*expy;
          
          J(i,3) = beta(1)*((x-beta(2))^2/(beta(3)^3))*expy;
          
      end
      
      for i = 1:N
          %pulling x and y data for each iteration
          x = xData(i); 
          y = yData(i);
          
          %finding expy value 
          expy = exp((-(x-beta(2))^2)/(2*beta(3)^2));
          %creating residual vector
          rVec(i,1) = y- beta(1)*expy;
          
      end
      
      %create inverse 
      inverse = inv(J'*J)*J';
      %create pseudo inverse
      pseudoInv = inverse*rVec;
      
      %creating newbeta value
      NewBeta = beta + pseudoInv;
      
      %calculate error
      err = sqrt((NewBeta-beta)'*(NewBeta-beta));
      
      %reset beta value
      beta = NewBeta;
      
  end
  
  for i = 1:N
      
      %create x data point
      x = xData(i); 
      
      %create expy point
      expy = exp(-(x-beta(2))^2/(2*beta(3)^2));
      
      %function is beta1*expy
      f(i,1) = beta(1)*expy;
      
  end
  
  
  %print beta and error
  beta
  
  err
  
  %plot Data against function
  
  %figure; plot(xData,f,'Red','Linewidth',4)
  
  
  figure; plot(xData, yData,'Blue','MarkerSize',20,'LineWidth',6); hold on;  plot(xData, f,'Red','MarkerSize',20)
 
  xlabel('xData');
  ylabel('yData');
  legend('Data','Model Fit')
  
  