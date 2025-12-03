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

    func searchProducts(term: String) async throws -> [ProductModelToView] {
        let endpoint = Endpoint.search(term: term)
        let response: ProductResponseModel = try await apiClient.send(endpoint.urlRequest)
        let records = response.plpResults.records
        return records.map { $0.toDomain() }
    }
}
