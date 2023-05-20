//
//  OrderAlertViewController.swift
//  iOS_DelegatePattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import UIKit

protocol CartDelegate {
    func alarmCartIsFilled(itemCount: Int)
}

class OrderAlertViewController: UIViewController {

    private var countNum: Int = 0
    private let burgerPrice: Int = 7900
    private let vc = ViewController()
    var delegate: CartDelegate?
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(stepperPressed), for: .touchUpInside)
        return stepper
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "어디서도 맛볼 수 없는 수제버거"
        label.textColor = .systemGray
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "7,900 원"
        label.textColor = .black
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cartPushButton: UIButton = {
        let button = UIButton()
        button.setTitle("장바구니 담기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
        self.setConstraint()
    }

    private func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.commentLabel)
        self.view.addSubview(self.countLabel)
        self.view.addSubview(self.priceLabel)
        self.view.addSubview(self.cartPushButton)
        self.view.addSubview(self.stepper)
    }
    
    private func setConstraint() {
        self.commentLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        self.commentLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        self.countLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        self.countLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        
        self.priceLabel.topAnchor.constraint(equalTo: self.commentLabel.bottomAnchor, constant: 10).isActive = true
        self.priceLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        self.stepper.topAnchor.constraint(equalTo: self.commentLabel.bottomAnchor, constant: 10).isActive = true
        self.stepper.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        self.cartPushButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        self.cartPushButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.cartPushButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc private func stepperPressed(_ sender: UIStepper) {
        countNum = Int(sender.value)
        self.countLabel.text = "\(countNum.description)"
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        self.delegate?.alarmCartIsFilled(itemCount: self.countNum)
    }
}
