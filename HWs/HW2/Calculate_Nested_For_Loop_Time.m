%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Script given on Canvas that tests how long it takes for a snippet of code
%%to run using tic/toc commands, specifically these nested for loops
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function time = calculate_Nested_For_Loop_Time(N)

N = 20;
tic

k = 0;
for i1 = 1:N
    for i2 = 1:N
        for i3 = 1:N
            for i4 = 1:N
                
                k = k + 1;
            end
        end
    end
end

time = toc
