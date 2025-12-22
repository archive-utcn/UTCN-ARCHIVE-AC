clear

G1 = tf(1, [1, 1]);         % -1 pol real => supra-amortizat (nu avem oscilatii)
G2 = tf(1, [1, -1]);        % 1 pol real => supra-amortizat (nu avem oscilatii)
G3 = tf(1, [1, 0, -1]);     % -1, 1 poli reali => supra-amortizat (nu avem oscilatii)
G4 = tf(1, [1, 0, 1]);      % -j, j poli complecsi => subamortizat (avem oscilatii)
G5 = tf(1, [1, 2, 17]);     % -1 - 4 * j, -1 + 4 * j poli complecsi => subamortizat (avem oscilatii)
G6 = tf(1, [1, -2, 17]);    % 1 - 4 * j, 1 + 4 * j poli complecsi => subamortizat (avem oscilatii)

grafic(G1, 1);
grafic(G2, 2);
grafic(G3, 3);
grafic(G4, 4);
grafic(G5, 5);
grafic(G6, 6);
