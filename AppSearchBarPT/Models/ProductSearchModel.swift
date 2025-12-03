//
//  ProductSearchModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

struct ProductDemo: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let price: String

    static let sample: [ProductDemo] = [
        .init(image: "coffee", title: "Cafetera de Goteo Programable", price: "$899.00"),
        .init(image: "coffee", title: "Auriculares Inalámbricos", price: "$2,499.00"),
        .init(image: "coffee", title: "Mochila Urbana Resistente al Agua", price: "$1,250.00"),
        .init(image: "coffee", title: "Smartwatch Deportivo Moderno", price: "$3,150.00"),
        .init(image: "coffee", title: "Altavoz Bluetooth Portátil", price: "$950.00"),
        .init(image: "coffee", title: "Hervidor de Acero Inoxidable", price: "$780.00"),
        .init(image: "coffee", title: "Cafetera de Goteo Programable", price: "$899.00"),
        .init(image: "coffee", title: "Auriculares Inalámbricos", price: "$2,499.00"),
        .init(image: "coffee", title: "Mochila Urbana Resistente al Agua", price: "$1,250.00"),
        .init(image: "coffee", title: "Smartwatch Deportivo Moderno", price: "$3,150.00"),
        .init(image: "coffee", title: "Altavoz Bluetooth Portátil", price: "$950.00"),
        .init(image: "coffee", title: "Hervidor de Acero Inoxidable", price: "$780.00")
    ]
    
    static func getNewProducts() -> [ProductDemo] {
        return [
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
            .init(image: "coffee", title: "Nuevo", price: "$1,250.00"),
        ]
    }
}
