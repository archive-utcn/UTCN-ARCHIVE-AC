close all
clear all
clc
for k = 0:0.5:10,
    pol = [1 2 3 k];
    pause;
    if k == 0
        figure, plot(real(roots(pol)), imag(roots(pol)), '*');
        hold on
    else
        plot(real(roots(pol)), imag(roots(pol)), '*');
    end
end