%Alexander Ernesto Men?ndez Navarrete 00098818
%Miguel Angel Mesquita Portillo 00043818
%Walter Rafael Morales Henr?quez 00019618

%EJERCICIO 1

contar_ocurrencias(Numero,Ocurrencia,N):-
    contar(Numero,Ocurrencia,N).

contar(Numero,Ocurrencia,N):-
    <(Numero,10),
    =:=(Numero,Ocurrencia),
    is(N,1),!.

contar(Numero,_,N):-
    <(Numero,10),
    is(N,0),!.

contar(Numero,Ocurrencia,N):-
    >=(Numero,10),
    is(Modulo,mod(Numero,10)),
    =:=(Modulo,Ocurrencia),
    contar(//(Numero,10),Ocurrencia,Acumulador),
    is(N,+(Acumulador,1)),!.

contar(Numero,Ocurrencia,N):-
    >=(Numero,10),
    is(Modulo,mod(Numero,10)),
    \==(Modulo,Ocurrencia),
    contar(//(Numero,10),Ocurrencia,Acumulador),
    is(N,+(Acumulador,0)),!.

%EJERCICIO 2

eliminarL(Lista,Ocurrencia,X):-
    eliminar(Lista,Ocurrencia,X).

eliminar([],_,[]):-!.

eliminar([Cabeza|Cola],Ocurrencia,X):-
    eliminar(Cola,Ocurrencia,Acumulador),
    \==(Ocurrencia,Cabeza),
    =(X,[Cabeza|Acumulador]),!.


eliminar([Cabeza|Cola],Ocurrencia,X):-
    eliminar(Cola,Ocurrencia,Acumulador),
    ==(Ocurrencia,Cabeza),
    =(X,Acumulador),!.

%EJERCICIO 3

invierte(Lista,Resultado):-
    invertir(Lista,[],ListaFinal),
    =(Resultado,ListaFinal).

invertir([],Lista,Lista):-!.

invertir([Cabeza|Cola],ListaAcumulada,ListaFinal):-
    =(ListaAux,[Cabeza|ListaAcumulada]),
    invertir(Cola,ListaAux,ListaFinal).

%EJERCICIO 4

puesto([X,1], [[X,1],_,_,_]).
puesto([X,2], [_,[X,2],_,_]).
puesto([X,3], [_,_,[X,3],_]).
puesto([X,4], [_,_,_,[X,4]]).

competencia(Llegada):-
    writeln("La llegada es: "),
    =(Llegada,[_,_,_,_]),
    %Tato llega inmediatamente despues de milo
    puesto([tato, L1],Llegada),
    puesto([milo, L2],Llegada),
    =:=(+(L2,1),L1),
    %Chepe no llego primero
    puesto([chepe, L3],Llegada),
    =\=(L3, 1),
    %Jose supero a Milo
    puesto([jose, L4], Llegada),
    <(L4,L2).

