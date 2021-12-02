%Alexander Ernesto Menéndez Navarrete 00098818

%EJERCICIO 01
%Succ seria en el caso de quien iria primero
que_bebieron(W):-
	=(W, [[_, _, _], [_, _, _],[_, _, _],[_, _, _]]),

	asiento([Angel, angel, _], W),
	asiento([Tequila, _, tequila], W),
	succ(Tequila, Angel),

	asiento([Vino, _, vino], W),
	asiento([Cerveza, _, cerveza], W),
	(not(succ(Cerveza, Vino)) , not(succ(Vino, Cerveza))),

	(asiento([1, _, champana], W); asiento([4, _, champana], W)),

	asiento([Diego, diego, _], W),
	(succ(Vino, Diego) ; succ(Diego, Vino)),

	asiento([Cesar, cesar, _], W),
	succ(Angel, Cesar),

	asiento([Boris, boris, _], W),
	=\=(Boris, Cerveza),!.

%P es nombre de la persona
%B es la bebida
asiento([1, P, B], [[1, P, B], [_, _, _],[_, _, _],[_, _, _]]).
asiento([2, P, B], [[_, _, _], [2, P, B],[_, _, _],[_, _, _]]).
asiento([3, P, B], [[_, _, _], [_, _, _],[3, P, B],[_, _, _]]).
asiento([4, P, B], [[_, _, _], [_, _, _],[_, _, _],[4, P, B]]).

% EJERCICIO 02

% d X

d(X, X, 1):- atom(X), not(number(X)), !.


% d C

d(X, C, 0):- atom(X), not(number(X)), number(C), !.

% d C*X

d(X, C*X, C):-  atom(X), not(number(X)), number(C), !.

% d log(X)
%
d(X, log(X), 1/X):-  atom(X), not(number(X)), !.

% d A^X

d(X, A^X, A^X*log(A)):- atom(X), not(number(X)),number(A), !.

% d X^N

d(X, X^N, N*(X^(N1))):- atom(X), not(number(X)), number(N), =(N1, -(N, 1)), !.

% d X^(1/N)

d(X,  X^(1/N), 1/(N*((X)^(N1/N)))):-  atom(X), not(number(X)), number(N), is(N1, -(N, 1)), !.

d(X, X^(1/N), 1/(N*(((X)^Ne)))):- atom(X), not(number(X)), number(N), is(N1, -(N, 1) ), =(Ne, /(N1, N)), !.

%derivadas polinomios suma (X, Fx+Gx, DFx+DGx)
d(X, Fx+Gx, DFx+DGx) :- atom(X), not(number(X)), d(X,Fx,DFx), d(X,Gx,DGx), !.


%derivadas de polinomios resta(X, Fx-Gx, DFx-DGx)
d(X, Fx-Gx, DFx-DGx) :- atom(X), not(number(X)), d(X,Fx,DFx), d(X,Gx,DGx), !.


% derivada de seno hiperbolico inverso con polinomios

d(X, arcsinh(Fx), DFx/sqrt((Fx^2)+ 1) ):- atom(X), not(number(X)), d(X, Fx, DFx), !.

% EJERCICIO 03

ejercicio3:-
    open('lista_numeros.txt', read, Numeros),
    lista(Numeros, X),
    close(Numeros),
    conteo_Positivo_Negativo(X, A, B),
    open('total_cont.txt', write, Total),
    write(Total, A),
    write(Total, '\n'),
    write(Total, B),
    close(Total),
    nl.

lista(Numeros, X):-
    read(Numeros, Z),
    (
        \==(Z, end_of_file),
        lista(Numeros, X2),
         =(X, [Z|X2]);
        ==(Z, end_of_file),
        =(X, [])),!.

conteo_Positivo_Negativo([], 0, 0).

conteo_Positivo_Negativo([Z|X], A, B):-
    conteo_Positivo_Negativo(X, A2, B2),
    (
        >(Z, 0) ->
        A is A2 + 1,
        B is B2;
        <(Z, 0) ->
        A is A2,
        B is B2 + 1;
        A is A2,
        B is B2).
