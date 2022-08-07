//
//  MockLoader.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import Foundation
@testable import ShoppingApp

class MockLoader: NetworkLoader {
    
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?

    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, urlResponse, error)
    }
    
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse) {
        if let urlResponse = urlResponse {
            return (data, urlResponse)
        } else if let error = error {
            throw error
        } else {
            throw AppError.badResponse
        }
    }
}

