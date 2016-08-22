converse:-read(In),response(In,Out),write(Out),nl,converse.
response([],[]).
response([H|T],[L|M]):-transform(H,L),response(T,M).



print_list([]).
print_list([H|T]):-write(H),tab(1),print_list(T).

english:-nl,write('User >'),text(Inlist),continue(Inlist).
continue([finish,.]):-!.
continue(Inlist):-response(Inlist,Outlist),write('Computer >'),print_list(Outlist),english.

text([Word|Words]):-get0(Char),word(Char,Word,Char1),rest(Word,Char1,Words).
rest('.',_,[]):-!.
rest(Word,Char,[Word1|Words]):-word(Char,Word1,Char1),rest(Word1,Char1,Words).
word(46,'.',_):-!.
word(Char,Word,Char2):-check(Char),!,get0(Char1),restw(Char1,Chars,Char2),name(Word,[Char|Chars]).
word(Char,Word,Char2):-get0(Char1),word(Char1,Word,Char2).
restw(Char,[Char|Chars],Char2):-check(Char),!,get0(Char1),restw(Char1,Chars,Char2).
restw(Char,[],Char).
check(Char):-Char>96,Char <123.

transform(are,no).
transform(you,'I am').
transform(computer,person).
transform(man,woman).
transform(tired,awak).
transform(foolish,intelligent).
transform(intelligent,stupid).
transform(how,' ').
transform(is,' ').
transform(weather,'weather is fine').
transform(what,' ').
transform(your,my).
transform(name,'name is Percy').
transform(i,' ').
transform(am,hello).
transform(X,X).
