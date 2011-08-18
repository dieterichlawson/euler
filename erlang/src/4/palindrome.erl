-module(palindrome).
-import(string,[len/1,substr/3]).
-import(lists,[nth/2]).
-export([is_palindrome/1,get_palindromes/1,euler4/0]).

% Filters a list of strings, leaving only the palindromes.

get_palindromes([H|T]) ->
	get_palindromes([H|T],[]).

get_palindromes([],Palindromes) ->
	Palindromes;

get_palindromes([H|T],Palindromes) ->
	case is_palindrome(H) of
		true -> get_palindromes(T,[H|Palindromes]);
		false -> get_palindromes(T,Palindromes)
	end.

% Returns whether or not a string is a palindrome.

is_palindrome([]) -> true;
is_palindrome([_|[]]) -> true;

is_palindrome(Number) ->
	Length = len(Number),
	case nth(1,Number) == nth(Length,Number) of
		true -> is_palindrome(substr(Number,2,Length-2));
		false -> false
	end.

% Euler problem 4 helper function.
% Feeds the multiples of all numbers from 100 to 999 into
% the palindrome filter.

euler4() ->
	Palindromes = get_palindromes([integer_to_list(X * Y) || X <- lists:seq(100,999), Y <- lists:seq(100,999)]),
	Converted = convert_list(Palindromes),
	Sorted= lists:sort(Converted),
	nth(len(Sorted),Sorted).

% Converts a list of Strings to a list of ints.

convert_list([H|T]) ->
	convert_list([H|T],[]).

convert_list([],Converted) ->
	Converted;

convert_list([H|T],Converted) ->
	convert_list(T,[list_to_integer(H)|Converted]).
	
