%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function that plots the times from the calculate_Nested_For_Loop_Time.m
%%script vs. the N values we input from a vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Nested_Times()

N = [1:1:10 20:10:100 125 150 175 200 225 250]; %vector of N values given

i=1; %initialize i

for i = 1:length(N) %for loop to plot each time from i to the length of vector N
    
    time(i) = Calculate_Nested_For_Loop_Time(N(i)); %calculates the time that corresponds to each N val
end

fs = 18; %font size
lw = 5; %linewidth

loglog(N,time,'m', 'LineWidth',lw) %loglog plot of times vs N
xlabel('N');
ylabel('Time');

