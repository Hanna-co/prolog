
% Problem 1: at_position/3
at_position(1, [H|_], H).
at_position(N, [_|T], X) :-  
    N > 1, 
    N1 is N - 1, 
    at_position(N1, T, X).

% Problem 2: square_positives/2
square_positives([], []).
square_positives([H|T], [H2|R]) :-  
    H > 0, 
    H2 is H * H, 
    square_positives(T, R).
square_positives([H|T], R) :-  
    H =< 0, 
    square_positives(T, R).

% Problem 3: pair_reverse/2
pair_reverse([A,B|T], [B,A|R]) :-  
    pair_reverse(T, R).
pair_reverse([X], [X]).
pair_reverse([], []) :- fail.
pair_reverse([_], _) :- fail.

% Problem 4: check_it/3
check_it(X, Y, A) :- X < Y, A is Y - X.
check_it(X, Y, A) :- X =:= Y, A = Y.
check_it(X, Y, A) :- X > Y, A is X - Y.

% Problem 5: cadr/2
cadr([_, X | _], X).

% Problem 6: remove_them/3
remove_them([], _, []).
remove_them([H|T], L2, R) :- member(H, L2), remove_them(T, L2, R).
remove_them([H|T], L2, [H|R]) :- not_in_list(H, L2), remove_them(T, L2, R).
not_in_list(_, []).
not_in_list(X, [H|T]) :- X \= H, not_in_list(X, T).

% Problem 7: distance/3
distance([X1|Y1], [X2|Y2], D) :- DX is X2 - X1, DY is Y2 - Y1, D2 is DX * DX + DY * DY, D is sqrt(D2).

% Problem 8: clean_list/2
clean_list([], []).
clean_list([H|T], [H|R]) :- number(H), clean_list(T, R).
clean_list([H|T], R) :- \+ number(H), clean_list(T, R).

% Problem 9: squares/2
squares([], []).
squares([H|T], [S|R]) :- number(H), S is H * H, squares(T, R).
squares([H|T], R) :- \+ number(H), squares(T, R).

% Problem 10: sum_squares/2
sum_squares(L, Sum) :- sum_squares(L, 0, Sum).
sum_squares([], Acc, Acc).
sum_squares([H|T], Acc, Sum) :- number(H), S is H * H + Acc, sum_squares(T, S, Sum).
sum_squares([H|T], Acc, Sum) :- \+ number(H), sum_squares(T, Acc, Sum).

% Problem 11: get_values/2
get_values([], []).
get_values([H|T], [S|R]) :- is_list(H), sum_list(H, S), get_values(T, R).
get_values([H|T], [H|R]) :- \+ is_list(H), get_values(T, R).

% Problem 12: fbscore/5
fbscore(TD, FG, S, EP, Total) :- EP =< TD, P1 is TD * 6, P2 is FG * 3, P3 is S * 2, P4 is EP, Total is P1 + P2 + P3 + P4.

% Problem 13: nomatch/3
nomatch([], _, []).
nomatch([H1|T1], [H2|T2], [H1|R]) :- H1 \= H2, nomatch(T1, T2, R).
nomatch([H1|T1], [H1|T2], R) :- nomatch(T1, T2, R).
nomatch(L1, [], L1).

% Problem 14: flattenit/2
flattenit([], []).
flattenit([H|T], Flat) :- is_list(H), flattenit(H, FH), flattenit(T, FT), append(FH, FT, Flat).
flattenit([H|T], [H|FT]) :- \+ is_list(H), flattenit(T, FT).
not_list(X) :- X = X, \+ is_list(X).
