import UIKit

// 1. 클로저 값 캡처
func something() {
    var hello: String = "안녕하세요."
    
    // 클로저 범위 시작
    var num: Int = 10
    let closure = { print(num) }
    // 클로저 범위 끝
    
    print(hello)
}
// something() 함수 내부의 closure는 클로저 내부에서 외부 변수인 num이라는 변수를 사용하기 때문에 num의 값을 클로저 내부적으로 저장하고 있다. 이것을 클로저에 의해 num의 값이 캡쳐 되었다고 한다. hello라는 변수는 클로저 내부에서 사용하지 않기 때문에 클로저에 의해 값이 캡쳐되지 않는다.
something()

// 1-1. 클로저의 값 캡쳐 방식
// ✅ 클로저는 값의 타입이 Value건, Reference건 모두 Reference Capture한다.
func something2() {
    var num: Int = 0
    print("num check #1 = \(num)")
    
    let closure = {
        print("num check #3 = \(num)")
    }
    
    num = 20
    print("num check #2 = \(num)")
    closure()
}
something2()
// print:
// num check #1 = 0
// num check #2 = 20
// num check #3 = 20
// ✅ 클로저는 num이라는 외부 변수를 클로저 내부에서 사용하기 때문에 num을 캡쳐할 것이다. 이때, num이라는 변수를 참조하여 캡처한다. 따라서 closure를 실행하기 전에 num이라는 값을 외부에서 변경하면 클로저 내부에서 사용하는 num의 값 또한 변경된다.

func something3() {
    var num: Int = 0
    print("num check #1 = \(num)")
    
    let closure = {
        num = 20
        print("num check #3 = \(num)")
    }
    closure()
    print("num check #2 = \(num)")
}
something3()
// print:
// num check #1 = 0
// num check #3 = 20
// num check #2 = 20
// ✅ 클로저는 num이라는 외부 변수를 클로저 내부에서 사용하기 때문에 num을 캡쳐할 것이다. 이때, num이라는 변수를 참조하여 캡처한다. 클로저 내부에서 num의 값을 바꾸면 클로저 외부에 있는 num의 값도 변경된다.

// 2. 클로저의 캡처 리스트
// 클로저의 시작인 { 의 바로 옆에 []를 이용해 캡쳐할 멤버를 나열한다. ❗️ 이때 in 키워드도 꼭 함께 작성한다.
func something4() {
    var num: Int = 0
    print("num check #1 = \(num)")
    
    let closure = { [num] in
        //num = 1 > err 발생
        print("num check #3 = \(num)")

    }
    
    num = 20
    print("num check #2 = \(num)")
    closure()
}
something4()
// closure를 실행하기 전에 외부 변수 num의 값을 20으로 변경했지만, 클로저의 num에는 영향을 주지 않는다. Value Type으로 캡쳐되었기 때문. ❗️ Value Type으로 캡처한 경우, 클로저를 선언할 당시 num의 값을 상수 타입으로 캡처함.

