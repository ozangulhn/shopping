//
//  SearchResponse.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

struct SearchResponse: Decodable, MockableModel, Equatable {
    let products: [ProductResponse]
    let currentPage: Int?
    let pageSize: Int?
    let totalResults: Int?
    let pageCount: Int?
    
    static var mock: Self {
        return SearchResponse(products: [ProductResponse.mock], currentPage: 1, pageSize: 1, totalResults: 1, pageCount: 1)
    }
}
