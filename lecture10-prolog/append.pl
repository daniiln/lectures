/* myappend(XS,YS,ZS) holds when ZS is the list formed by appending XS and YS */
myappend([], YS. YS).
myappend([X|XS],YS,[X|ZX]) :- myappend(XS, YS, ZS).
