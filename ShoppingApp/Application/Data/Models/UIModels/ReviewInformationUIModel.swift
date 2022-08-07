//
//  ReviewInformationModel.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 5.08.2022.
//

import Foundation

struct ReviewInformationUIModel {
    // Reviews array isn't added here because there's no example of that object in the example response
    let reviewSummary: ReviewSummaryModel
}

struct ReviewSummaryModel {
    let reviewAverage: Double
    let reviewCount: Int
}
