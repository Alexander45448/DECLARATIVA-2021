% Desplegar los elementos de una lista:

%?- desplegar([a, b, c, d]).

desplegar([]):- !.

desplegar([Cab|Col]):-
    writeln(Cab),
    desplegar(Col).

%desplegar2([a, b, c, d])
desplegar2([]):- !.

desplegar2([Cab|Col]):-
    desplegar2(Col),
    writeln(Cab).

%llenar con los valores de 1 a N

llenar(0, []):- !.

llenar(N, L):-
    >(N, 0),
    is(N2, -(N, 1)),
    llenar(N2, Laux),
    =(L, [N|Laux]).

%LLENAR LISTA DESDE TECLADO

llenarT(L,Lf):-
    writeln('Digite un numero o n para terminar: '),
    read(R),
    insertar(R, L, Lf).

insertar(n, L, L):- !.

insertar(N, L, Lf):-
    llenarT([N|L], Lf).

%sublistas

desplegar3([]):- !.

desplegar3([Cab|Col]):-
    is_list(Cab),
    desplegar3(Cab),
    desplegar3(Col), !.

desplegar3([Cab|Col]):-
    writeln(Cab),
    desplegar3(Col).


%eliminar elemento

eliminar(_, [], []):- !.

eliminar(Ele, [Cab|Col], [Cab|ColAux]):-
    =\=(Cab, Ele),
    eliminar(Ele, Col, ColAux).

eliminar(Ele, [Cab|Col], ColAux):-
    ==(Cab, Ele),
    eliminar(Ele, Col, ColAux).

