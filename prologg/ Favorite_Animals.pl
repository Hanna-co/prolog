%1
color(red).
color(green).
color(blue).

states(Texas, Oklahoma, Louisiana, Mississippi, Arkansas) :-
    color(Texas), color(Oklahoma), color(Louisiana),
    color(Mississippi), color(Arkansas),
    Texas \= Oklahoma,
    Texas \= Louisiana,
    Texas \= Arkansas,
    Oklahoma \= Arkansas,
    Oklahoma \= Louisiana,
    Louisiana \= Mississippi,
    Arkansas \= Mississippi.
%2
manhattan([X1|Y1], [X2|Y2], Distance) :-
    DX is abs(X1 - X2),
    DY is abs(Y1 - Y2),
    Distance is DX + DY.

%3
split_after([], _ [], []).
split_after([H|T], 1, [H], T) :- !.
split_after([H|T], N, [H|L1], L2) :-
N> 1,
N1 is N- 1, split_after(T, N1, L1, L2).
%4



%5
flatten_list([], []).
flatten_list([H|T], Flat) :-
    is_list(H),
    flatten_list(H, FH),
    flatten_list(T, FT),
    append(FH, FT, Flat).
flatten_list([H|T], [H|FT]) :-
    \+ is_list(H),
    flatten_list(T, FT).

remove_dups([], []).
remove_dups([H|T], R) :-
    member(H, T),
    remove_dups(T, R).
remove_dups([H|T], [H|R]) :-
    \+ member(H, T),
    remove_dups(T, R).

squish(Input, Output) :-
    flatten_list(Input, Flat),
    \+ (member(E, Flat), is_list(E)),
    remove_dups(Flat, Output).


