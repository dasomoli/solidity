using {add as +, unsub as -} for S;

struct S {
    uint x;
}

function add(S memory, S memory) returns (S memory) {}
function unsub(S memory) returns (S memory) {}

contract C {
    S s;

    function test() public {
        S storage sTmp;
        S memory tmp;
        s + s;
        tmp + true;
        true + s;
        -sTmp;
        -s;
        -true;
    }
}

// ----
// TypeError 2271: (272-277): Built-in binary operator + cannot be applied to types struct S storage ref and struct S storage ref. No matching user-defined operator found.
// TypeError 5653: (287-297): User-defined binary operator + only accepts type struct S memory and is not compatible with types struct S memory and bool.
// TypeError 2271: (307-315): Built-in binary operator + cannot be applied to types bool and struct S storage ref.
// TypeError 4907: (325-330): Built-in unary operator - cannot be applied to type struct S storage pointer. No matching user-defined operator found.
// TypeError 4907: (340-342): Built-in unary operator - cannot be applied to type struct S storage ref. No matching user-defined operator found.
// TypeError 4907: (352-357): Built-in unary operator - cannot be applied to type bool.
