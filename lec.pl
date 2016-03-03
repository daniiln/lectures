mated(X, Y) :- father(X, Z), mother(Y, Z)
 
mated(X, Y) :- father(X, Z), mother(Y, Z)


mymember(X, [X|_]).
mymember(X, [_|YS]) :- mymember(X,YS).

#append

myappend(
