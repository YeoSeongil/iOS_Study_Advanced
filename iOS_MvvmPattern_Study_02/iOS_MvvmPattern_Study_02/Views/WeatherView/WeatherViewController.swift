//
//  WeatherViewController.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setView() {
        self.view.backgroundColor = .clear
        self.view.addSubview(self.tableView)
    }
    
}
