member(X,[X|_]).
member(X,[_|Y]):-member(X,Y).
append([],L,L).
append([H|T],M,[H|T1]):-append(T,M,T1).
reverse([],[]).
reverse([H|T],L):-reverse(T,M),append(M,[H],L).
count([],0).
count([H|T],Y):-count(T,X),Y is X+1.
subset([],S).
subset([H|T],S):-member(H,S),subset(T,S).
union(X,Y,Z):-subset(X,Z),subset(Y,Z).
intersection(X,Y,Z):-subset(Z,X),subset(Z,Y).

older(X,Y):-age(X,Year1),age(Y,Year2),Year1>Year2.
age(eric,15).
age(kate,16).
age(merry,14).

factorial(1,1):-!.
factorial(N,F):-M is N-1,factorial(M,K),F is K*N.

power(_,0,1):-!.
power(X,Y,Z):-L is Y-1,power(X,L,M),Z is M*X.

run:-write('please enter the value of X:'),
read(X),
writetest(X),
write('End of Program;'),nl.
writetest(1):-!,write('One').
writetest(_):-write('Not valid').


sum(0,X):-!,X is 0.
sum(Int,Res):-K is Int-1,sum(K,R),Res is R+Int.

average(I,R):-sum(I,Sum),R is Sum / I.

sum(X,Y,R):-XX is X-1,XX<Y,!,sum(XX,RR),sum(Y,RRR),R is RRR-RR.
sum(X,Y,R):-X>Y,!,sum(Y,X,R).

bitCount(0,No):-No is 0,!.
bitCount(Z,No):-ZZ is Z div 10,bitCount(ZZ,NN),No is NN +1.

integers(L,L,[L]):-!.
integers(Low,High,[H|T]):-H is Low,LL is Low +1,integers(LL,High,T).
remove(X,[],[]):-!.
remove(X,[YH|YT],Z):-A is (YH mod X),A=0,!,remove(X,YT,Z).
remove(X,[YH|YT],[YH|Z]):-A is (YH mod X),A\=0,!,remove(X,YT,Z).

primes(Limit,T):-integers(2,Limit,All),delNoPrimes(All,T).
delNoPrimes([A|All],[A|T]):-remove(A,All,K),delNoPrimes(K,T).
delNoPrimes([],[]):-!.

write_list([]).
write_list([H|T]):-write(H),tab(1),write_list(T).
write_string([]).
write_string([H|T]):-put(H),write_string(T).


init:-write('What is your name?'),nl,read(Name),assertz(user(Name)),
write('Are you male or femail?'),nl,
read(Gender),
add_gender_fact(Gender,Name).
add_gender_fact(male,Name):-assertz(male(Name)).
add_gender_fact(female,Name):-assertz(female(Name)).

bird(X):-covered(X,feathers),fly(X).
covered(hen,feathers).
covered(p,feathers).
covered(budgie,feathers).
fly(p).
fly(budgie).
walk(hen).

getSqrtBit:-write('Please input a number:'),read(X),Y is X*X,bitCount(Y,N),nl,write('The number of len of its square is :'),write(N).

printCalendar:-write('Year:'),read(Year),nl,printYear(Year).
printYear(Year):-write_list(['Year',Year,':']),integers(1,12,T),printMonth(T,Year).
printMonth([],Y).
printMonth([H|T],Year):-not(leapYear(Year)),write_list(['The',H,'Month:\n']),integers(1,30,Day),write_list(Day),writeDay(H),nl,printMonth(T,Year).
printMonth([H|T],Year):-leapYear(Year),write_list(['The',H,'Month:\n']),integers(1,30,Day),write_list(Day),writeDay(H),nl,printMonth(T,Year).
writeDay(H):-A is H mod 2,A=0,write(31).
writeDay(H):-A is H mod 2,A\=0.
leapYear(Y):-A is Y mod 100,A =0.


