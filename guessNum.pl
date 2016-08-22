%adfadsf
secret_number(48).
guess(X,'Too small!'):-secret_number(A),X<A.
guess(X,'Too big!'):-secret_number(A),X>A.
guess(X,'Correct!'):-secret_number(A),X=A.
begin:-write('Guess:'),read(X),guess(X,A),write(A),nl,ansTest(A),begin.
ansTest(A):-A='Correct!',fail.
ansTest(A):-A\='Correct!'.
