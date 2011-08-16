-module(sum_multiples).
-export([sum_list/1,sum_multiples/0]).

sum_list([H|T]) -> 
	H + sum_list(T);

sum_list([]) -> 0.

sum_multiples() ->
	sum_list([N || N <- lists:seq(1,999), (N rem 3 == 0) or (N rem 5 == 0)]).
