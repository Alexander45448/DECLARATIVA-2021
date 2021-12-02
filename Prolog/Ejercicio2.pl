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

invertir(Lista,Resultado):-
    invertir_lista(Lista,[],ListaFinal),
    =(Resultado,ListaFinal).

invertir_lista([],Lista,Lista):-!.

invertir_lista([Cabeza|Cola],ListaAcumulada,ListaFinal):-
    =(ListaAux,[Cabeza|ListaAcumulada]),
    invertir_lista(Cola,ListaAux,ListaFinal).

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
