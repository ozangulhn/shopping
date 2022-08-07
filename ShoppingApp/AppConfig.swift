//
//  AppConfig.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

enum AppEnvironment {
    case staging
    case production
}

final class AppConfig {
    static var environment: AppEnvironment {
        #if DEBUG
        return .staging
        #else
        return .production
        #endif
    }
    
    static var baseURL: String {
        switch environment {
        case .staging:
            return "bdk0sta2n0.execute-api.eu-west-1.amazonaws.com"
        case .production:
            return "bdk0sta2n0.execute-api.eu-west-1.amazonaws.com"
        }
    }
}
