type Int is int256;

using {
    add as +,
    sub as -,
    div as /
} for Int;

function add(Int) pure returns (Int) {}
function sub(Int, Int, Int) pure returns (Int) {}
function div(int256, int256) pure returns (Int) {}

function f() pure {
    Int.wrap(0) + Int.wrap(1);
    Int.wrap(0) - Int.wrap(0);
    Int.wrap(0) / Int.wrap(0);
}

// ----
// TypeError 1884: (33-36): The function "add" needs to have two parameters of type Int and the same data location to be used for the operator +.
// TypeError 7617: (47-50): The function "sub" needs to have one or two parameters of type Int and the same data location to be used for the operator -.
// TypeError 7617: (61-64): The function "div" needs to have one or two parameters of type Int and the same data location to be used for the operator /.
// TypeError 3605: (61-64): The function "div" needs to have parameters and return value of the same type to be used for the operator /.
// TypeError 2271: (248-273): Built-in binary operator + cannot be applied to types Int and Int. No matching user-defined operator found.
// TypeError 2271: (279-304): Built-in binary operator - cannot be applied to types Int and Int. No matching user-defined operator found.
// TypeError 2271: (310-335): Built-in binary operator / cannot be applied to types Int and Int. No matching user-defined operator found.
