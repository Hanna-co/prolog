%  Makeup product facts
%Structure [product(ProductName, ProductType, Brand).]

product(lip_gloss, lip, fenty_beauty).
product(blush, face, rare_beauty).
product(mascara, eye, maybelline).
product(highlighter, face, charlotte_tilbury).
product(eyeliner, eye, nyx).

%  Rules
is_eye_product(Product) :-
    product(Product, eye, _).

from_brand(Product, Brand) :-
    product(Product, _, Brand).
