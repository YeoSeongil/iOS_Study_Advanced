//
//  WeatherTableView.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import UIKit

private struct Constants {
    static let REGISTER_ID: String = "WeatherTableView"
}

class WeatherTableView: UITableView {
    static let registerId: String = Constants.REGISTER_ID
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setTableView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView() {
        self.backgroundColor = .white
        self.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.registerId)
        //self.rowHeight = UITableView.automaticDimension
        self.separatorStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraint() {
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func bind(_ viewModel: WeatherTableViewModel) {
        viewModel.data.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
}
