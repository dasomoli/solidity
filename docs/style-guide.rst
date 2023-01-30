.. index:: style, coding style

#############
스타일 가이드
#############

****
도입
****

이 가이드는 솔리디티 코드를 작성하기 위한 코딩 컨벤션을 제공하기 위해 만들어졌
습니다. 이 가이드는 시간이 지나면서 유용한 컨벤션이 발견되고 오래된 컨벤션이
구식으로 보여짐에 따라 계속해서 바뀌면서 나아지는 분서로 여겨야 합니다.

많은 프로젝트가 그들만의 고유한 스타일 가이드를 구현할 겁니다. 충돌 시에는
포로젝트에 따른 스타일 가이드가 우선합니다.

이 스타일 가이드 내의 구조와 많은 권고안들은 파이썬의
`pep8 스타일 가이드 <https://www.python.org/dev/peps/pep-0008/>`_ 로부터
가져 왔습니다.

이 가이드의 목적은 솔리디티 모드를 작성하는 옳은 방법이 *아닌* 최선의 방법이
되는 겁니다. 이 가이드의 목적은 *일관성* 입니다. 파이썬의
`pep8 <https://www.python.org/dev/peps/pep-0008/#a-foolish-consistency-is-the-hobgoblin-of-little-minds>`_
으로부터 인용한 내용이 이 개념을 잘 설명합니다.

.. note::

    스타일 가이드는 일관성에 관한 것입니다. 이 스타일 가이드 내의 일관성은 중요합니다. 한 프로젝트 내의 일관성은 더 중요합니다. 하나의 모듈이나 함수 내의 일관성은 가장 중요합니다.

    그러나 가장 중요한 것은 **일관적이지 않을 때를 아는 것** 입니다. -- 가끔 그 스타일 가이드는 그냥 적용하지 않습니다. 의심되면, 여러분 최선의 판단을 사용하세요. 다른 예제를 보고 가장 좋게 보이는 것을 결정하세요. 그리고 물음을 주저하지 마세요!


*************
코드 레이아웃
*************


띄어쓰기
========

띄어쓰기 레벨 당 스페이스 4개를 사용하세요.

탭 아니면 스페이스
==================

스페이스를 띄어쓰기 방법으로 더 선호합니다.

탭과 스페이스를 섞어 쓰는 것은 피해야 합니다.

빈 줄
=====

