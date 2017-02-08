/*Question 1:*/
sum-up-numbers-simple([], 0).  /*Gives 0 when the list is empty*/

sum-up-numbers-simple([H|T], N) :- /*If H is not a number, takes rest of the list and adds 0 to the sum*/
	not(number(H)),
	sum-up-numbers-simple(T, R),
	N is 0 + R.

sum-up-numbers-simple([H|T], N) :- /*If H is a number, takes rest of the list and adds H to the sum*/
	number(H), 
	sum-up-numbers-simple(T, Rest), 
	N is Rest + H.

/*Question 2:*/
sum-up-numbers-general([], 0).	/*Gives o when the list is empty*/

sum-up-numbers-general([H|T], N) :-	/*If H is a number, takes rest of the list and adds H to the sum*/
	number(H),
	sum-up-numbers-general(T, Rest),
	N is Rest + H.

sum-up-numbers-general([H|T], N) :-	/*If H is not a number and neither a list, then it skips the atom and adds 0 to the sum*/ 
	not(number(H)),
	not(is_list(H)),
	sum-up-numbers-general(T, R),
	N is 0 + R.

sum-up-numbers-general([H|T], N) :-	/*If H is not a number but is a list then adds all the elements from inside the sublist with other lements in the list*/
	not(number(H)),
	is_list(H),
	sum-up-numbers-general(H, Rest1),
	sum-up-numbers-general(T, Rest),
	N is Rest + Rest1.

/*Question 3:*/

get_min([X], X).

get_min([X,Y|Z], Rest1) :-
	number(X),
	number(Y),
	X =< Y,
	get_min([X|Z], Rest1).

get_min([X,Y|Z], Rest1) :-
	not(number(X)),
	number(Y),
	get_min([Y|Z], Rest1).

get_min([X,Y|Z], Rest1) :-
	not(number(Y)),
	number(X),
	get_min([X|Z], Rest1).

get_min([X,Y|Z], Rest1) :-
	number(X),
	number(Y),
	X > Y,
	get_min([Y|Z], Rest1).

/*comparison_func([H|T], Rest1),*/






























