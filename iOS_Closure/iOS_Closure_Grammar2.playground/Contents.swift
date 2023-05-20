import UIKit

// 클로저의 구문읜 생각보다 길고, 난해한 형태라 헷갈림.
// ✅ 이를 보완한 클로저를 간단하게 사용할 수 있는 경량 문법이 존재함.

// 1. 후행 클로저 ( Trailing Closure )
// 함수의 마지막 인자가 클로저일 때, 이를 인자 값 형식이 아닌 함수 뒤에 붙여 작성하는 문법. ✅ 이때, Argument Label은 생략된다.

// 1-1. 인자가 클로저 하나인 함수
func something(closure: () -> ()) {
    closure()
}

something(closure: { () -> () in
    print("기존 호출 방법이다. 헷갈려 !!")
}) // print: 기존 호출 방법이다. 헷갈려 !!
// ✅ 이렇게 클로저가 인자의 값 형식으로 함수 호출 구문 () 안에 작성되어 있는 것을 Inline closure라고 부른다.

something () { () -> () in
    print("후행 클로저 문법을 이용한 호출이다.")
} // print: 후행 클로저 문법을 이용한 호출이다.

something { () -> () in
    print("호출구문인 ()도 생략할 수 있다.")
} // print: 호출구문인 ()도 생략할 수 있다.

// 1-2. 인자가 여러 개인 함수
func fetchData(success: () -> (), fail: () -> ()) {
    // something ~
}

fetchData(success: { () -> () in
    print("성공 입니다.")
}, fail: { () -> () in
    print("실패 입니다.")
})

fetchData(success: { () -> () in
    print("후행 클로저, 성공 입니다.")
}) { () -> () in
    print("후행 클로저, 실패 입니다.")
}
// ✅ 인자가 여러 개일 경우, 함수 호출 구문 ()를 마음대로 생략해선 안된다.

// 2. 클로저의 경량 문법

func something2(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

something2(closure: { (a: Int, b: Int, c: Int) -> Int in
    return a + b + c
}) // 경량 문법을 사용하지 않은 호출 방법

// 2-1. 인자 형식과 리턴 형식을 생략할 수 있다.
something2(closure: { (a, b, c) in
    return a + b + c
})

// 2-2. Shortand Argument Names ($)와 in의 생략
// ✅ Shortand Argument Names ($) : $와 index를 이용해 인자에 순서대로 접근 하는 것
// ✅ $를 사용할 경우 in은 생략한다.
// a -> $0, b -> $1, c -> $2
something2(closure: {
    return $0 + $1 + $2
})

// 2-3. 단일 리턴문만 남을 경우, return도 생략한다.
something2(closure: {
    $0 + $1 + $2
})

//something2(closure: {
//    print("단일 리턴문이 아닙니다.")
//    $0 + $1 + $2
//}) ❗️err

// 2-4. 클로저의 인자가 마지막 인자이면, 후행 클로저로 작성한다.
something2() {
    $0 + $1 + $2
}

// 2-5. ()에 값이 아무 것도 없다면 생략한다.
something2 {
    $0 + $1 + $2
}

// ❗️ 클로저를 너무 과하게 축약해서 사용 할 경우, 후에 유지보수가 어렵다. > 이게 뭘 의미하는지 ? 하나하나 다 찾아봐야하기 때문.

// 3. @autoclosure
// 인자로 전달된 일반 구문 & 함수를 클로저로 래핑 하는 것.
func something3(closure: @autoclosure () -> ()) {
    closure()
}
something3(closure: print("오토 클로저"))
// print("오토 클로저")는 클로저가 아닌 일반 구문이지만
// autoclosure로 래핑 했기 때문에 일반 구문을 클로저 처럼 사용할 수 있다.
// ❗️ autoclosure를 사용할 경우, 인자가 반드시 없어야한다.

// 4. @escaping
// 함수 실행을 벗어나서 함수가 끝난 후에도 클로저를 실행하거나,
// 중첩함수에서 실행 후 중첩함수를 리턴하고 싶거나, 변수/상수에 대입하고 싶은 경우에 사용한다.
func something4(closure: @escaping () -> ()) {
    let f: () -> () = closure
}

func something5(closure: @escaping () -> ()) {
    print("func start")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
        closure()
    }
    print("func end")
}
something5 {
    print("closure")
}
// print:
// func start
// func end
// closure


