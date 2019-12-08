
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function plots Gaussian Elimination Scaling using a fixed Nvec and our
% previous Gaussian script

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Gaussian_Elimination_Scaling()

NVec = 2:1:100;

for i = 1:length(NVec) %runs for length of NVector 
    
    OpCount(i) = go_Go_Gaussian_Elimination(NVec(i)); 

end

%first figure using loglog plot
figure(1); loglog(NVec,OpCount,'Blue','LineWidth',5)
xlabel('N')
ylabel('OpCount')

%second figure regular plot
figure(2); plot(NVec,OpCount,'Blue','LineWidth',5)

xlabel('N')
ylabel('OpCount')

% a) As the size of the matrix increases, the number of operations required
% to compute its corresponding row echelon form with N increases and it
% appears to be linear with one plot but quadratic for the other.
