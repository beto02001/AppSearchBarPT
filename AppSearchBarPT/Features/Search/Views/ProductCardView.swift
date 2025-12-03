//
//  ProductCardView.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation
import SwiftUI

struct ProductCardView: View {
    let image: String
    let title: String
    let price: String

    var body: some View {
        VStack(spacing: 0) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 135)
                .clipped()
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.letters)
                    .lineLimit(2)

                Text(price)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.pinkPrimary)
            }
            .padding(10)
        }
        .background(Color.colorComponents)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    ProductCardView(
        image: "coffee",
        title: "Cafetera de Goteo Programable",
        price: "$899.00"
    )
}
