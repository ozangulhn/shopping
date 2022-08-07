//
//  NetworkLoader.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

protocol NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    func load(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data?, URLResponse)
}
