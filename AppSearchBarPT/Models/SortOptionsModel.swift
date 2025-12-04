//
//  SortOptionsModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

enum SortOption: String, CaseIterable, Identifiable {
    case relevance = "Relevancia|0"
    case priceAsc = "sortPrice|0"
    case priceDesc = "sortPrice|1"
    case newArrival = "newArrival|1"
    case rating = "rating|1"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .relevance: return "Relevancia"
        case .priceAsc: return "Precio: menor a mayor"
        case .priceDesc: return "Precio: mayor a menor"
        case .newArrival: return "Lo Más Nuevo"
        case .rating: return "Mejor calificados"
        }
    }
}
