//
//  WeatherTableViewCell.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import UIKit

private struct Constants {
    static let CELL_ID: String = "WeatherTableViewCell"
}

class WeatherTableViewCell: UITableViewCell {
    static let registerId: String = Constants.CELL_ID

    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maxTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setView() {
        self.backgroundColor = .white
        self.contentView.addSubview(self.weatherImageView)
        self.contentView.addSubview(self.cityNameLabel)
        self.contentView.addSubview(self.tempLabel)
        self.contentView.addSubview(self.maxTempLabel)
        self.contentView.addSubview(self.minTempLabel)
    }
    
    private func setConstraint() {
        self.weatherImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        self.weatherImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        self.weatherImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        self.cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        self.cityNameLabel.leadingAnchor.constraint(equalTo: self.weatherImageView.trailingAnchor, constant: 20).isActive = true
        
        self.tempLabel.topAnchor.constraint(equalTo: self.cityNameLabel.bottomAnchor, constant: 30).isActive = true
        self.tempLabel.leadingAnchor.constraint(equalTo: self.weatherImageView.trailingAnchor, constant: 20).isActive = true
        
        self.maxTempLabel.topAnchor.constraint(equalTo: self.cityNameLabel.bottomAnchor, constant: 30).isActive = true
        self.maxTempLabel.leadingAnchor.constraint(equalTo: self.tempLabel.trailingAnchor, constant: 15).isActive = true
        
        self.minTempLabel.topAnchor.constraint(equalTo: self.cityNameLabel.bottomAnchor, constant: 30).isActive = true
        self.minTempLabel.leadingAnchor.constraint(equalTo: self.maxTempLabel.trailingAnchor, constant: 15).isActive = true
    }
    
    func setData(_ model: WeatherResponse) {
        self.weatherImageView.image = UIImage(named: "\(model.weather[0].icon)")
        self.cityNameLabel.text = "\(model.name)"
        self.tempLabel.text = "\(model.main.temp)"
        self.maxTempLabel.text = "\(model.main.temp_max)"
        self.minTempLabel.text = "\(model.main.temp_min)"
    }
}
