//
//  ViewModel.swift
//  iOS_MvvmPattern_Study_01
//
//  Created by 여성일 on 2023/05/21.
//

import UIKit

class ViewModel {
    
    let babyData: [Baby] = [
        Baby(face: UIImage(named: "baby1")!, name: "안재율"),
        Baby(face: UIImage(named: "baby2")!, name: "안나율")
    ]
    
    let babyImage: Observable<UIImage?> = Observable(nil)
    let babyName: Observable<String?> = Observable(nil)
    
    private var index: Int = 0
    
    init() {
        self.babyImage.value = babyData[index].face
        self.babyName.value = babyData[index].name
    }
    
    func nextButtonTapped() {
        print("ViewModel 호출")
        
        index = (index+1 < babyData.count) ? index+1 : 0
        
        self.babyImage.value = babyData[index].face
        self.babyName.value = babyData[index].name
    }
}
