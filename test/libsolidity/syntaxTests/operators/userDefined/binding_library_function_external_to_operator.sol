type Int is int128;

library L {
    function externalOperator(Int, Int) external returns (Int) {}
}

using {L.externalOperator as +} for Int;
// ----
// DeclarationError 7920: (109-127): Identifier not found or not unique.
