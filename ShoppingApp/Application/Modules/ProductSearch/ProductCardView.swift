//
//  ProductCardView.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 5.08.2022.
//

import SwiftUI

struct ProductCardView: View {
    @State var model: SearchResultUIModel
    
    var body: some View {
        HStack(spacing: 5) {
            LoadableImageView(url: URL(string: model.productImage))
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(model.productName).foregroundColor(.blue)
                Text("Review average: \(model.reviewInformation.reviewSummary.reviewAverage.toString(precision: 1)) (\(model.reviewInformation.reviewSummary.reviewCount) Reviews)")
                ForEach(model.usps) { text in
                    Text("• \(text)")
                }
                
                Spacer(minLength: 10)
                Text(model.salesPriceIncVat.toString(precision: 2) + Currency.euro.rawValue)
                if model.nextDayDelivery {
                    Text("Delivered tomorrow")
                }
            }
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(model: SearchResultUIModel.mock)
    }
}
