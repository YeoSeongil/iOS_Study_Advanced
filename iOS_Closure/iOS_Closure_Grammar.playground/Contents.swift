import UIKit

// Closure = Named Closure & Unnamed Closure
// 이름 있는 함수는 func ~ 로 시작하는 함수를 뜻함.
// 근데, 이를 클로저라 부르지 않고 그냥 함수라고 부르는 것 뿐임. but, 클로저란 사실은 변함 없다.
// 우리가 보편적으로 Closure라고 하면 이름 없는 함수를 말함.

// 1. 클로저 표현식
// { (인자) -> 리턴 타입 in
//        실행 구문
// }
// 클로저 헤드 : (인자) -> 리턴타입
// 클로저 바디 : 실행 구문
// in : 클로저 바디와 클로저 헤드를 구분지어주는 키워드

// 2. 인자와 리턴 타입이 둘 다 없는 클로저
let closure1 = { () -> () in
    print("클로저 입니다.")
}
// ✅ 클로저는 1급 객체이기 때문에, 상수에 클로저를 대입할 수 있다.
closure1() // print: 클로저 입니다.

// 3. 인자만 있는 클로저
let closure2 = { (name: String) -> () in
    print("안녕 내 이름은 \(name)이라고 해. 반가워!")
}
closure2("성일") // print: 안녕 내 이름은 성일이라고 해. 반가워!
// ✅ 클로저는 Argument Label을 사용하지 않음.
// ✅ closure2(name: "성일") > err

// 4. 인자와 리턴 타입이 둘 다 있는 클로저
let closure3 = { (num: Int) -> Int in
    return num
}
print(closure3(4)) // print: 4

// 5. 1급 객체로서의 클로저
// 5-1. 클로저를 변수나 상수에 대입할 수 있다.
let closure4 = { () -> () in
    print("1급 객체 입니다.")
}

let closure5 = closure4
// ✅ 새로운 변수나 상수에 대입할 수 있다.

// 5-2. 함수의 인자 타입으로 클로저를 전달할 수 있다.
func something(closure: () -> ()) {
    closure()
}

something(closure: { () -> () in
    print("인자 타입의 클로저 입니다.")
}) // print: 인자 타입의 클로저 입니다.

// 5-3. 함수의 반환 타입으로 클로저를 사용할 수 있다.
func something2() -> () -> () {
    return  { () -> () in
        print("클로저를 리턴합니다.")
    }
}
let closure6 = something2()
closure6() // print: 클로저를 리턴합니다.

// 6. 클로저 실행하기
// 6-1. 클로저가 대입된 변수나 상수로 호출하기
let closure7 = { () -> String in
    return "안녕하세요. 클로저 입니다."
}
closure7()
// ✅ 클로저가 대입 된 상수 클로저를 호출 구문인 ()를 이용해서 실행할 수 있다.

// 6-2. 클로저를 직접 실행하기.
({ () -> () in
    print("직접 실행합니다.")
})() // print: 직접 실행 합니다.
// ✅ 클로저를 변수나 상수에 대입하지 않고 실행시키고 싶다면, 클로저를 소괄호로 감싸고, 마지막에 호출 구문인 ()를 추가해주면 된다. -> 완벽한 일회성

let closure8 = { () -> () in
    print("이렇게 실행 시켜도 됩니다.")
}() // print: 이렇게 실행 시켜도 됩니다.



