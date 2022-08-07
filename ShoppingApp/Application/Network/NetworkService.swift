//
//  NetworkService.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation
import Resolver

final class NetworkService: BaseServiceProtocol {
    @Injected private var urlSession: NetworkLoader
    
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        do {
            let urlRequest = try requestObject.getUrlRequest()
            let (data, response) = try await urlSession.load(for: urlRequest, delegate: nil)
            return try handle(response, with: decoder, with: data)
        } catch {
            return try handle(nil, data: nil, error: error)
        }
    }
    
    private func handle<T: Decodable>(_ response: URLResponse?,
                                      with decoder: JSONDecoder,
                                      with data: Data?) throws -> T {
        guard let httpData = data else {
            return try handle(response, data: data, error: nil)
        }
        
        do {
            return try decoder.decode(T.self, from: httpData)
        } catch {
            return try handle(response, data: data, error: error)
        }
    }

    private func handle<T: Decodable>(_ response: URLResponse?,
                                      data: Data?,
                                      error: Error?) throws -> T {
        if let response = response as? HTTPURLResponse,
           let httpStatus = response.httpStatus, httpStatus.httpStatusType != .success {
            throw AppError.httpError(status: httpStatus)
        }
        
        if let err = error {
            throw AppError.unknown(error: err as NSError)
        }
        
        throw AppError.badResponse
    }
}
