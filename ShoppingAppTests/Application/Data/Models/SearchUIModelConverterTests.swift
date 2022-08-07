//
//  SearchUIModelConverterTests.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import XCTest
@testable import ShoppingApp

class SearchUIModelConverterTests: XCTestCase {

    var sut = SearchResultUIModel.self
    
    func testUIModelConvertedFromResponseCorrectly() throws {
        // GIVEN
        let productResponse = ProductResponse.mock
        let searchResponse = SearchResponse(products: [productResponse], currentPage: 1, pageSize: 1, totalResults: 1, pageCount: 1)
        
        // WHEN
        let convertedUIModel = try XCTUnwrap(sut.convert(from:searchResponse).first)
        
        // THEN
        XCTAssertEqual(convertedUIModel.productID, productResponse.productID)
        XCTAssertEqual(convertedUIModel.productName, productResponse.productName)
        XCTAssertEqual(convertedUIModel.productImage, productResponse.productImage)
        XCTAssertEqual(convertedUIModel.nextDayDelivery, productResponse.nextDayDelivery)
        XCTAssertEqual(convertedUIModel.salesPriceIncVat, productResponse.salesPriceIncVat)
        XCTAssertEqual(convertedUIModel.reviewInformation.reviewSummary.reviewCount, productResponse.reviewInformation.reviewSummary.reviewCount)
        XCTAssertEqual(convertedUIModel.reviewInformation.reviewSummary.reviewAverage, productResponse.reviewInformation.reviewSummary.reviewAverage)
        XCTAssertEqual(convertedUIModel.usps, productResponse.usps)
    }
}
