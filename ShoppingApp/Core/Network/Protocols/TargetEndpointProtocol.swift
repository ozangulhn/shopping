//
//  TargetEndpointProtocol.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

protocol TargetEndpointProtocol {
    var base: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var commonRequestObject: RequestObject { get }
}
