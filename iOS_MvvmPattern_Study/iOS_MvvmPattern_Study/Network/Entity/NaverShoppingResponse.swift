//
//  NaverShoppingResponse.swift
//  iOS_MvvmPattern_Study
//
//  Created by 여성일 on 2023/05/20.
//

import Foundation

struct NaverShoppingResponse: Decodable {
    let total: Int
    // 총 검색 결과 개수
    let items: [NaverShoppingItems]
}

struct NaverShoppingItems: Decodable {
    let title: String
    // 상품 이름
    let link: String
    // 상품 정보 URL
    let image: String
    // 상품 섬네일 이미지 URL
    let lprice: Int
    // 상품 최저가
    let hprice: Int
    // 상품 최고가
}

extension NaverShoppingResponse {
    static let EMPTY = NaverShoppingResponse(total: 0, items: [])
}
