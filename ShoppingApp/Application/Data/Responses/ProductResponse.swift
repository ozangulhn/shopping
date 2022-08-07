//
//  ProductResponse.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

struct ProductResponse: Decodable, MockableModel, Equatable {
    let productID: Int
    let productName: String
    let reviewInformation: ReviewInformationResponse
    let usps: [String]
    let availabilityState: Int
    let salesPriceIncVat: Double
    let productImage: String
    let coolbluesChoiceInformationTitle: String?
    let promoIcon: PromoIcon?
    let nextDayDelivery: Bool
    let listPriceIncVat: Int?
    let listPriceExVat: Double?
    
    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productName, reviewInformation, availabilityState, salesPriceIncVat, productImage, coolbluesChoiceInformationTitle, promoIcon, nextDayDelivery, listPriceIncVat, listPriceExVat
        case usps = "USPs"
    }
    
    static var mock: Self {
        return ProductResponse(productID: 1,
                               productName: "TestName",
                               reviewInformation: ReviewInformationResponse(reviewSummary: ReviewSummaryResponse(reviewAverage: 9.0, reviewCount: 1)),
                               usps: ["TestName"],
                               availabilityState: 2,
                               salesPriceIncVat: 60.0,
                               productImage: "URL",
                               coolbluesChoiceInformationTitle: "Test",
                               promoIcon: PromoIcon(text: "", type: .coolbluesChoice),
                               nextDayDelivery: true,
                               listPriceIncVat: 2,
                               listPriceExVat: 2)
    }
}

struct PromoIcon: Decodable, Equatable {
    let text: String
    let type: TypeEnum
}

enum TypeEnum: String, Decodable {
    case actionPrice = "action-price"
    case coolbluesChoice = "coolblues-choice"
}


