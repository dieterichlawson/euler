-module(factor).
-export([get_two_factors/1, factor/1]).

get_two_factors(2) -> {1,2};
get_two_factors(3) -> {1,3};

get_two_factors(N) ->
	get_two_factors(N,2).


get_two_factors(N,TestFactor) ->
	case TestFactor * TestFactor > N of
		true -> {1,N};
		false -> case N rem TestFactor == 0 of
					true ->  {N div TestFactor, TestFactor};
					false -> get_two_factors(N,TestFactor+1)
				 end
	end.

factor(N) ->
	list_factors([N]).

list_factors([H|T]) ->
	case get_two_factors(H) == {1,H} of
		true -> [H|T];
		false -> {CompFac,PrimeFac} = get_two_factors(H),
			list_factors([CompFac, PrimeFac] ++ T)
	end.
