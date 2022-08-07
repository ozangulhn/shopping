//
//  ResolverExtensions.swift
//  ShoppingAppTests
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import XCTest
import Resolver
@testable import ShoppingApp

extension Resolver {

    static var test: Resolver!

    static func setUp() {
        Resolver.test = Resolver(child: .main)
        Resolver.root = .test
    }

    static func tearDown() {
        Resolver.root = .main
    }
}
