function vary_Error_Tolerances_To_Compare

errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12]; %vector of different error tolerances we are passing in

for i = 1:length(errTolVec) %runs for length of error Vector 
    
    ParabolaVec(i) = successive_Parabolic_Interpolation(errTolVec(i)); %pass errTolVec in Parabolic script
    
    GoldenSearchVec(i) = golden_Search(errTolVec(i)); %pass errTolVec in Golden Search script
    
    
end


%%plot figure comparing each method in different colors using semilogx
figure(1);semilogx(errTolVec,GoldenSearchVec, 'blue', 'LineWidth', 5);hold on;semilogx(errTolVec,ParabolaVec, 'red','LineWidth', 5);hold off
xlabel ('Error Tolerance (tol)')
ylabel ('Number of Iterations (N)')
legend('Golden Search', 'Parabolic Interpolations');

%%plot figure comparing each method in different colors using loglog

figure(2);loglog(errTolVec,ParabolaVec, 'red','LineWidth', 5); hold on; loglog(errTolVec,GoldenSearchVec, 'blue','LineWidth', 5) ;hold off

xlabel ('Error Tolerance (tol)')
ylabel ('Number of Iterations (N)')
legend('Parabolic Interpolations','Golden Search');

%% a)The Parabolic Algorithm appears to converge faster to the minimum for bigger tolerances and the 
%% Golden Search Algorithm appears to converge faster to for smaller
%% tolerances
%% b) When you increase the accuracy threshold the Golden Search algorithm converges quicker because the Parabolic 
%% algorithm runs into problems with inverting matrices as we found in problem 2.  