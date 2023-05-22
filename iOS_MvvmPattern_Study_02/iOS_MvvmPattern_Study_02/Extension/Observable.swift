//
//  Observable.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/21.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
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
git filter-branch --force --index-filter "git rm --cached
--ignore-unmatch ./iOS_MvvmPattern_Study_02/iOS_MvvmPattern_Study_02/Network/APIKey.swift" --prune-empty --tag-name-filter cat -- --all 

