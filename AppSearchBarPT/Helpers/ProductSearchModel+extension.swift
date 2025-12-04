//
//  ProductSearchModel+extension.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation

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
