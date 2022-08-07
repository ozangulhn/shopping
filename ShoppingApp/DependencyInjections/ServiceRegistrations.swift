//
//  ServiceRegistrations.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation
import Resolver

extension DependencyRegistrationService {
    func registerServices() {
        Resolver.register { URLSession(configuration: .default) as NetworkLoader }
        Resolver.register { NetworkService() as BaseServiceProtocol }
        Resolver.register { JSONDecoder() }
        Resolver.register { JSONEncoder() }
    }
}
