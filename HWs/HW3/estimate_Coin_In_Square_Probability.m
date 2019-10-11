%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function estimates the probability a coin, radius r, is fully contained  
%in a square [0,1] X [0,1]  when flipped
% 2a) N = 1e5 is a reasonable amount of trials because as N gets bigger
%the probability approachs a certain probability around .64. This is 
% more difficult than what we did in class because in class we knew the
% probability analytically but here we do not know it analytically, so 
% we have nothing to compare our values to
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function prob = estimate_Coin_In_Square_Probability(r,N)

coinflip = 0; %initialize counter at 0

for i = 1:N 
    x = rand;%pick a random number
    y = rand;%pick a random number
    
    if ((x-r > 0) && (x+r < 1) && (y-r > 0) && (y+r < 1)) %if statement determining if coin is within square
        
        coinflip = coinflip + 1; %increment counter 
        

    end
    
end

prob = coinflip/N %print probability, total coin flips over N