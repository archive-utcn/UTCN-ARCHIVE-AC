function grafic(G, index)

figure, impulse(G, 10), grid on;
title(index);
hold on;
step(G, 10), grid on;
hold off;

end