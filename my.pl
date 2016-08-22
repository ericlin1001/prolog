love(a,b).
love(b,c).
love(d,c).
love(c,d).
love(a,d).
partlove(X,Y):-love(X,Z),love(Z,Y).
