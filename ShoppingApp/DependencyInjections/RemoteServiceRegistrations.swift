//
//  RemoteServiceRegistrations.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Resolver

extension DependencyRegistrationService {
    func registerRemoteServices() {
        Resolver.register { SearchRemoteService() as SearchServiceProtocol }
    }
}
