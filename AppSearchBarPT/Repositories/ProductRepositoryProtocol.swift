//
//  ProductRepositoryProtocol.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

// MARK: - RepositoryProtocol
protocol ProductRepositoryProtocol {
    func searchProducts(term: String) async throws -> [ProductModelToView]
}
