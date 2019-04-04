%_Merve_Demirtaş
%_2015280008


female(pam).
female(ann).
female(liz).
female(pat).
female(merve).
male(tom).
male(bob).
male(jim).
male(ali).
male(veli).

parent(pam,bob).
parent(tom,bob).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(tom,liz).
parent(ann,merve).
parent(liz,ali).
parent(ali,veli).



child( X , Y ) :- parent( Y , X ).
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
grandparent(X, Z):- parent(X, Y),parent(Y, Z).
bro_sis(X,Y):-mother(M1,X),mother(M2,Y),
			  father(F1,X),father(F2,Y),
					((M1=M2),not(F1=F2);
					 (F1=F2),not(M1=M2);
					 (M1=M2),(F1=F2)),X\=Y.

%hastwochildren

hastwochildren(X):-parent(X,Y),parent(X,Z),dif(Y,Z).


%Grandchildren

grandchildren(X, Z):-child(X,P),parent(Z,P);child(Z,P),parent(X,P).

%sibling
sibling( X , Y ):- parent( Z , X ) , parent( Z , Y ).

%firstcousin
firstcousin(X,Y):-parent(P,X),sibling(P,Q),parent(Q,Y).


%distantcousin
distantcousin(X,Y):-(firstcousin(X,Y);parent(M,X),parent(N,Y),distantcousin(M,N)),
						X\=Y,not(bro_sis(X,Y)).


