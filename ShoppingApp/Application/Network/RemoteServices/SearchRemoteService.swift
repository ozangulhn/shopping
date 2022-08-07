//
//  SearchRemoteService.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import Foundation

protocol SearchServiceProtocol {
    func getSearchedItems(queryText: String, page: Int) async throws ->  SearchResponse
}

final class SearchRemoteService: SearchServiceProtocol, Requestable {
    typealias TargetEndpoint = SearchEndpoint
    
    func getSearchedItems(queryText: String, page: Int) async throws -> SearchResponse {
        // Hardcoded parameters are given instead of using actually passed parameters
        let query = "apple"
        let page = 1
        var requestObject = TargetEndpoint().commonRequestObject
        requestObject.parameters["query"] = query
        requestObject.parameters["page"] = "\(page)"
        let response: SearchResponse = try await request(with: requestObject)
        return response
    }
}
