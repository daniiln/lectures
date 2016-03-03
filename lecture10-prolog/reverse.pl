/* myreverse(XS, YS) holds when YS is the reverse of XS */

myreverse([], []).
myreverse([X|XS], YS) :- myreverse(XS, ZS), append(ZS, [X], YS).
