//
//  ViewController.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/21.
//

import UIKit

private struct Constants {
    struct Size {
        static let LEADING_ANCHOR_SIZE: CGFloat = 10
        static let TRAILING_ANCHOR_SIZE: CGFloat = -10
        static let TOP_ANCHOR_SIZE: CGFloat = 50
    }
    
    struct Tag {
        static let TagName: [String] = ["한국", "영국", "일본", "미국"]
    }
}

class ViewController: UIViewController {
    
    private let tags = TagCellData().getTagCellSearchQuery()
    private let TagSV = TagViewStackView()
    private let WeatherTV = WeatherTableView()
    private let TagCV = TagCollectionView()
    private let NetworkManager = WeatherNetworkManager()
    
    private let WetherTableViewModel = WeatherTableViewModel()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstraint()
        setStackView()
        setColletionView()
        setTableView()
        setUpData()
        
        bind(self.WetherTableViewModel)
    }
    
    private func setView() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
    }

    private func setStackView() {
        [self.TagCV, self.WeatherTV].map {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    private func setTableView() {
        self.WeatherTV.delegate = self
        self.WeatherTV.dataSource = self
    }
    
    private func setColletionView() {
        self.TagCV.delegate = self
        self.TagCV.dataSource = self
    }
    
    private func setConstraint() {
        self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constants.Size.TOP_ANCHOR_SIZE).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Size.LEADING_ANCHOR_SIZE).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Size.TRAILING_ANCHOR_SIZE).isActive = true
    }
    
    private func setUpData() {
        self.WetherTableViewModel.fetchData("1835847,1841610,1843125,1845106,1845105,1845789,1845788,1841597,1902028,1846265")
    }
    
    
    func bind(_ viewModel: WeatherTableViewModel) {
        self.WeatherTV.bind(viewModel)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.WetherTableViewModel.data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.registerId, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        let weatherItem = self.WetherTableViewModel.data.value[indexPath.row]
        cell.setData(weatherItem)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
        let query = self.tags[indexPath.row]
        self.WetherTableViewModel.fetchData(query)
        self.WeatherTV.setContentOffset(.zero, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagViewCollectionViewCell.registerId, for: indexPath) as? TagViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let tagName = Constants.Tag.TagName[indexPath.row]
        cell.setData(tagName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Constants.Tag.TagName.count)
        return Constants.Tag.TagName.count
    }
}
