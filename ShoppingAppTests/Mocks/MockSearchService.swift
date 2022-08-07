//
//  MockSearchService.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import Foundation
@testable import ShoppingApp

class MockSearchService: SearchServiceProtocol {
    var searchResponse: SearchResponse!
    
    func getSearchedItems(queryText: String, page: Int) async throws -> SearchResponse {
        return searchResponse
    }
}
