//
//  UserFacedError.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 5.08.2022.
//

import Foundation

enum UserFacedError: LocalizedError {
    case noResult
    
    var errorDescription: String? {
        switch self {
        case .noResult:
            return "No results to display"
        }
    }
}
