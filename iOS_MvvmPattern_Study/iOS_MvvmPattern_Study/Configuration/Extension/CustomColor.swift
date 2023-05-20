//
//  CustomColor.swift
//  iOS_MvvmPattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    class var pmint : UIColor { UIColor(hex: 0xCDF0EA) }
    class var ppink : UIColor { UIColor(hex: 0xF7DBF0) }
    class var ppurple : UIColor { UIColor(hex: 0xF7DBF0) }
    class var pgreen : UIColor { UIColor(hex: 0xE5FBB8)}
}
