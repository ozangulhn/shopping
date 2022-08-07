//
//  MockableModel.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 6.08.2022.
//

import Foundation

protocol MockableModel {
    static var mock: Self { get }
}
