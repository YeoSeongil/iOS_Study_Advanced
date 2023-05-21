//
//  NaverShoppingNetworkManager.swift
//  iOS_MvvmPattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import Foundation

class NaverShoppingNetworkManager {
    static let shared = NaverShoppingNetworkManager()
    private init() { }
    
    private let api = NaverShoppingAPI()
    private let header = NaverAPIKeys()
    private let session = URLSession(configuration: .default)

    var searchedData: [NaverShoppingResponse] = [NaverShoppingResponse.EMPTY]
    var addedData: [NaverShoppingResponse] = [NaverShoppingResponse.EMPTY]
    var startNum: Int = 1

    func getShoppingItems(query: String, completion: @escaping (NaverShoppingResponse) -> Void) {
        startNum = 1
        guard let url = api.searchShoppingItem(query: query, start: startNum).url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("X-Naver-Client-Id", forHTTPHeaderField: header.clientID)
        request.setValue("X-Naver-Client-Secret", forHTTPHeaderField: header.clientSecret)
        
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let hasData = try JSONDecoder().decode([NaverShoppingResponse].self, from: data)
                self.searchedData = hasData
            } catch let error as NSError {
                print("err")
                return
            }
        }.resume()
    }
}
