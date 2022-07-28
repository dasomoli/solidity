struct S {
    uint8 a;
}

using {
    add as +,
    sub as -,
    mul as *
} for S;

function add(S memory, S memory) pure returns (S memory) {}
function sub(S calldata, S calldata) pure returns (S calldata) {}
function mul(S storage, S storage) pure returns (S storage) {}

contract C {
    S s;
    function test(S calldata c) public {
        S memory m;

        c + c; // operator accepts memory, arguments are calldata
        s + s; // operator accepts memory, arguments are storage

        m - m; // operator accepts calldata, arguments are memory
        s - s; // operator accepts calldata, arguments are storage

        c * c; // operator accepts storage, arguments are calldata
        m * m; // operator accepts storage, arguments are memory
    }
}
// ----
// TypeError 2271: (368-373): Built-in binary operator + cannot be applied to types struct S calldata and struct S calldata. No matching user-defined operator found.
// TypeError 2271: (434-439): Built-in binary operator + cannot be applied to types struct S storage ref and struct S storage ref. No matching user-defined operator found.
// TypeError 2271: (500-505): Built-in binary operator - cannot be applied to types struct S memory and struct S memory. No matching user-defined operator found.
// TypeError 2271: (566-571): Built-in binary operator - cannot be applied to types struct S storage ref and struct S storage ref. No matching user-defined operator found.
// TypeError 2271: (634-639): Built-in binary operator * cannot be applied to types struct S calldata and struct S calldata. No matching user-defined operator found.
// TypeError 2271: (701-706): Built-in binary operator * cannot be applied to types struct S memory and struct S memory. No matching user-defined operator found.
