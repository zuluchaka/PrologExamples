% This is an example of directed graph in Prolog
% We define the graph by its edges
% for example, edge(a,b). specifies that there is an edge from a to b in the directed graph 
edge(a,b).
edge(a,e).
edge(b,d).
edge(b,c).
edge(c,a).
edge(e,b).
path_of_length_three(X,Y) :- tedges(X,Y).
% Definition of a Rule for the property 'Path of length 2' between two edges

tedges(Node1,Node2) :- edge(Node1,MiddleNode),
		       edge(MiddleNode, Node2).
% Definition of a Rule for the property 'Path of length 3' between two edges
	% First Solution only using the 'edge' predicate
%tripleedges(Node1,Node2) :- edge(Node1,FirstMiddleNode),
%			    edge(FirstMiddleNode,SecondMiddleNode),
%			    edge(SecondMiddleNode, Node2).
	%Second Solution only using the 'tedges' predicate
tripleedges(Node1,Node2) :- tedges(Node1, SecondMiddleNode),
			    edge(FirstMiddleNode,SecondMiddleNode),	
			    tedges(FirstMiddleNode,Node2).

path(Node1,Node2) :- edge(Node1,Node2).
path(Node1,Node2) :- edge(Node1,NextNode),
		     path(NextNode, Node2).			    			    	
		       
% Generating a Chain
% We define a predicate CHAIN, when given 2 nodes, will list nodes in a path from the 1st node 
% to the 2nd. Chain(X,Y,Z) . Take each node in the path from X to Y , add it to Z.

% Condition 1 : if there is an edge from X to Y, there is a chain [X,Y]

%

% Condition 2 : if no path exists from X to Y, then the chain should be empty
%

% Condition 3 : 

chain(X,Y,[X,Y]) :- edge(X,Y).
chain(X,Y,[X|Z]) :- edge(X,NextNode),
		    path(NextNode,Y),
		    chain(NextNode,Y,Z).
chain(X,Y,[]).




