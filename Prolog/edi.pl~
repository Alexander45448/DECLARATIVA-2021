ejercicio3:-
    open('lista_numeros.txt', read, Datos),

    llenar(Datos, Lista),
    close(Datos),

    contar_numeros(Lista, M, N),

    open('total_cont.txt', write, Total),

    write(Total, M),
    write(Total, '\n'),
    write(Total, N),

    close(Total),
    nl.


contar_numeros([], 0, 0).

contar_numeros([X|Lista], M, N):-
    contar_numeros(Lista, M2, N2),
    (
        >(X, 0) ->
        M is M2 + 1,
        N is N2
        ;

        <(X, 0) ->
        M is M2,
        N is N2 + 1
        ;
        M is M2,
        N is N2
    ).

llenar(Datos, Lista):-
    read(Datos, X),
    (
        \==(X, end_of_file),
        llenar(Datos, L2),

        =(Lista, [X|L2])
        ;

        ==(X, end_of_file),
        =(Lista, [])
    ),
!.
