/* mymember(X, L) holds when X is in the list L */

mymember(X, [X|_]).
mymember(X, [_|YS]) :- mymember(X,YS).
