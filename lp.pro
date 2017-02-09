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

min-above-min(L1, [], N) :-	/*If the List2 is empty, returns min value from L1*/
	get_min(L1, N).

min-above-min([], L2, N) :-	/*If the list1 is empty, returns -1"*/
	N is -1.
	
min-above-min(L1, L2, N) :-	/*Gets the minimum number from List2, compare it with the list1 and get the new_list with numbers greater than minimum number from List2 and find the 									minimum of new_list*/
	get_min(L2, Min_num),
	comparison_func(L1, Min_num, New_list),
	get_min(New_list, N).

get_min([X], X).

get_min([X,Y|Z], Rest1) :-	/*IF X and Y are both numbers and if X is smaller than Y, X is minimum*/
	number(X),
	number(Y),
	X =< Y,
	get_min([X|Z], Rest1).

get_min([X,Y|Z], Rest1) :-	/*If X is not a number and Y is then Y is minimum*/
	not(number(X)),
	number(Y),
	get_min([Y|Z], Rest1).

get_min([X,Y|Z], Rest1) :-	/*If Y is not a number and X is then X is minimum*/
	not(number(Y)),
	number(X),
	get_min([X|Z], Rest1).

get_min([X,Y|Z], Rest1) :-	/*If X and Y are both numbers and if X is greater than Y, Y is minimum*/
	number(X),
	number(Y),
	X > Y,
	get_min([Y|Z], Rest1).

comparison_func([], Min, []). 

comparison_func([H|T], Min, Rest) :- /*If H is not a number, recursive on the function with the tail of the list*/
	not(number(H)),
	comparison_func(T, Min, Rest).

comparison_func([H|T], Min, [H|Rest]) :-	/*If H is a number and is greater than min then is added to the list Rest*/
	number(H), 
	H > Min,
	comparison_func(T, Min, Rest).

comparison_func([_|T], Min, Rest) :-	/*If H is a number and is less than min, recursive on function with the tail of the list*/
	comparison_func(T, Min, Rest).


