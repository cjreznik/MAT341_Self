%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function that performs linear least squares to find best fit function through
% data that is given

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fit_Sine_Series()

N = 500; % # of Data Points
M = 5; % upper bound of sum
xData = linspace(-pi,pi,N); %creating data
yData = ((0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)';

for j = 1:N %for loop that runs for # of data points
        
        x = xData(j); %call x and y data
        y = yData(j);
        
         for i = 1:M  %for loop calculating sum 
       
            A(j,i) = sin(i*x); %sum
            
         end
            B(j,:) = y; 
         
    end
    
    pseudoinv = (inv(A'*A))*A'; %create pseudo inverse
    
    beta = pseudoinv*B; %find beta values
    
     
    for j = 1:N %for loop runs for data points
        
        
        x = xData(j);
        
        f(j,1) = 0; 
        
        i = 1; %initialize counter
                while i <= M %run while counter is less than M
            
                f(j,1) = f(j,1) + beta(i)*sin(i*x); %sum
            
                i = i + 1; %increment counter
            
                end
        
              
    end
       
    %plot
    figure; plot(xData, yData,'o','LineWidth',6); hold on; plot(xData,f,'LineWidth',4)
    xlabel('x');
    ylabel('y');
    
    %calculate residual and l2norm
    res = B - A*beta;
    l2norm = sqrt(res'*res)
    
    %%% a) Using N = 500, when M = 5 the l2norm is 0.0813. When M = 10, the
    %%% l2norm is 0.0096. When M = 20 the l2norm is 2.1412e-06.
    %%% b) The name of this series/process is called Fourier Series.
    