//
//  SearchUIModel.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

struct SearchResultUIModel: Identifiable, Equatable {
    let productID: Int
    let productName: String
    let reviewInformation: ReviewInformationUIModel
    let usps: [String]
    let availabilityState: Int
    let salesPriceIncVat: Double
    let productImage: String
    let nextDayDelivery: Bool
    let id = UUID().uuidString
    
    static func == (lhs: SearchResultUIModel, rhs: SearchResultUIModel) -> Bool {
        return lhs.productID == rhs.productID
    }
}

extension SearchResultUIModel: MockableModel {
    static func convert(from response: SearchResponse) -> [SearchResultUIModel] {
        return response.products.map { response in
            
            return SearchResultUIModel(productID: response.productID,
                                       productName: response.productName,
                                       reviewInformation: ReviewInformationUIModel(
                                        reviewSummary: ReviewSummaryModel(
                                            reviewAverage: response.reviewInformation.reviewSummary.reviewAverage,
                                            reviewCount: response.reviewInformation.reviewSummary.reviewCount)),
                                       usps: response.usps,
                                       availabilityState: response.availabilityState,
                                       salesPriceIncVat: response.salesPriceIncVat,
                                       productImage: response.productImage,
                                       nextDayDelivery: response.nextDayDelivery)
        }
    }
    
    static var mock: SearchResultUIModel {
        return SearchResultUIModel(productID: 809680,
                                  productName: "Apple iPad (2018) 128GB Wifi Space Gray",
                                  reviewInformation: ReviewInformationUIModel(reviewSummary: ReviewSummaryModel(reviewAverage: 8.9, reviewCount: 928)),
                                  usps: ["9,7 inch Retina scherm",
                                  "Internet alleen via wifi",
                                  "128 GB opslagcapaciteit"],
                                  availabilityState: 2,
                                  salesPriceIncVat: 749.99,
                                  productImage: "https://image.coolblue.nl/300x750/products/1010388",
                                  nextDayDelivery: true)
    }
}


