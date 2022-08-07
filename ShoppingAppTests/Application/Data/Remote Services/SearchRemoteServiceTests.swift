//
//  SearchRemoteServiceTests.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import XCTest
@testable import ShoppingApp
import Resolver

class SearchRemoteServiceTests: XCTestCase {

    var sut: SearchServiceProtocol!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testSearchServiceReturnsCorrectResponse() async throws {
        //GIVEN
        let productResponse = ProductResponse.mock
        let expectedResponse = SearchResponse(products: [productResponse], currentPage: 1, pageSize: 1, totalResults: 1, pageCount: 1)
        let mockService = MockBaseService(model: expectedResponse)
        Resolver.test.register { mockService as BaseServiceProtocol }
        
        sut = SearchRemoteService()
        
        let expectedUIModel = SearchResultUIModel.convert(from: expectedResponse)
        //WHEN
        let results = try await sut.getSearchedItems(queryText: "", page: 1)
        
        //THEN
        XCTAssertEqual(results, expectedResponse)
    }
    
    func testEndpointPathIsCorrect() async throws {
        let endpoint = SearchEndpoint()
        
        sut = SearchRemoteService()
        
        
    }
}
