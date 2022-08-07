//
//  ProductSearchViewModelTests.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import XCTest
@testable import ShoppingApp
import Resolver

class ProductSearchViewModelTests: XCTestCase {

    var sut: ProductSearchView.ViewModel!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }
    
    @MainActor
    func testResultsAreEmptyForEmptyQuery() async throws {
        // GIVEN
        let givenResponse = SearchResponse.mock
        Resolver.test.register { MockBaseService(model: givenResponse) as BaseServiceProtocol }
        Resolver.test.register { SearchRemoteService() as SearchServiceProtocol }
        Resolver.test.register { ProductSearchRepository() as ProductSearchRepositoryProtocol }
        
        sut = .init()
        
        // WHEN
        let results = await sut.search(text: "")
    
        // THEN
        XCTAssert(results.isEmpty)
    }
    
    @MainActor
    func testResultsReturnedFromNonEmptyQuery() async throws {
        // GIVEN
        let givenResponse = SearchResponse.mock
        let expectedResults = SearchResultUIModel.convert(from: givenResponse)
        let mockBaseService = MockBaseService(model: givenResponse)
        Resolver.test.register { mockBaseService as BaseServiceProtocol }
        Resolver.test.register { SearchRemoteService() as SearchServiceProtocol }
        Resolver.test.register { ProductSearchRepository() as ProductSearchRepositoryProtocol }
    
        sut = .init()
        
        // WHEN
        let searchResults = await sut.search(text: "test-search")
        
        // THEN
        XCTAssertEqual(searchResults, expectedResults)
        
    
    }
}
