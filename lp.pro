/*Question 1:*/
sum-up-numbers-simple([], 0).

sum-up-numbers-simple([H|T], N) :- 
	not(number(H)),
	sum-up-numbers-simple(T, R),
	N is 0 + R.

sum-up-numbers-simple([H|T], N) :- 
	number(H), 
	sum-up-numbers-simple(T, Rest), 
	N is Rest + H.

/*Question 2:*/
sum-up-numbers-general([], 0).

sum-up-numbers-general([H|T], N) :-
	number(H),
	sum-up-numbers-general(T, N),
	N is Rest + H.


















