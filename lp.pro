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

get_min([X,Y|Z], Rest1) :- 	/*If the both lists are not number, takes the rest of the list and recursion.*/
	not(number(X)),
	not(number(Y)),
	get_min(Z, Rest1).

comparison_func([], _, []). 

comparison_func([H|T], Min, Rest) :- /*If H is not a number, recursive on the function with the tail of the list*/
	not(number(H)),
	comparison_func(T, Min, Rest).

comparison_func([H|T], Min, Rest) :-	/*If H is a number and is greater than min then is added to the list Rest*/
	number(H), 
	H > Min,
	comparison_func(T, Min, Rest1),
	append([H], Rest1, Rest).

comparison_func([_|T], Min, Rest) :-	/*If H is a number and is less than min, recursive on function with the tail of the list*/
	comparison_func(T, Min, Rest).


/*Question4: */

makelistflat_func([], []).	/*If the List is empty, returns empty flatlist.*/


makelistflat_func([H|T], Flatlist) :-  /*If the head is sublist, recursion on Head to flatten the list and takes tail of the list, recursion on it to flatten the list.*/
	is_list(H),
	makelistflat_func(H, Flatlist1),
	makelistflat_func(T, Flatlist2),
	append(Flatlist1, Flatlist2, Flatlist).
	
makelistflat_func([H|T], Flatlist) :-	/*If the Head is not a list, adds head to the list and recurson on tail.*/
	not(is_list(H)),
	makelistflat_func(T, Flatlist1),
	append([H], Flatlist1, Flatlist).

common_list([], _, []).	/*If the List1 is empty and List2 is empty as well, returns empty list*/

common_list([H|T], List2, [H|Same]) :- 	/*If the Head of the List1 is the member of List2, adds it to the new list Same.*/
	member(H, List2),
	common_list(T, List2, Same).

common_list([H|T], List2, Same) :-	/*If the head of the list1 is not a member of List2, recursion on tail of List1*/
	not(member(H, List2)),
	common_list(T, List2, Same).

common-unique-elements(L1, L2, N) :-	/*Flattens the L1 and L2 and returns the common elements from the list*/
	makelistflat_func(L1, Flatlist1),
	makelistflat_func(L2, Flatlist2),
	common_list(Flatlist1, Flatlist2, N).

	




