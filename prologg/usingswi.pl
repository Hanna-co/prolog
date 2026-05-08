city(denver).
city(sandiego).
has_beach(sandiego).
vacation(X) :- city(X), has_beach(X).

language(c).
language(cpp).
language(scheme).
language(prolog).
