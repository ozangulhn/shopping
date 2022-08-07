//
//  BaseServiceProtocol.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                                decoder: JSONDecoder) async throws -> T
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        try await request(with: requestObject, decoder: decoder)
    }
}
