//
//  NaverShoppingAPI.swift
//  iOS_MvvmPattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import Foundation

struct NaverShoppingAPI {
    static let schema = "https"
    static let host = "openapi.naver.com"
    static let path = "/v1/search/shop.json"
    
    func searchShoppingItem(query: String, start: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = NaverShoppingAPI.schema
        components.host = NaverShoppingAPI.host
        components.path = NaverShoppingAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "query", value: query),
            // GET 인자 query : 검색어
            URLQueryItem(name: "display", value: "20"),
            // GET 인자 display : 한 번에 표시할 검색 결과 개수
            URLQueryItem(name: "start", value: "\(start)")
            // GET 인자 start : 검색 시작 위치
        ]
        return components
    }
}

struct NaverShoppingAPIHeader {
    static var HEADERS = [
        "X-Naver-Client-Id" : NaverAPIKeys().clientID,
        "X-Naver-Client-Secret" : NaverAPIKeys().clientSecret]
}
