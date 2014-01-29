%Logic programs can extends relational data model
% Relational algebra <-> logic programs
% procedures composed only by facts = relations
% UNION, SET DIFFERENCE, CARTESIAN PRODUCT, PROJECTION, SELECTION.

% UNION (r,s) - creates a relation of arity n from 2 relations r ans s both of arity n
% r_union_s(X1,X2,...,Xn) <- r(X1,X2,...,Xn)
% r_union_s(X1,X2,...,Xn) <- s(X1,X2,...,Xn)

% SET DIFFERENCE(r,s)
% r_diff_s(X1,X2,...,Xn) <- r(X1,X2,...,Xn), not s(X1,X2,...,Xn)

% CARTESIAN PRODUCT
% r_x_s(X1,X2,..,Xm,Xm+1,...,Xm+n) <- r(X1,X2,...,Xm),s(Xm+1,Xm+2,...,Xm+n)

% PROJECTION
% r13(X1,X3) <- r(X1,X2,X3)

% SELECTION
% r1(X1,X2,X3) <- r(X1,X2,X3), X3>X2
 