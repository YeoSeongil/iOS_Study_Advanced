//
//  TagCollectionView.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/25.
//

import UIKit

private struct Constants {
    struct Size {
        static let COLLECTIONVIEW_WIDTH_SIZE: CGFloat = 390
        static let COLLECTIONVIEW_HEIGHT_SIZE: CGFloat = 70
    }
    
    static let REGISTER_ID: String = "TagCollectionView"
}

class TagCollectionView: UICollectionView {
    static let registerId: String = Constants.REGISTER_ID
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.setCollectionView()
        self.setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setCollectionView() {
        self.backgroundColor = .white
        self.register(TagViewCollectionViewCell.self, forCellWithReuseIdentifier: TagViewCollectionViewCell.registerId)
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.minimumLineSpacing = 30
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraint() {
        self.widthAnchor.constraint(equalToConstant: Constants.Size.COLLECTIONVIEW_WIDTH_SIZE).isActive = true
        self.heightAnchor.constraint(equalToConstant: Constants.Size.COLLECTIONVIEW_HEIGHT_SIZE).isActive = true
    }
    
}
