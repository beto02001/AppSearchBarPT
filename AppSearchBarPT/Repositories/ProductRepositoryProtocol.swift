//
//  ProductRepositoryProtocol.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

protocol ProductRepositoryProtocol {
    func searchProducts(term: String, page: Int, pageSize: Int, sort: String?) async throws -> (items: [ProductModelToView], totalNumRecs: Int?)
}
