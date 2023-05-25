//
//  WeatherNetworkManager.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import Foundation

class WeatherNetworkManager {
    //static let shared = WeatherNetworkManager()
    
    init() { }
    
    private let api = WeatherAPI()
    private let session = URLSession(configuration: .default)

    var groupData: GroupResponse = GroupResponse.EMPTY
    
    func getWeatherItem(query: String, completion: @escaping (GroupResponse) -> Void) {
        guard let url = api.getURL(query: query, apiId: ApiKey.ApiKey, lang: "kr", units: "metric").url else {
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }

            do {
                let hasData = try JSONDecoder().decode(GroupResponse.self, from: data)
                self.groupData = hasData
                completion(self.groupData)
            } catch let error as NSError {
                print("err \(error)")
                return
            }
        }.resume()
    }
}

