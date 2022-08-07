//
//  EncodableExtensions.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

extension Encodable {
    func toDictionary(encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
}


