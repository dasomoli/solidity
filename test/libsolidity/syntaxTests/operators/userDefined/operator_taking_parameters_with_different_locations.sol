struct S { uint128 x; }

using {add as +} for S;

function add(S memory, S storage) returns (S memory) {}
// ----
// TypeError 1884: (32-35): The function "add" needs to have two parameters of type S and the same data location to be used for the operator +.
