%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calls estimate_Coin_In_Square_Probability and plots radii against 
%probailities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function vary_Radii_Plot()

N = 1e5;
rVec = [0.01:0.005:0.10 0.1:0.01:0.5]; %vector of radii values

    for i = 1:length(rVec)
    
    estimatedProbs(i) = estimate_Coin_In_Square_Probability(rVec(i),N); %passes vector of r values into this function 
    end

plot(rVec, estimatedProbs) %plots the r values vs probailities

lw = 4; %linewidth
fs = 18; %fontsize

xlabel('radius');
ylabel('Probability'); %labels

set(gca,'FontSize',fs);

end
