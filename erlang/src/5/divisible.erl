-module(divisible).
-export([euler5/0,is_divisible/2]).

% function for determining whether a number is 
% divisible by the numbers 1..Factor 

is_divisible(_,1) ->
	true;

is_divisible(Number,Factor) ->
	case Number rem Factor == 0 of
		true -> is_divisible(Number,Factor -1);
		false -> false
	end.

% Helper function for Euler problem 5
% Finds the smallest number divisible by
% all the numbers from one to 20.

euler5(Number) ->
	case is_divisible(Number,20) of
		true -> Number;
		false -> euler5(Number+20)
	end.

euler5() ->
	euler5(20).
