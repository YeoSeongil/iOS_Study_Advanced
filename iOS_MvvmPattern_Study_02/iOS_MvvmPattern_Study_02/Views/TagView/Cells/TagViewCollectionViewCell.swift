//
//  TagViewCollectionViewCell.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/25.
//

import UIKit

private struct Constants {
    static let CELL_ID: String = "TagViewCollectionViewCell"
}

class TagViewCollectionViewCell: UICollectionViewCell {
    static let registerId: String = Constants.CELL_ID
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setView()
        self.setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemRed.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setView() {
        self.backgroundColor = .white
        self.contentView.addSubview(self.tagLabel)
    }
    
    private func setConstraint() {
        self.tagLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.tagLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setData(_ model: String) {
        self.tagLabel.text = model
    }
    
}
