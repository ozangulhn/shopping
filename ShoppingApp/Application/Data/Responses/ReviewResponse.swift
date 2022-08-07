//
//  ReviewInformationResponse.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

struct ReviewInformationResponse: Decodable, Equatable {
    // Reviews array isn't added here because there's no example of that object in the example response
    let reviewSummary: ReviewSummaryResponse
}

struct ReviewSummaryResponse: Decodable, Equatable {
    let reviewAverage: Double
    let reviewCount: Int
}
