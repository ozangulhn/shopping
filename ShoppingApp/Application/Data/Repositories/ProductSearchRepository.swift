//
//  ProductSearchRepository.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation
import Resolver

protocol ProductSearchRepositoryProtocol {
    func getSearchedItems(queryText: String, page: Int) async throws -> [SearchResultUIModel]
}

final class ProductSearchRepository: ProductSearchRepositoryProtocol {
    
    @Injected private var service: SearchServiceProtocol
    
    func getSearchedItems(queryText: String, page: Int) async throws -> [SearchResultUIModel] {
        let response = try await service.getSearchedItems(queryText: queryText, page: page)
        let uiModel = SearchResultUIModel.convert(from: response)
        return uiModel
    }
}
