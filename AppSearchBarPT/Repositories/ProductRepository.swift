//
//  ProductRepository.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

final class ProductRepository: ProductRepositoryProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func searchProducts(term: String, page: Int, pageSize: Int = 20, sort: String? = nil) async throws -> (items: [ProductModelToView], totalNumRecs: Int?) {
        let endpoint = Endpoint.search(term: term, page: page, pageSize: pageSize, sort: sort)
        let response: ProductResponseModel = try await apiClient.send(endpoint?.urlRequest)
        let records = response.plpResults.records
        let items = records.map { $0.toDomain() }
        let total = response.plpResults.plpState?.totalNumRecs
        return (items: items, totalNumRecs: total)
    }
}
