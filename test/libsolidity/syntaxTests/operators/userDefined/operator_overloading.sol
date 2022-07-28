type Int is uint128;

using {add as +, add128 as +} for Int;

function add(Int, Int) returns (Int) {}
function add128(Int, int128) returns (Int) {}

function test() {
    Int.wrap(0) + Int.wrap(1);
}
// ----
// TypeError 1884: (39-45): The function "add128" needs to have two parameters of type Int and the same data location to be used for the operator +.
// TypeError 2271: (171-196): Built-in binary operator + cannot be applied to types Int and Int. Multiple user-defined functions provided for this operator.
