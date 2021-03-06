abre_cierra:-
    open('miarchivo.txt', write, Archivo),
    close(Archivo).

leer_de_archivo:-
    open('nombre.txt',read, DatosPers),
    write('El nombre almacenado es:'),
    read(DatosPers, Var),

    write(Var),
    close(DatosPers).

grabar_en_archivo:-
    writeln('Introduzca su nombre:'),
    read(Var),

    open('nombre.txt',write, DatosPers),
    write(DatosPers, Var),

    close(DatosPers).

grabar_en_archivo2:-
    writeln('Introduzca el nombre del arhivo en disco:'),
    read(NomArch),

    writeln('Introduzca el nombre el Flujo:'),
    read(NomFlujo),

    writeln('Introduzca su nombre:'),
    read(Var),


    open(NomArch,write, NomFlujo),
    write(NomFlujo, Var),
    close(NomFlujo).

leerDeArchivoVacio:-
    open('ArchivoVacio.txt',read,MiArchivo),
    read(MiArchivo, Dato),

    probar(Dato),
    close(MiArchivo).

probar(Dato):-
    ==(Dato, end_of_file),
    writeln('Se ha llegado al final del archivo').

probar(Dato):-
    \==(Dato, end_of_line),
    writeln('Todabia hay datos que leer en el archivo').

leerDeArchivoNoVacio:-
    open('lista_numeros.txt', read, ListaNumeros),
    lectura(ListaNumeros),
    close(ListaNumeros).

lectura(Flujo):-
    read(Flujo, Valor),
    probar(Valor, Flujo).

probar(Valor, Flujo):-
    \==(Valor, end_of_file),
    write(Valor), nl,
    lectura(Flujo),!.

probar(Valor, _):-
    ==(Valor, end_of_file),
    write('Se agotaron los datos'), nl.

grabarLista(L):-
    write('Digite el nombre del archivo destino:'),
    read(NomArch),

    open(NomArch, write, ListaNumeros),
    meteNumeros(ListaNumeros, L),
    close(ListaNumeros).

meteNumeros(_, []).
meteNumeros(Flujo, [Cab|Col]):-
    write(Flujo, Cab),
    write(Flujo, '.'),
    write(Flujo, '\n'),
    meteNumeros(Flujo, Col).


copiarArchivo:-
    open('archivoIn.txt',read,In),
    open('archivoOut.txt',write,Out),
    get(In, Car),

    copiar(Car, In, Out),
    close(In),

    close(Out).

copiar(-1,_,_):-!.

copiar(Car, In, Out):-
    put(Out, Car),
    get(In, C1),
    copiar(C1, In, Out).

copiarArchivo2:-
 open('archivoIn.txt',read,In),
    open('archivoOut.txt',write,Out),
    get_char(In, Car),

    copiar2(Car, In, Out),
    close(In),

    close(Out).

copiar2(end_of_file,_,_):-!.

copiar2(Car, In, Out):-
    put_char(Out, Car),
    get_char(In, C1),
    copiar2(C1, In, Out).
