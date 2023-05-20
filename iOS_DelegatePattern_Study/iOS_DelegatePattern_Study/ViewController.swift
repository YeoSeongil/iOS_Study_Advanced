//
//  ViewController.swift
//  iOS_DelegatePattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import UIKit

class ViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "패스트 푸드"
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recommendLabel: UILabel = {
       let label = UILabel()
        label.text = "간편하고 빠른 음식을 원한다면 ?"
        label.textColor = .systemGray
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let foodImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "burger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cartButton: UIButton = {
        let button = UIButton()
        button.setTitle("장바구니", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstraint()
    }
    
    private func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.recommendLabel)
        self.view.addSubview(self.foodImageView)
        self.view.addSubview(self.commentLabel)
        self.view.addSubview(self.cartButton)
    }
    
    private func setConstraint() {
        self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        self.recommendLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        self.recommendLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        self.foodImageView.topAnchor.constraint(equalTo: self.recommendLabel.bottomAnchor, constant: 70).isActive = true
        self.foodImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.foodImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        self.foodImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -330).isActive = true
        
        self.commentLabel.topAnchor.constraint(equalTo: self.foodImageView.bottomAnchor, constant: 10).isActive = true
        self.commentLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.commentLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        
        self.cartButton.topAnchor.constraint(equalTo: self.foodImageView.bottomAnchor, constant: -34).isActive = true
        self.cartButton.leadingAnchor.constraint(equalTo: self.foodImageView.trailingAnchor, constant: -63).isActive = true
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let vc = OrderAlertViewController()
        vc.delegate = self

        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true)
    }
}

extension ViewController: CartDelegate {
    func alarmCartIsFilled(itemCount: Int) {
        print(itemCount)
        let alertVc = UIAlertController(title: "장바구니 확인", message: "장바구니에 \(itemCount)개의 상품이 추가되었습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alertVc.addAction(okAction)
        present(alertVc, animated: true)
    }
}

