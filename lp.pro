/*friend(aalu, pande).*/

/*father(mukunde, thule).*/
/*father(mukunde, sane).*/




/*parent(mukunde, thule) :- father(mukunde, thule).*/
/*parent(mukunde, sane) :- father(mukunde, sane).*/
/*siblings(thule, sane) :- parent(mukunde, thule), parent(mukunde, sane).*/


/*sum-up-numbers-simple(L, N).*/

sum-up-numbers-simple([], 0).

sum-up-numbers-simple([not(number(H))|T], N) :- 
	sum-up-numbers-simple(T, R),
	N is 0 + R.

sum-up-numbers-simple([number(H))|T], N) :- sum-up-numbers-simple(T, Rest), Rest = N - H.

/*sum-up-numbers-simple([isInteger(H)|T], N) :-*/ 











