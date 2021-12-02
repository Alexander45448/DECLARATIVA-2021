%Alexander Ernesto Menéndez Navarrete 00098818
%Miguel Angel Mesquita Portillo 00043818
%Walter Rafael Morales Henríquez 00019618

%EJERCICIO 1
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


% derivada de seno trigonometrico inverso con polinomios

d(X, arcsin(Fx), DFx/sqrt(1 -(Fx^2)) ):- atom(X), not(number(X)), d(X, Fx, DFx), !.

% derivada de coseno trigonometrico inverso con polinomios

d(X, arccos(Fx), -DFx/sqrt(1 -(Fx^2)) ):- atom(X), not(number(X)), d(X, Fx, DFx), !.

% derivada de tangente trigonometrico inverso con polinomios

d(X, arctan(Fx), DFx/1 +(Fx^2) ):- atom(X), not(number(X)), d(X, Fx, DFx), !.

% derivada de cosecante trigonometrico inverso con polinomios

d(X, arccsc(Fx), -DFx/ Fx * (sqrt((Fx^2)- 1))):- atom(X), not(number(X)), d(X, Fx, DFx), !.

% derivada de secante trigonometrico inverso con polinomios

d(X, arcsec(Fx), DFx/ Fx * (sqrt((Fx^2)- 1))):- atom(X), not(number(X)), d(X, Fx, DFx), !.

% derivada de cotangente trigonometrico inverso con polinomios

d(X, arccot(Fx), -DFx/1 +(Fx^2)):- atom(X), not(number(X)), d(X, Fx, DFx), !.


% EJERCICIO 2

ejercicio2:-
    open('numeros.txt', read, Numeros),
    lista(Numeros, X),
    close(Numeros),
    conteo_par_impar(X, A,B),
    open('conteo.txt', write, Total),
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

conteo_par_impar([], 0,0).

conteo_par_impar([Z|X], A,B):-
    par(Z),
    conteo_par_impar(X, A2,B2),
    A is A2 + Z,
    B is B2.
conteo_par_impar([_Z|X],A,B):-
    not(par(_Z)),
    conteo_par_impar(X,A,B).

par(Z):-
    Z mod 2 =:=0.



