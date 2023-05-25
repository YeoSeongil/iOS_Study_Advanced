//
//  Observable.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/21.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = (T) -> Void
    // 동작을 담아 놓는 클로저 Listener 타입 지정
    
    var listener: Listener?
    // 동작을 담아 놓는 listener 생성
    
    // value가 변경 되면 didSet에 의해 변경 된 value를 가지고 동작을 실행
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener // 동작을 listener에 저장한다.
        listener?(value) // complition에서 value값을 가지고 동작을 실행한다.
    }
}

