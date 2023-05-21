//
//  ViewController.swift
//  iOS_MvvmPattern_Study_01
//
//  Created by 여성일 on 2023/05/21.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel: ViewModel = ViewModel()
    
    private let babyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.backgroundColor = .cyan
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let babyNameLabel: UILabel = {
       let label = UILabel()
        label.text = "성일"
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Next  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setView()
        setConstraint()
        bind()
    }
    
    private func bind() {
        viewModel.babyImage.bind { image in
            print("View change babyImg")
            self.babyImageView.image = image
        }
        
        viewModel.babyName.bind { name in
            print("View change babyName")
            self.babyNameLabel.text = name
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        viewModel.nextButtonTapped()
    }
    
    private func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(babyImageView)
        self.view.addSubview(babyNameLabel)
        self.view.addSubview(nextButton)
    }
    
    private func setConstraint() {
        self.babyImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.babyImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.babyImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.babyImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
        
        self.babyNameLabel.topAnchor.constraint(equalTo: self.babyImageView.bottomAnchor, constant: 15).isActive = true
        self.babyNameLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.nextButton.topAnchor.constraint(equalTo: self.babyNameLabel.topAnchor, constant: 50).isActive = true
        self.nextButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }


}

