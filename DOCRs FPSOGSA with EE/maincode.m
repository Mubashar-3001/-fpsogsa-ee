clear all
close all
clc
for run=1:50 % numbeer of runs;
   %alpha=0.1*i
tic;
    [gBest,GlobalBestCost]=Main
time=toc;
    x(run,:)=[GlobalBestCost,time];
    y(run,:)=[gBest];
save dataset_DOCR_3bus_FPSOGSA_EE_a=221.mat % where to save file, change numbering after every go;
end
