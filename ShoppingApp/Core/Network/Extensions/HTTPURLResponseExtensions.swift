//
//  HTTPURLResponseExtensions.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

extension HTTPURLResponse {
    var httpStatus: HTTPStatus? {
        HTTPStatus(rawValue: statusCode)
    }
}
