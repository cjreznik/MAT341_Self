%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function takes two integers, x and y, and calculates 
%the LCM of them%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function lcm_val = calculate_LCM(x,y)

noLCM = 1; %dummy variable that allows while loop to run until we find LCM

i = 0; %initialize i counter


    while noLCM == 1 %while loop runs while LCM is not found
        i = i + 1; %increment i counter to multiply x by integers from 1 to y 
        
        xmultiple = i*x; %multiply x by integers from 1 to y 
        
        j = 0;%initialize j counter for y
        
        ymultiple = j*y; %multiply y  by integers from 1 to x
    
        while ymultiple <= xmultiple %while loop for integers to be multiplied by y 
            j = j+1; %increment j counter to multiply y by integers from 1 to y
            
            ymultiple = j*y;%mutiply y by integers from 1 to x
         
             if ymultiple == xmultiple  %if statement that checks ymultiple and x multiple, 
                 %if they're equal LCM is found
        LCM = xmultiple; %set LCM equal to xmultiple and print
        LCM
        noLCM = 0; %stops while loop
             end
        end

    end
end

        

         
    
    
