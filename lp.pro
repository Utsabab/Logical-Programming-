/*friend(aalu, pande).*/

/*father(mukunde, thule).*/
/*father(mukunde, sane).*/




/*parent(mukunde, thule) :- father(mukunde, thule).*/
/*parent(mukunde, sane) :- father(mukunde, sane).*/
/*siblings(thule, sane) :- parent(mukunde, thule), parent(mukunde, sane).*/


/*sum-up-numbers-simple(L, N).*/

sum-up-numbers-simple([], 0).

sum-up-numbers-simple([H|T], N) :- 
	not(number(H)),
	sum-up-numbers-simple(T, R),
	N is 0 + R.

sum-up-numbers-simple([H|T], N) :- 
	number(H), 
	sum-up-numbers-simple(T, Rest), 
	N is Rest + H.

/*sum-up-numbers-simple([isInteger(H)|T], N) :-*/ 












