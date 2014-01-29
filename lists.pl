% List manipulations with Prolog
list([ ]).
list([X|Xs]) :- list([Xs]).



% Append operation
append([], List,List).
append([H | Tail], X , [ H | NewTail]) :-  append(Tail,X, NewTail).

% Reversing a List

% Condition 1 : the Reverse of an empty List is an empty List
reverse([],[]).

% Condition 2 : To reverse a non-empty List, first reverse the tail, and append the Head
%               to the Result.
reverse([H | Tail], ReversedList) :- reverse(Tail, ReversedTail),
				     append(ReversedTail, [H], ReversedList).
				     
% Membership predicate
% Identify if a value X is in the List

% Condition 1: X is in the List when X is the head of the list
%memb(X,[X | _]).

% Condition 2: if X is not the Head, it is in the List if it is in the Tail
%memb(X,[_ | Tail]) :- memb(X,Tail).

% Another Solution with only one rule : 
% memb(X,[H | Tail]) :- X=H; memb(X,Tail).
memb(X,[X|Xs]).
memb(X,[Y|Ys]) :- memb(X,Ys).
