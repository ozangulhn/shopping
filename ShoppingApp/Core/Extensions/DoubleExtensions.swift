//
//  DoubleExtensions.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 5.08.2022.
//

import Foundation

extension Double {
    func toString(precision: Int) -> String {
        return String(format: "%.\(precision)f", self)
    }
}
