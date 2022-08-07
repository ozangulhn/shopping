//
//  ProductSearchView.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 5.08.2022.
//

import SwiftUI

struct ProductSearchView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.searchResults) { result in
                ProductCardView(model: result)
            }
            .navigationTitle("Search Product")
            .searchable(text: $searchTerm,
                        prompt: "Enter keyword to search")
            .onChange(of: searchTerm) { newValue in
                Task {
                    await viewModel.search(text: newValue)
                }
            }
        }
    }
}

struct ProductSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSearchView()
    }
}


