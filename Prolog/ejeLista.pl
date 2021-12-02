clave_secreta(Clave):-
    =(Clave,[N1, N2, N3, N4, N5]),
    digito(N5),
    digito(N3),
    =:=(+(N5, N3), 14), %plus(N5, N3, 14)
    digito(N4),
    digito(N2),
    %=:=(+(N4, N2+1), N2),
    =:=(N4, +(N2, 1)),
    digito(N1),
    =:=(N1, -(*(N2, 2), 1)),
    plus(N2, N3, 10),
    =:=(+(N1, +(N2, +(N3, +(N4, N5)))), 30).

digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).


gente(Piso):-
    =(Piso,[_, _, _, _, _]),
    asignar([chilo, X], Piso),
    asignar([canuta, Y], Piso),
    =\=(Y, 1),



asignar([X, 1], [[X, 1], _, _, _, _]).
asignar([X, 2], [ _,[X, 2], _, _, _]).
asignar([X, 3], [_, _, [X, 3], _, _]).
asignar([X, 4], [_, _, _, [X, 4], _]).
asignar([X, 5], [_, _, _, _, [X, 5]]).
