//
//  BaseServiceTests.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import XCTest
@testable import ShoppingApp
import Resolver

class BaseServiceTests: XCTestCase {
    var sut: BaseServiceProtocol!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }

    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }

    func testSuccessfulResponse() async throws {
        // GIVEN
        let session = MockLoader()
        let expected = "ExpectedString"
        let data = try! JSONEncoder().encode(expected)
        session.data = data
        session.urlResponse = URLResponse()
        
        Resolver.test.register { session as NetworkLoader }
        sut = NetworkService()
        // WHEN
        let requestObject = RequestObject(host: "", path: "/example-path")
        let response: String = try await sut.request(with: requestObject, decoder: JSONDecoder())
        
        //THEN
        XCTAssertEqual(response, expected)
    }
    
    func testErrorThrown() async throws {
        let session = MockLoader()
        let error = AppError.invalidUrlRequest
        session.error = error
        Resolver.test.register { session as NetworkLoader }
        
        sut = NetworkService()
        
        let requestObject = RequestObject(host: "", path: "")
        
        do {
            let _: String = try await self.sut.request(with: requestObject, decoder: JSONDecoder())
        } catch {
            XCTAssert(true)
            return
        }
        
        XCTAssert(false)
    
    }
}