솔리디티 소스 내에서 탑 레벨 선언은 그 사이에 두 줄의 빈 줄을 둡니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    contract A {
        // ...
    }


    contract B {
        // ...
    }


    contract C {
        // ...
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    contract A {
        // ...
    }
    contract B {
        // ...
    }

    contract C {
        // ...
    }

컨트랙트 내의 함수 선언 사이에는 한 줄의 빈 줄을 둡니다.

(abstract 컨트랙트를 위한 stub 함수 같은) 연관된 한 줄 함수들의 그룹 사이에서는 빈 줄이 생략될 수 있습니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.6.0 <0.9.0;

    abstract contract A {
        function spam() public virtual pure;
        function ham() public virtual pure;
    }


    contract B is A {
        function spam() public pure override {
            // ...
        }

        function ham() public pure override {
            // ...
        }
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.6.0 <0.9.0;

    abstract contract A {
        function spam() virtual pure public;
        function ham() public virtual pure;
    }


    contract B is A {
        function spam() public pure override {
            // ...
        }
        function ham() public pure override {
            // ...
        }
    }

.. _maximum_line_length:

최대 라인 길이
==============

제안하는 최대 라인 길이는 120자입니다.

줄을 나눌 때는 다음 가이드 라인을 따라야 합니다.

1. 첫번째 인자는 여는 괄호에 붙이지 말아야 합니다.
2. 하나의, 딱 하나만의 indent를 써야 합니다.
3. 각 인자는 그 줄 상에서 떨어뜨려야 합니다.
4. 끝내는 항목 :code:`);` 은 그 자체의 마지막 줄에 두어야 합니다.

함수 호출

Yes:

.. code-block:: solidity

    thisFunctionCallIsReallyLong(
        longArgument1,
        longArgument2,
        longArgument3
    );

No:

.. code-block:: solidity

    thisFunctionCallIsReallyLong(longArgument1,
                                  longArgument2,
                                  longArgument3
    );

    thisFunctionCallIsReallyLong(longArgument1,
        longArgument2,
        longArgument3
    );

    thisFunctionCallIsReallyLong(
        longArgument1, longArgument2,
        longArgument3
    );

    thisFunctionCallIsReallyLong(
    longArgument1,
    longArgument2,
    longArgument3
    );

    thisFunctionCallIsReallyLong(
        longArgument1,
        longArgument2,
        longArgument3);

할당문

Yes:

.. code-block:: solidity

    thisIsALongNestedMapping[being][set][toSomeValue] = someFunction(
        argument1,
        argument2,
        argument3,
        argument4
    );

No:

.. code-block:: solidity

    thisIsALongNestedMapping[being][set][toSomeValue] = someFunction(argument1,
                                                                       argument2,
                                                                       argument3,
                                                                       argument4);

이벤트 정의와 이벤트 emitter들

Yes:

.. code-block:: solidity

    event LongAndLotsOfArgs(
        address sender,
        address recipient,
        uint256 publicKey,
        uint256 amount,
        bytes32[] options
    );

    LongAndLotsOfArgs(
        sender,
        recipient,
        publicKey,
        amount,
        options
    );

No:

.. code-block:: solidity

    event LongAndLotsOfArgs(address sender,
                            address recipient,
                            uint256 publicKey,
                            uint256 amount,
                            bytes32[] options);

    LongAndLotsOfArgs(sender,
                      recipient,
                      publicKey,
                      amount,
                      options);

소스 파일 인코딩
================

UTF-8 또는 ASCII 인코딩이 선호됩니다.

Import
======

Import 문은 항상 파일의 최상단에 두어야 합니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    import "./Owned.sol";

    contract A {
        // ...
    }


    contract B is Owned {
        // ...
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    contract A {
        // ...
    }


    import "./Owned.sol";


    contract B is Owned {
        // ...
    }

함수의 순서
===========

순서는 읽는 이에게 그들이 호출할 수 있는 함수, 그리고 생성자와 fallback 정의를 쉽게 식별하는데 도움을 줍니다.

함수들은 그들의 visibility에 따라 그룹 짓고 다음과 같이 순서를 정해야 합니다.

- constructor
- receive 함수 (존재한다면)
- fallback 함수 (존재한다면)
- external
- public
- internal
- private

하나의 그룹 내에서는 ``view`` 와 ``pure`` 함수를 가장 마지막에 두세요.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;
    contract A {
        constructor() {
            // ...
        }

        receive() external payable {
            // ...
        }

        fallback() external {
            // ...
        }

        // External functions
        // ...

        // External functions that are view
        // ...

        // External functions that are pure
        // ...

        // Public functions
        // ...

        // Internal functions
        // ...

        // Private functions
        // ...
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;
    contract A {

        // External functions
        // ...

        fallback() external {
            // ...
        }
        receive() external payable {
            // ...
        }

        // Private functions
        // ...

        // Public functions
        // ...

        constructor() {
            // ...
        }

        // Internal functions
        // ...
    }

표현식 내의 화이트 스페이스
===========================

다음과 같은 상황에서는 불필요한 화이트 스페이스를 사용하지 마세요.

한 줄 함수 선언을 제외하면, 괄호, 브라켓, 또는 브레이스 내부에 바로.

Yes:

.. code-block:: solidity

    spam(ham[1], Coin({name: "ham"}));

No:

.. code-block:: solidity

    spam( ham[ 1 ], Coin( { name: "ham" } ) );

예외:

.. code-block:: solidity

    function singleLine() public { spam(); }

콤마와 세미콜론 전에 바로.

Yes:

.. code-block:: solidity

    function spam(uint i, Coin coin) public;

No:

.. code-block:: solidity

    function spam(uint i , Coin coin) public ;

할당문 양 쪽, 또는 다른 것들과 정렬을 위해서 다른 연산자들 둘레에 하나 이상의 스페이스

Yes:

.. code-block:: solidity

    x = 1;
    y = 2;
    longVariable = 3;

No:

.. code-block:: solidity

    x            = 1;
    y            = 2;
    longVariable = 3;

receive와 fallback 함수 내에 화이트 스페이스를 넣지 마세요.

Yes:

.. code-block:: solidity

    receive() external payable {
        ...
    }

    fallback() external {
        ...
    }

No:

.. code-block:: solidity

    receive () external payable {
        ...
    }

    fallback () external {
        ...
    }


제어 구조체들
=============

컨트랙트, 라이브러리, 험수와 구조체의 바디를 표시하는 브레이스들은 다음과
같아야 합니다.

* 선언과 같은 줄에 엽니다.
* 선언의 시작과 같은 인덴테이션 레벨에서 그들의 줄에서 닫습니다.
* 여는 브레이스는 스페이스 하나를 앞에 두어야 합니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    contract Coin {
        struct Bank {
            address owner;
            uint balance;
        }
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    contract Coin
    {
        struct Bank {
            address owner;
            uint balance;
        }
    }

제어 구조체 ``if``, ``else``, ``while`` 와 ``for`` 에 같은 권고안이 적용됩니다.

추가로 제어 구조체 ``if``, ``while``,  ``for`` 와 조건를 나타내는 괄호 블록
사이에, 그 뿐만 아니라 조건 괄호 블록과 여는 브레이스 사이에는 스페이스
하나를 두어야 합니다.

Yes:

.. code-block:: solidity

    if (...) {
        ...
    }

    for (...) {
        ...
    }

No:

.. code-block:: solidity

    if (...)
    {
        ...
    }

    while(...){
    }

    for (...) {
        ...;}

바디가 한 줄인 제어 구조체에서는, 그 명령문이 한 줄만 *있다면* 브레이스를
생략하는 것도 괜찮습니다.

Yes:

.. code-block:: solidity

    if (x < 10)
        x += 1;

No:

.. code-block:: solidity

    if (x < 10)
        someArray.push(Coin({
            name: 'spam',
            value: 42
        }));

``else`` 나 ``else if`` 절을 갖는 ``if`` 블록에서는, ``else`` 를 ``if`` 의 닫는 브레이스와
같은 줄에 두어야 합니다. 비슷한 다른 블록 구조체들의 규칙과 비교하면 이는 분명 예외입니다.

Yes:

.. code-block:: solidity

    if (x < 3) {
        x += 1;
    } else if (x > 7) {
        x -= 1;
    } else {
        x = 5;
    }


    if (x < 3)
        x += 1;
    else
        x -= 1;

No:

.. code-block:: solidity

    if (x < 3) {
        x += 1;
    }
    else {
        x -= 1;
    }

함수 선언
=========

짧은 함수 선언에서는, 함수 바디의 여는 브레이스를 함수 선언과 같은 줄에 두는 것을
권장합니다.

닫는 브레이스는 함수 선언과 같은 인덴테이션 레벨에 두어야 합니다.

여는 브레이스는 스페이스 하나를 앞에 두어야 합니다.

Yes:

.. code-block:: solidity

    function increment(uint x) public pure returns (uint) {
        return x + 1;
    }

    function increment(uint x) public pure onlyOwner returns (uint) {
        return x + 1;
    }

No:

.. code-block:: solidity

    function increment(uint x) public pure returns (uint)
    {
        return x + 1;
    }

    function increment(uint x) public pure returns (uint){
        return x + 1;
    }

    function increment(uint x) public pure returns (uint) {
        return x + 1;
        }

    function increment(uint x) public pure returns (uint) {
        return x + 1;}

함수의 modifier 순서는 다음과 같아야 합니다.

1. Visibility
2. Mutability
3. Virtual
4. Override
5. Custom modifiers

Yes:

.. code-block:: solidity

    function balance(uint from) public view override returns (uint)  {
        return balanceOf[from];
    }

    function shutdown() public onlyOwner {
        selfdestruct(owner);
    }

No:

.. code-block:: solidity

    function balance(uint from) public override view returns (uint)  {
        return balanceOf[from];
    }

    function shutdown() onlyOwner public {
        selfdestruct(owner);
    }

긴 함수 선언에서는, 각 인자를 함수 바디와 같은 인덴테이션 레벨에 각 줄로 따로
떨어뜨리는 것을 권고합니다. 닫는 괄호와 여는 브레이스는 함수 선언과 같은
인덴테이션 레벨에서 줄을 따로 두어야 합니다.

Yes:

.. code-block:: solidity

    function thisFunctionHasLotsOfArguments(
        address a,
        address b,
        address c,
        address d,
        address e,
        address f
    )
        public
    {
        doSomething();
    }

No:

.. code-block:: solidity

    function thisFunctionHasLotsOfArguments(address a, address b, address c,
        address d, address e, address f) public {
        doSomething();
    }

    function thisFunctionHasLotsOfArguments(address a,
                                            address b,
                                            address c,
                                            address d,
                                            address e,
                                            address f) public {
        doSomething();
    }

    function thisFunctionHasLotsOfArguments(
        address a,
        address b,
        address c,
        address d,
        address e,
        address f) public {
        doSomething();
    }

긴 함수 선언이 modifier를 갖는다면, 각각의 modifier도 각 줄로 떨어뜨려야
합니다.

Yes:

.. code-block:: solidity

    function thisFunctionNameIsReallyLong(address x, address y, address z)
        public
        onlyOwner
        priced
        returns (address)
    {
        doSomething();
    }

    function thisFunctionNameIsReallyLong(
        address x,
        address y,
        address z
    )
        public
        onlyOwner
        priced
        returns (address)
    {
        doSomething();
    }

No:

.. code-block:: solidity

    function thisFunctionNameIsReallyLong(address x, address y, address z)
                                          public
                                          onlyOwner
                                          priced
                                          returns (address) {
        doSomething();
    }

    function thisFunctionNameIsReallyLong(address x, address y, address z)
        public onlyOwner priced returns (address)
    {
        doSomething();
    }

    function thisFunctionNameIsReallyLong(address x, address y, address z)
        public
        onlyOwner
        priced
        returns (address) {
        doSomething();
    }

여러줄의 output 파라미터와 return 문은 :ref:`Maximum Line Length <maximum_line_length>` 섹션에 있는 긴 라인을 나누는 권고안과 같은 스타일을 따라야 합니다.

Yes:

.. code-block:: solidity

    function thisFunctionNameIsReallyLong(
        address a,
        address b,
        address c
    )
        public
        returns (
            address someAddressName,
            uint256 LongArgument,
            uint256 Argument
        )
    {
        doSomething()

        return (
            veryLongReturnArg1,
            veryLongReturnArg2,
            veryLongReturnArg3
        );
    }

No:

.. code-block:: solidity

    function thisFunctionNameIsReallyLong(
        address a,
        address b,
        address c
    )
        public
        returns (address someAddressName,
                 uint256 LongArgument,
                 uint256 Argument)
    {
        doSomething()

        return (veryLongReturnArg1,
                veryLongReturnArg1,
                veryLongReturnArg1);
    }

베이스가 인자를 필요로 하는 상속받은 컨트랙트의 constructor 함수에서는,
함수의 선언이 읽기 너무 어렵다면 베이스 constructor들을 modifier와 같은 방식으로
새로운 줄로 따로 떨어뜨리는 것을 권장합니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;
    // Base contracts just to make this compile
    contract B {
        constructor(uint) {
        }
    }


    contract C {
        constructor(uint, uint) {
        }
    }


    contract D {
        constructor(uint) {
        }
    }


    contract A is B, C, D {
        uint x;

        constructor(uint param1, uint param2, uint param3, uint param4, uint param5)
            B(param1)
            C(param2, param3)
            D(param4)
        {
            // do something with param5
            x = param5;
        }
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    // Base contracts just to make this compile
    contract B {
        constructor(uint) {
        }
    }


    contract C {
        constructor(uint, uint) {
        }
    }


    contract D {
        constructor(uint) {
        }
    }


    contract A is B, C, D {
        uint x;

        constructor(uint param1, uint param2, uint param3, uint param4, uint param5)
        B(param1)
        C(param2, param3)
        D(param4) {
            x = param5;
        }
    }


    contract X is B, C, D {
        uint x;

        constructor(uint param1, uint param2, uint param3, uint param4, uint param5)
            B(param1)
            C(param2, param3)
            D(param4) {
                x = param5;
            }
    }


한 줄 명령문의 짧은 함수의 선언이면, 한 줄에 두는 것도 허용합니다.

허용 가능:

.. code-block:: solidity

    function shortFunction() public { doSomething(); }

함수 선언에 대한 이 가이드라인들은 가독성을 높이기 위함입니다. 작성자들은
함수 선언에서 이 가이드 라인이 커버하지 못하는 모든 가능한 조합에 대해 그들
자신의 최선의 판단을 사용해야 합니다.

매핑(Mappings)
==============

다양한 선언 내에서 그 타입과 ``mapping`` 키워드를 스페이스로 분리하지 마세요.
겹치는 ``mapping`` 키워드도 그 타입과 화이트 스페이스로 분리하지 마세요.

Yes:

.. code-block:: solidity

    mapping(uint => uint) map;
    mapping(address => bool) registeredAddresses;
    mapping(uint => mapping(bool => Data[])) public data;
    mapping(uint => mapping(uint => s)) data;

No:

.. code-block:: solidity

    mapping (uint => uint) map;
    mapping( address => bool ) registeredAddresses;
    mapping (uint => mapping (bool => Data[])) public data;
    mapping(uint => mapping (uint => s)) data;

변수 선언
=========

배열 변수의 선언은 그 타입과 브라켓 사이에 스페이스를 두지 않아야 합니다.

Yes:

.. code-block:: solidity

    uint[] x;

No:

.. code-block:: solidity

    uint [] x;


다른 권고안
===========

* 문자열은 싱글 쿼트 대신 더블 쿼트를 사용해야 합니다.

Yes:

.. code-block:: solidity

    str = "foo";
    str = "Hamlet says, 'To be or not to be...'";

No:

.. code-block:: solidity

    str = 'bar';
    str = '"Be yourself; everyone else is already taken." -Oscar Wilde';

* 연산자들은 양 쪽에 하나의 스페이스를 둡니다.

Yes:

.. code-block:: solidity
    :force:

    x = 3;
    x = 100 / 10;
    x += 3 + 4;
    x |= y && z;

No:

.. code-block:: solidity
    :force:

    x=3;
    x = 100/10;
    x += 3+4;
    x |= y&&z;

* 다른 것들보다 더 높은 우선순위의 연산자들은 우선 순위를 나타내기 위해서
  화이트 스페이스를 두지 않을 수 있습니다. 이는 복잡한 명령문의 가독성을
  향상하기 위해서 허용됨을 의미합니다. 여러분은 항상 연산자의 양 쪽에 같은
  개수의 화이트 스페이스를 사용해야 합니다.

Yes:

.. code-block:: solidity

    x = 2**3 + 5;
    x = 2*y + 3*z;
    x = (a+b) * (a-b);

No:

.. code-block:: solidity

    x = 2** 3 + 5;
    x = y+z;
    x +=1;

***************
레이아웃의 순서
***************

컨트랙트 항목들은 다음 순서로 둡니다.

1. Pragma 문
2. Import 문
3. 인터페이스
4. 라이브러리
5. 컨트랙트

각 컨트랙트, 라이브러리, 인터페이스 내부에서는 다음 순서를 사용하세요.

1. 타입 선언
2. State 변수
3. 이벤트
4. 에러
5. Modifier
6. 함수

.. note::

    타입은 사용되는 이벤트나 state 변수와 가까이 두는 것이 더 명확할 수 있습니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.8.4 <0.9.0;

    abstract contract Math {
        error DivideByZero();
        function divide(int256 numerator, int256 denominator) public virtual returns (uint256);
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.8.4 <0.9.0;

    abstract contract Math {
        function divide(int256 numerator, int256 denominator) public virtual returns (uint256);
        error DivideByZero();
    }


*************
네이밍 컨벤션
*************

네이밍 컨벤션들은 널리 받아들여지고 사용될 때 강력합니다. 다른 컨벤션의 사용은
그가 아니면 바로 전달할 수 없을 중요한 *메타* 정보를 전달할 수 있습니다.

여기의 네이밍 권고안은 가독성을 높이기 위해서 만들어졌기 때문에 룰은 아니고,
그 이름을 통해 중요한 정보를 전달하고자 도움을 주기 위한 가이드라인에 가깝습니다.

마지막으로, 항상 코드베이스 내의 일관성을 이 문서 내의 모든 컨벤션보다
우선해야 합니다.


네이밍 스타일
=============

혼란을 피하기 위해서, 다른 네이밍 스타일을 참조하는데 다음 이름을 사용할 겁니다.

* ``b`` (소문자 하나)
* ``B`` (대문자 하나)
* ``lowercase`` (소문자)
* ``UPPERCASE`` (대문자)
* ``UPPER_CASE_WITH_UNDERSCORES`` (_를 사용하는 대문자)
* ``CapitalizedWords`` (캐피털라이즈드 워드-단어 단위로 앞글자를 대문자화- 또는 캡워드CapWords)
* ``mixedCase`` (믹스드케이스: 캐피털라이즈된 단어들에 비해 첫문자가 소문자!)

.. note:: 캡워드 내에서 약자를 쓴다면, 모든 약자를 캐피털라이즈하세요. 그래서 HTTPServerError 가 HttpServerError 보다 낫습니다. 대소문자를 섞어쓸 때 약자를 쓴다면, 그 이름의 첫 소문자를 유지하는 것을 제외하고는 모든 약자를 캐피털라이즈하세요. 그래서 xmlHTTPRequest 가 XMLHTTPRequest 보다 낫습니다.


피해야 하는 이름
================

* ``l`` - 소문자 엘
* ``O`` - 대문자 오
* ``I`` - 대문자 아이

한글자 변수 이름에 이들 중 어떤 것도 사용하지 마세요. 그들은 종종 숫자 일과 영과
구분이 되지 않습니다.


컨트랙트와 라이브러리 이름
==========================

* 컨트랙트와 라이브러리 이름은 캡워드 스타일을 사용해야 합니다. 예제: ``SimpleToken``, ``SmartBank``, ``CertificateHashRepository``, ``Player``, ``Congress``, ``Owned``.
* 컨트랙트와 라이브러리 이름은 또한 그들의 파일 이름과 매치되아야 합니다.
* 컨트랙트 파일이 여러 컨트랙트와 라이브러리를 갖는다면, 그 파일 이름은 *코어 컨트랙트*와 매치되어야 합니다. 그러나 여럿을 갖는 것은 피할 수 있다면 추천하지 않습니다.

아래 예제에서 보이는대로 컨트랙트 이름이 ``Congress`` 이고 라이브러리 이름이 ``Owned`` 라면, 그와 연관된 파일 이름들은 ``Congress.sol`` 와 ``Owned.sol`` 여야 합니다.

Yes:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    // Owned.sol
    contract Owned {
        address public owner;

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        constructor() {
            owner = msg.sender;
        }

        function transferOwnership(address newOwner) public onlyOwner {
            owner = newOwner;
        }
    }

그리고 ``Congress.sol`` 에서는 다음과 같습니다.

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.0 <0.9.0;

    import "./Owned.sol";


    contract Congress is Owned, TokenRecipient {
        //...
    }

No:

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    // owned.sol
    contract owned {
        address public owner;

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        constructor() {
            owner = msg.sender;
        }

        function transferOwnership(address newOwner) public onlyOwner {
            owner = newOwner;
        }
    }

그리고 ``Congress.sol`` 에서는 다음과 같습니다.

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity ^0.7.0;


    import "./owned.sol";


    contract Congress is owned, tokenRecipient {
        //...
    }

Struct 이름
===========

Struct 이름은 캡워드 스타일을 사용해야 합니다. 예제: ``MyCoin``, ``Position``, ``PositionXY``.


Event 이름
==========

Event 이름은 캡워드 스타일을 사용해야 합니다. 예제: ``Deposit``, ``Transfer``, ``Approval``, ``BeforeTransfer``, ``AfterTransfer``.


함수 이름
=========

함수 이름은 믹스드케이스를 사용해야 합니다. 예제: ``getBalance``, ``transfer``, ``verifyOwner``, ``addMember``, ``changeOwner``.


함수 인자 이름
==============

함수 인자 이름은 믹스드케이스를 사용해야 합니다. 예제: ``initialSupply``, ``account``, ``recipientAddress``, ``senderAddress``, ``newOwner``.

커스텀 struct 상에서 동작하는 라이브러리 함수를 작성한다면, 그 struct가 첫번째
인자여야 하며 그 이름은 언제나 ``self`` 여야 합니다.


로컬 그리고 State 변수 이름
===========================

믹스드 케이스를 사용하세요. 예제: ``totalSupply``, ``remainingSupply``, ``balancesOf``, ``creatorAddress``, ``isPreSale``, ``tokenExchangeRate``.


상수
====

상수는 모두 대문자를 쓰고 언더스코어('_')로 단어를 분리하여야 합니다.
예제: ``MAX_BLOCKS``, ``TOKEN_NAME``, ``TOKEN_TICKER``, ``CONTRACT_VERSION``.


Modifier 이름
=============

믹스드 케이스를 사용하세요. 예제: ``onlyBy``, ``onlyAfter``, ``onlyDuringThePreSale``.


Enum
====

간단한 타입 선언 스타일 내에서 enum 이름은 캡워드 스타일을 사용해야 합니다. 예제: ``TokenGroup``, ``Frame``, ``HashStyle``, ``CharacterLocation``.


네이밍 충돌 피하기
==================

* ``singleTrailingUnderscore_`` (언더스코어를 끝에 하나 붙이기)

이 컨벤션은 원하는 이름이 이미 존재하는 state 변수, 함수, 빌트인 또는 예약어와
겹칠 때 제안합니다.

.. _style_guide_natspec:

*******
NatSpec
*******

솔리디티 컨트랙트는 또한 NatSpec 주석을 갖을 수 있습니다. 슬래시 셋 (``///``) 또는
애스터리스크 둘 (``/** ... */``) 의 블록으로 작성되고, 함수 선언이나 명령문 위에
바로 사용해야 합니다.

예를 들면, `간단한 스마트 컨트랙트 <simple-smart-contract>` 컨트랙트에 주석을 붙이면 다음처럼 됩니다.

.. code-block:: solidity

    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.4.16 <0.9.0;

    /// @author The Solidity Team
    /// @title A simple storage example
    contract SimpleStorage {
        uint storedData;

        /// Store `x`.
        /// @param x the new value to store
        /// @dev stores the number in the state variable `storedData`
        function set(uint x) public {
            storedData = x;
        }

        /// Return the stored value.
        /// @dev retrieves the value of the state variable `storedData`
        /// @return the stored value
        function get() public view returns (uint) {
            return storedData;
        }
    }

솔리디티 컨트랙트는 모든 public 인터페이스(ABI 내의 모든 것)에 :ref:`NatSpec <natspec>` 를 사용해서 모두 어노테이션하기를 권합니다.

자세한 설명은 :ref:`NatSpec <natspec>` 에 관한 섹션을 보세요.