//
//  Observable.swift
//  iOS_MvvmPattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bine(_ closure: @escaping (T) -> Void) {
        closure(value)
        self.listener = closure
    }
}
