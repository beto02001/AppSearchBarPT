//
//  ProductToViewModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

struct ProductModelToView: Identifiable {
    let id: String
    let title: String
    let image: String
    let price: String
    let promoPrice: String
    let colorHexes: [String]
}
