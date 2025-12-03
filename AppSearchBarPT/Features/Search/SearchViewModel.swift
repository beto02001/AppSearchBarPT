//
//  SearchViewModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {

    @Published var products: [ProductModelToView] = []
    private let repository = ProductRepository()

    func search(_ term: String) async {
        do {
            let items = try await repository.searchProducts(term: term)
            self.products = items
        } catch {
            print("Error buscando productos:", error)
        }
    }
}
