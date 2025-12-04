//
//  ProductSearchModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

struct ProductResponseModel: Decodable {
    let plpResults: PlpResults
}

struct PlpResults: Decodable {
    let records: [ProductSearchModel]
    let plpState: PlpState?
}

struct PlpState: Decodable {
    let firstRecNum: Int?
    let lastRecNum: Int?
    let recsPerPage: Int?
    let totalNumRecs: Int?
}

struct ProductSearchModel: Decodable {
    let productId: String
    let productDisplayName: String
    let listPrice: Double
    let promoPrice: Double?
    let smImage: String?
    let variantsColor: [ProductColorVariant]?
}

struct ProductColorVariant: Decodable {
    let colorName: String
    let colorHex: String?
}

extension ProductSearchModel {
    func toDomain() -> ProductModelToView {
        ProductModelToView(id: productId,
                           title: productDisplayName,
                           image: smImage ?? "",
                           price: "$\(listPrice)",
                           promoPrice: "$\(promoPrice ?? 0.0)",
                           colorHexes: variantsColor?.compactMap { $0.colorHex } ?? [])
    }
}

struct ProductModelToView: Identifiable {
    let id: String
    let title: String
    let image: String
    let price: String
    let promoPrice: String
    let colorHexes: [String]
}
