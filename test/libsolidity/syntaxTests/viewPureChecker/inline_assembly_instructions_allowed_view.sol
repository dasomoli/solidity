contract C {
    function f() public view {
        assembly {
            stop()
            pop(add(0, 1))
            pop(sub(0, 1))
            pop(mul(0, 1))
            pop(div(0, 1))
            pop(sdiv(0, 1))
            pop(mod(0, 1))
            pop(smod(0, 1))
            pop(exp(0, 1))
            pop(not(0))
            pop(lt(0, 1))
            pop(gt(0, 1))
            pop(slt(0, 1))
            pop(sgt(0, 1))
            pop(eq(0, 1))
            pop(iszero(0))
            pop(and(0, 1))
            pop(or(0, 1))
            pop(xor(0, 1))
            pop(byte(0, 1))
            pop(shl(0, 1))
            pop(shr(0, 1))
            pop(sar(0, 1))
            pop(addmod(0, 1, 2))
            pop(mulmod(0, 1, 2))
            pop(signextend(0, 1))
            pop(keccak256(0, 1))
            pop(0)
            pop(mload(0))
            mstore(0, 1)
            mstore8(0, 1)
            pop(sload(0))
            //sstore(0, 1)
            pop(gas())
            pop(address())
            pop(balance(0))
            pop(selfbalance())
            pop(caller())
            pop(callvalue())
            pop(calldataload(0))
            pop(calldatasize())
            calldatacopy(0, 1, 2)
            pop(codesize())
            codecopy(0, 1, 2)
            pop(extcodesize(0))
            extcodecopy(0, 1, 2, 3)
            pop(returndatasize())
            returndatacopy(0, 1, 2)
            pop(extcodehash(0))
            //pop(create(0, 1, 2))
            //pop(create2(0, 1, 2, 3))
            //pop(call(0, 1, 2, 3, 4, 5, 6))
            //pop(callcode(0, 1, 2, 3, 4, 5, 6))
            //pop(delegatecall(0, 1, 2, 3, 4, 5))
            pop(staticcall(0, 1, 2, 3, 4, 5))
            return(0, 1)
            revert(0, 1)
            //selfdestruct(0)
            invalid()
            //log0(0, 1)
            //log1(0, 1, 2)
            //log2(0, 1, 2, 3)
            //log3(0, 1, 2, 3, 4)
            //log4(0, 1, 2, 3, 4, 5)
            pop(chainid())
            pop(basefee())
            pop(origin())
            pop(gasprice())
            pop(blockhash(0))
            pop(coinbase())
            pop(timestamp())
            pop(number())
            pop(difficulty())
            pop(prevrandao())
            pop(gaslimit())

            // NOTE: msize() is allowed only with optimizer disabled
            //pop(msize())
            //pop(pc())
        }
    }
}
// ====
// EVMVersion: >=paris
// ----
// Warning 3242: (2203-2213): "difficulty" was replaced by "prevrandao" in the VM version paris and does not behave as before. It now always returns 0.
// Warning 5740: (94-1733): Unreachable code.
// Warning 5740: (1746-1758): Unreachable code.
// Warning 5740: (1801-1810): Unreachable code.
// Warning 5740: (1978-2274): Unreachable code.
