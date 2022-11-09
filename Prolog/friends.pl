character(joey).
character(ross).
character(rachel).
character(phoebe).
character(monica).
character(chandler).

likes(ross,rachel).
likes(rachel,ross).
likes(monica,chandler).
likes(chandler,monica).
likes(chandler,phoebe).
likes(phoebe,joey).
likes(monica,joey).
likes(joey,rachel).


dating(X,Y) :-
likes(X,Y),
likes(Y,X).

attraction(X,Y) :-
likes(X,Y);
likes(Y,X).
