% Testpraedikate fuer die Berechnung der Fakultaet einer nat. Zahl
fak(0,1).
fak(N,Fak):- N>0, M is N-1,
             fak(M,F1),
             Fak is N*F1.

% 2. Version, hier aber mit vertauschter Reihenfole der Klauseln
fakul(N,Fak):- N>0,M is N-1,
             fakul(M,F1),
             Fak is N*F1.
fakul(0,1).
/* Die Bedingung N>0 darf in den obigen Klauseln nicht weggelassen werden! */

% 3. Version, die einen cut nutzt, um unnoetiges Vorhalten von backtracking-Punkten
% zu verhindern
faku(0,1):- !.
faku(N,Fak):- M is N-1,
              faku(M,F1),
              Fak is N*F1.

% Akkumulatorvariante

fakt(N,F):- fak_trans(N,1,F).

fak_trans(N,Akk,F):- N>0, Akkneu is N*Akk, N1 is N-1,
                     fak_trans(N1,Akkneu,F).
fak_trans(0,F,F).
