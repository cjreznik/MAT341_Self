%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function that determines limit of t_n as n gets large with given sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function val = square_Root_Sequence(m,n) %function takes two inputs m (number in seq) n (nth val in seq)

val = sqrt(m); %first val in seq

for t = 2:n %for loop to run seq
    
    if mod(n,2) == 0 %if even subtract
        
        x = -1;
        
    else     % if odd add
        
        x = 1;
    end
    
    val = sqrt(m + (-1)^t*x*val); %compute nth val
    
end

end

%%limit for m = 13 : 3
%%limit for m = 31 : 5
%%limit for m = 43 : 6