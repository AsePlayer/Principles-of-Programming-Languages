weather(raining).
weather(snowing).

too_cold(freezing).


/*If it is raining or snowing, then there is precipitation.*/
precipitation(X) :-
    weather(X).


/*If it is freezing and there is precipitation, then it is snowing.*/
snowing(X,Y) :-
too_cold(X),
precipitation(Y).


/*If it is not freezing and there is precipitation, then it is raining.*/
raining(X,Y) :-
true, \+ too_cold(X),    /*if it is not freezing*/
precipitation(Y).


addList(LISTA,LISTB) :-
	LISTC = [LISTA,LISTB].
	write(LISTC).