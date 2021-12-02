%Derivadas tranquilas:

%Derivadas de una constante:
d(X, C, 0):- number(C), atomic(X), \==(C, X), !.

%Derivada de X:
d(X, X, 1):- atomic(X), \+ number(X), !.

%Derivada de X a la N:
d(X, X^N, N*X^E):- atomic(X), number(N), is(E, -(N, 1)), !.

%Derivada del logaritmo natural de X:
d(X, log(X), 1/X):- atomic(X), \+ number(X), !.

%Derivada de una constante por X:
d(X, C*X, C):- atomic(X), number(C), !.

%Derivada de una constante por una funcion:
d(X, C*Fx, C*DFx):- number(C), d(X, Fx, DFx), !.

%Derivada de la suma de dos funciones:
d(X, Fx+Gx, DFx+DGx):- d(X, Fx, DFx), d(X, Gx, DGx), !.
d(X, Fx-Gx, DFx-DGx):- d(X, Fx, DFx), d(X, Gx, DGx), !.


