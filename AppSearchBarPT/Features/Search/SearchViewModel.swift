//
//  SearchViewModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    @Published var products = [ProductDemo]()

    func fetchProduct(category: String) {
        print("primera carga")
        self.products = ProductDemo.sample
    }
    
    func loadMoreIfNeeded(currentItem: ProductDemo) {
        print("Cargar más productos")
        let newProducts = ProductDemo.getNewProducts()
        self.products.append(contentsOf: newProducts)
    }
}

