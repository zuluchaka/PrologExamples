% We define a family tree. A set of facts defining family relationships
%male(jerry).
%male(stuart).
%male(warren).
%female(kate).
%female(maryalice).
%brother(jerry,stuart).
%brother(jerry,kate).
%sister(kate,jerry).
%parent_of(warren,jerry).
%parent_of(maryalice,jerry).

%father(kamga,ndefo).
%father(donfack,walefack).
%father(donfack, tsafack).
%father(donfack, yemefack).

%male(ndefo).
%male(walefack).
%female(tsafack).
%female(yemefack).

% Family Database
father(Dad, Child) :- parent(Dad,Child), male(Dad).
mother(Mum, Child) :- parent(Mum, Child), female(Mum).
mother(Woman) :- mother(Woman,Child).

% Man and Woman procreated if there is a Child such that Man is the father and Woman the mother
procreated(Man,Woman) :- father(Man, Child), mother(Woman,Child).

% Brother is the brother of Sibling if Parent is the parent of both and Brother is male
brother(Brother, Sibling) :- parent(Parent, Brother), 
			     parent(Parent,Sibling),
			     male(Brother),
			     Brother\= Sibling.
			     
sister(Sister, Sibling) :- parent(Parent, Sister),
			   parent(Parent, Sibling),
			   female(Sister),
			   Sister\= Sibling.			     
			     
			     
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
son(X,Y) :- parent(Y,X), male(X).
daughter(X,Y) :- parent(Y,X), female(Y).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

%
uncle(Uncle,Person) :- brother(Uncle,Parent), 
		       parent(Parent,Person).
uncle(Uncle, Person) :- parent(Parent,Person),
			siblings(Parent, Woman),
			mariage(Uncle, Woman).		       
%
aunt(Aunt,Person) :- sister(Aunt,Parent),
		     parent(Parent,Person).
aunt(Aunt,Person) :- parent(Parent,Person),
		     sibling(Parent, Man),
		     mariage(Man,Aunt).			     		       

%
siblings(Sib1,Sib2) :- parent(Parent,Sib1),
		       parent(Parent,Sib2),
		       Sib1\=Sib2.

% 
cousin(Cousin1,Cousin2) :- parent(Parent1,Cousin1),
			   parent(Parent2,Cousin2),
			   sibling(Parent1,Parent2).
			   
%
grandparent(Ancestor,Descendant) :- parent(Ancestor,Person),
				    parent(Person, Descendant).
				    
greatgrandparent(Ancestor, Descendant) :- parent(Ancestor, Person),
					  grandparent(Person,Descendant).

greatgreatgrandparent(Ancestor, Descendant) :- parent(Ancestor, Person),
					       greatgrandparent(Person, Descendant).
					       
% Ancestors
ancestor(Ancestor, Descendant) :- parent(Ancestor,Person),
				  ancestor(Person, Descendant).
				  					  	   		   
ancestor(Ancestor, Descendant) :- parent(Ancestor, Descendant).				      
		       	
