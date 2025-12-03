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
    let colorHexes: [String]

    static let sample: [ProductDemo] = [
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Cafetera de Goteo Programable", price: "$899.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Auriculares Inalámbricos", price: "$2,499.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Mochila Urbana Resistente al Agua", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Smartwatch Deportivo Moderno", price: "$3,150.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Altavoz Bluetooth Portátil", price: "$950.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Hervidor de Acero Inoxidable", price: "$780.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Cafetera de Goteo Programable", price: "$899.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Auriculares Inalámbricos", price: "$2,499.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Mochila Urbana Resistente al Agua", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Smartwatch Deportivo Moderno", price: "$3,150.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Altavoz Bluetooth Portátil", price: "$950.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Hervidor de Acero Inoxidable", price: "$780.00", colorHexes: ["#FF0000", "00FF00", "0000FF"])
    ]
    
    static func getNewProducts() -> [ProductDemo] {
        return [
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
            .init(image: "https://ss632.liverpool.com.mx/sm/1186092704.jpg", title: "Nuevo", price: "$1,250.00", colorHexes: ["#FF0000", "00FF00", "0000FF"]),
        ]
    }
}
