% Natural NUmbers definition
% natural_number(X) <- X is a natural number
% s is the successor function of arity 1. s^n(0) = n
natural_number(0).
natural_number(s(X)) :- natural_number(X).


% Less Than
% X <= Y <- X and Y are natural numbers such that X is less than or equal to Y	


% Addition .Plus(X,Y,Z) <- X, Y, Z are natural numbers st Z is the sum of X and Y
plus(0,X,X) :- natural_number(X).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

% Times
% X,Y, Z are natural numbers such tach Z is the product of X and Y
times(0,X,0).
times(s(X),Y,Z) :- times(X,Y,XY), plus(XY,Y,Z).

% Exponentiation
% N,X and Y are natural numbers such that Y equals X raised to the power N
exp(s(X),0,0).
exp(0,s(X),s(0)).
exp(s(N),X,Y) :- exp(N,X,Z), times(Z,X,Y).


% Factorial Function
% F and N are natural numbers such that F is the factorial of N
factorial(0,s(0)).
factorial(s(N),F) :- factorial(N,F1), times(s(N),F1,F).

% Minimum
% N1,N2 and Min, are natural numbers such that Min is the smallest of N1 and N2


% MOD
% mod(X,Y,Z) Z is the remainder of integer division of X by Y
mod(X,Y,X) :- X<Y.
mod(X,Y,Z) :- plus(X1,Y,X), mod(X1,Y,Z).


% gcd
%
gcd(X,Y,Gcd) :- mod(X,Y,Z), gcd(Y,Z,Gcd).
gcd(X,0,X) :- X>0.

 