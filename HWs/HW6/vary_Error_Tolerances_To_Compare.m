%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Function that compares the error tolerances of different
%%%scripts from a vector of tolerances and plots them to compare using
%%%semilog and loglog plots



function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11]; %vector of different error tolerances we are passing in

for i = 1:length(errTolVec) %runs for length of error Vector 
   
    % calling the other 2 scripts to run through errTolVec
    gradDescVec1(i) = Gradient_Descent_1(errTolVec(i),1); 
    gradDescVec2(i) = Gradient_Descent_2(errTolVec(i));
    
end


%%plot figure comparing each method in different colors using semilogx
figure(1);semilogx(errTolVec,gradDescVec1, 'Blue',errTolVec,gradDescVec2, 'Red','LineWidth', 5);

xlabel ('Error Tolerance (tol)');
ylabel ('# of Iterations (N)');
legend('Fixed Step' , 'Barzilai-Borwein');

%%plot figure comparing each method in different colors using loglog

figure(2);loglog(errTolVec,gradDescVec1, 'Blue',errTolVec,gradDescVec2, 'Red','LineWidth', 5);
xlabel ('Error Tolerance (tol)');
ylabel ('# of Iterations (N)');
legend('Fixed Step', 'Barzilai-Borwein');

%%a) The first algorithm converges to the minimum faster
%%b) If you change the fixed step size to gamma = 0.5 then the second
%%algorithm converges faster.
%%c)The advantage of using Barilai-Borwein step size is that it takes less
%%time to converge.
%%d) If I were to modify my code to minimize a different function I would
%%choose the second method so it adjusts the gamma as it runs.
