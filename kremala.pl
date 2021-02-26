								%	Παπουνίδης	Πανγκράτης

% -------- Ελεγχει αν το γραμμα ειναι μελος την λιστας------

melos(M, [M|T]).

melos(M, [H|T]) :-
	melos(M, T).
	
% -------------- Βρισκει το τελευταιο γραμμα ---------------

teleytaio([L], L).

teleytaio([H|T], L) :-
	teleytaio(T, L).

% -------------- Ευρεση θεσης ενως χαρακτηρα ---------------

element([N|T], 1, N).

element([H|T], N, X) :-
	element(T, N1, X),
	N is N1 + 1.


% -------------- Αλλαγη χαρακτηρα στην θεση R ---------------
	
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):-
I > 0,
I1 is I-1,
replace(T, I1, X, R).
	
	
% -------------- Δημιουργια πινακα κενων θεσεων -------------

build(X, N, List)  :- 
    length(List, N), 
    maplist(=(X), List).


% --------------- Δινεις γραμμα και γινεται ελεγχος ---------	

foundLetter(L,W,B,K,W1,I):-
	nl,
	write("Dwse ena gramma"),
	nl,
	read(B),
	(melos(B,W1)
	->
	nl,
	write("To ksana eipes to gramma auto"),checkWin(L,W,W1,I);
	(melos(B,L)
	-> element(L,X,B),
	X1 is X-1,
	replace(W,X1,B,K),
	write(K),
	insertAtEnd(B,W1,W2),
	checkWin(L,K,W2,I)
	; nl,write("Lathos gramma!!!"),nl,write(W),insertAtEnd(B,W1,W2),I2 is I + 1,checkWin(L,W,W2,I2))).
	
% --------------- Ελεγχος τερματισμου παιχνιδιου -----------
checkWin(L,W,W1,I):-
	(I<6
	->(L=W
	-> nl,write("Sygxaritiria Kerdises!!!!");
	foundLetter(L,W,B,K,W1,I));
	nl,write("Game Over!")).
	

% -------------- Εισαγωγη γραμματος σε λιστα ----------------	
insertAtEnd(X,[ ],[X]).

insertAtEnd(X,[H|T],[H|Z]) :-
	insertAtEnd(X,T,Z).
	
% ------------- Εκτελεση του κυριους προγραμματος -----------	
run:-
	write("Dwse mia leksi"),
	nl,
	read(A),
	atom_chars(A,L),
	length(L,N1),
	build("_",N1,K),
	build(_,0,W1),
	element(L,1,X),
	replace(K,0,X,W3),
	teleytaio(L,L1),
	element(L,X1,L1),
	X2 is X1 - 1,
	replace(W3,X2,L1,W),
	write(W),
	checkWin(L,W,W1,0).