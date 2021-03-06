%EJERCICIO 1

par_o_non2(A) :-
    mod(A, 2) =:= 0.

par_o_non(A, B) :-
    random(0, 5, Num1),
    random(0, 5, Num2),

    write(A),
    write(' saca '),
    writeln(Num1),

    write(B),
    write(' saca '),
    writeln(Num2),

    Z = +(Num1, Num2),

    jugador_gana(Z, A, B), !.

jugador_gana(Z, _A, _B) :-
    ==(Z, 0),
    writeln('Empate').

jugador_gana(Z, A, _B) :-
    par_o_non2(Z),
    write('Gana '),
    writeln(A).

jugador_gana(Z, _A, B) :-
    not(par_o_non2(Z)),
    write('Gana '),
    writeln(B).

%
%
%
%EJERCICIO 3

es_par(A) :- mod(A, 2) =:= 0.

problema3(A, B) :-
    <(A, 10),
        num(A, B), !.

problema3(A, B) :-
    >(A, 10),
        numero_ingresado(A, X),
        num(X, Y),

        numero_nuevo(A, N),
        problema3(N, P),

        atom_concat(P, Y, B), !.

num(A, B) :-
    A =:= 0,
    is(B, 0), !.

num(A, B) :-
    es_par(A),
    is(B, +(A, 1)), !.

num(A, B) :-
    not(es_par(A)),
    is(B, -(A, 1)), !.


numero_ingresado(A, B) :- is(B, mod(A, 10)).
numero_nuevo(A, B) :- is(B, //(A, 10)).






