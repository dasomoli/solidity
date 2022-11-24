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

        // operator accepts only memory
        m + c;
        m + s;
        c + m;
        s + m;

        // operator accepts only calldata
        c - m;
        c - s;
        m - c;
        s - c;

        // operator accepts only storage
        s * c;
        s * m;
        c * s;
        m * s;
    }
}
// ----
// TypeError 5653: (408-413): User-defined binary operator + not compatible with types struct S memory and struct S calldata.
// TypeError 5653: (423-428): User-defined binary operator + not compatible with types struct S memory and struct S storage ref.
// TypeError 2271: (438-443): Built-in binary operator + cannot be applied to types struct S calldata and struct S memory. No matching user-defined operator found.
// TypeError 2271: (453-458): Built-in binary operator + cannot be applied to types struct S storage ref and struct S memory. No matching user-defined operator found.
// TypeError 5653: (511-516): User-defined binary operator - not compatible with types struct S calldata and struct S memory.
// TypeError 5653: (526-531): User-defined binary operator - not compatible with types struct S calldata and struct S storage ref.
// TypeError 2271: (541-546): Built-in binary operator - cannot be applied to types struct S memory and struct S calldata. No matching user-defined operator found.
// TypeError 2271: (556-561): Built-in binary operator - cannot be applied to types struct S storage ref and struct S calldata. No matching user-defined operator found.
// TypeError 5653: (613-618): User-defined binary operator * not compatible with types struct S storage ref and struct S calldata.
// TypeError 5653: (628-633): User-defined binary operator * not compatible with types struct S storage ref and struct S memory.
// TypeError 2271: (643-648): Built-in binary operator * cannot be applied to types struct S calldata and struct S storage ref. No matching user-defined operator found.
// TypeError 2271: (658-663): Built-in binary operator * cannot be applied to types struct S memory and struct S storage ref. No matching user-defined operator found.
