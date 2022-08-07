//
//  ProductSearchViewModel.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 5.08.2022.
//

import SwiftUI
import Resolver

extension ProductSearchView {
    @MainActor class ViewModel: ObservableObject {
        
        @Injected private var repository: ProductSearchRepositoryProtocol
        @Published private(set) var searchResults: [SearchResultUIModel] = []
        private var fullResults: [SearchResultUIModel] = []
        @State var searchText: String = ""
        
        @discardableResult
        func search(text: String) async -> [SearchResultUIModel] {
            guard !text.isEmpty else {
                searchResults = []
                return []
            }
            if !fullResults.isEmpty {
                searchResults = fullResults
                return []
            }
            do {
                let searchResults = try await repository.getSearchedItems(queryText: text, page: 1)
                self.fullResults = searchResults
                self.searchResults = searchResults
                return searchResults
            } catch {
                print("No results returned")
                return []
            }
            
        }
    }
}
