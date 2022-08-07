//
//  RepositoryRegistrations.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation
import Resolver

extension DependencyRegistrationService {
    func registerRepositories() {
        Resolver.register { ProductSearchRepository() as ProductSearchRepositoryProtocol }
    }
}
