//
//  HTTPMethod.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible {
    case get
    case post
    case put
    case delete

    var description: String {
        rawValue.uppercased()
    }
}
