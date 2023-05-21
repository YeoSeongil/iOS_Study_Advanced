//
//  Observable.swift
//  iOS_MvvmPattern_Study_01
//
//  Created by 여성일 on 2023/05/21.
//

import Foundation

final class Observable<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    // var listener = (T) -> Void
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
