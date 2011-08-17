-module(fib).
-export([fib/1,euler2/0,sum_fib/2]).

%Pointless fibonnaci function

fib(1) -> 1;
fib(0) -> 0;
fib(N) -> fib(N-1) + fib(N-2).

%Function to calculate the sum of the even fibonacci terms below 4 million
euler2() ->
	sum_fib({1,1},0).

sum_fib({Fib1,Fib2},Sum) ->
	NextFib = Fib1 + Fib2,
	if
		Fib2 > 4000000 -> Sum;
		true -> sum_fib({Fib2, NextFib}, case NextFib rem 2 of 0 -> Sum + NextFib; 1 -> Sum end)
	end.
