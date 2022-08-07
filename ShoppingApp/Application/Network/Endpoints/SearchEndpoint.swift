//
//  SearchEndpoint.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

struct SearchEndpoint: TargetEndpointProtocol {
    var base: String {
        AppConfig.baseURL
    }
    
    var path: String {
        return "/mobile-assignment/search"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var commonRequestObject: RequestObject {
        return RequestObject(host: base, path: path, httpMethod: .get)
    }
}
