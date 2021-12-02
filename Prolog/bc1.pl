% Reinos de los seres vivos:
reino(monera).
reino(protista).
reino(fungi).
reino(plantae).
reino(animalia).

% Al inicio de la aplicaci�n, abrir la base de
% conocimientos secundaria: consult('bc2.pl')
que_subgrupos(X):-
    consult('bc2.pl'),
    reino(X).

% Para finalizar la aplicaci�n, actualizar la
% base de conocimientos secundaria.
actualizar:-
    tell('bc2.pl'),
    listing(subgrupo/2),
    told.
