dec_bin(0,'0').
dec_bin(1,'1').
dec_bin(N,B):-N>1,X is N mod 2,Y is N//2,dec_bin(Y,B1),atom_concat(B1, X, B).


decOct(A,B):-A<8, B is A,write(B).
decOct(A,B):-A>8,C is A//8,X is A mod 8,write(X),decOct(C,B).

