//
//  Requestable.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation
import Resolver

protocol Requestable {
    associatedtype TargetEndpoint: TargetEndpointProtocol

    func request<T: Decodable>(baseService: BaseServiceProtocol,
                               with object: RequestObject) async throws ->  T
}

extension Requestable {
    
    func request<T: Decodable>(baseService: BaseServiceProtocol = Resolver.resolve(),
                               with object: RequestObject) async throws ->  T {
        try await baseService.request(with: object)
    }
}
