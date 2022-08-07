//
//  ProductSearchRepositoryTests.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import XCTest
@testable import ShoppingApp
import Resolver

class ProductSearchRepositoryTests: XCTestCase {
    
    var sut: ProductSearchRepositoryProtocol!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testResultEqualsToGivenItem() async throws {
        // GIVEN
        let response = SearchResponse.mock
        let expectedUIModel = SearchResultUIModel.convert(from: response)
        let mockService = MockSearchService()
        Resolver.test.register { mockService as SearchServiceProtocol }
        
        mockService.searchResponse = response
        
        sut = ProductSearchRepository()
        // WHEN
        let actualResults = try await sut.getSearchedItems(queryText: "test-query", page: 1)
        
        // THEN
        XCTAssertEqual(actualResults,  expectedUIModel)
    }
}
