//
//  TagViewStackView.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import UIKit

private struct Constants {
    struct Size {
        static let STACKVIEW_WIDTH_SIZE: CGFloat = 390
        static let STACKVIEW_HEIGHT_SIZE: CGFloat = 40
    }
    
    struct TabName {
        static let TAB_NAME_KOR: String = "한국"
        static let TAB_NAME_USA: String = "미국"
        static let TAB_NAME_JPN: String = "일본"
        static let TAB_NAME_ENG: String = "영국"
    }
}

class TagViewStackView: UIStackView {
    
    private let korButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.TabName.TAB_NAME_KOR, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed
        return button
    }()
    
    private let usaButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.TabName.TAB_NAME_USA, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let jpnButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.TabName.TAB_NAME_JPN, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPink
        return button
    }()
    
    private let engButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.TabName.TAB_NAME_ENG, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemTeal
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStackView()
        self.setConstraint()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStackView() {
        [self.korButton, self.usaButton, self.jpnButton, self.engButton].map {
            self.addArrangedSubview($0)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.backgroundColor = .clear
        self.distribution = .fillEqually
        self.spacing = 10
    }
    
    private func setConstraint() {
        self.widthAnchor.constraint(equalToConstant: Constants.Size.STACKVIEW_WIDTH_SIZE).isActive = true
        self.heightAnchor.constraint(equalToConstant: Constants.Size.STACKVIEW_HEIGHT_SIZE).isActive = true
    }
}
