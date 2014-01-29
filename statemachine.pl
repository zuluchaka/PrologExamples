% This example simulates a Final State Machine (FSM)
% We define the machine by its states, transitions and actions to take at each state.

% Initial State
start(s).

% Final States
final(f1).
final(f2).

% Transitions
delta(s,a,q1).
delta(s,b,q2).
delta(q1,b,s).
delta(q1,a,f1).
delta(q2,a,s).
delta(q2,b,f2).

% We want to know what input String are accepted by this FSM
% our goal is the ACCEPT predicate



% Condition 2 : on state q ACCEPT if the is a path from q to a final state, after seeing X
accept(q,[X|XS]) :- delta(q,X,q1),
		    accept(q1,XS).
% Condition 3 : final state are ACCEPT states		    
accept(f,[]) :- final(f).		     
	     		    
% Condition 1 : We ACCEPT the initial state S if it is also an accept State
accept(s) :- start(s),
	     accept(q,s).

	     