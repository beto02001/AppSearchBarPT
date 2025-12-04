//
//  ProductCardView.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation
import SwiftUI
import System

struct ProductCardView: View {
    let fromModel: ProductModelToView

    var body: some View {
        HStack(spacing: 0) {
            AsyncImage(url: URL(string: fromModel.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.red)
                @unknown default:
                    Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.orange)
                }
            }
            .frame(width: 120, height: 100)
            .clipped()
            .background(Color.subtitle)

            VStack(alignment: .leading, spacing: 6) {
                Text(fromModel.title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.primary)
                    .lineLimit(2)

                if fromModel.price != fromModel.promoPrice {
                    Text(fromModel.price)
                        .font(.system(size: 14, weight: .thin))
                        .foregroundColor(.secondary)

                    Text(fromModel.promoPrice)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.pinkPrimary)
                } else {
                    Text(fromModel.promoPrice)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.pinkPrimary)
                }

                if !fromModel.colorHexes.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(Array(fromModel.colorHexes.enumerated()), id: \.0) { _, hex in
                                Circle()
                                    .fill(Color(hex: hex))
                                    .frame(width: 14, height: 14)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray.opacity(0.35), lineWidth: 0.8)
                                    )
                                    .accessibilityLabel(Text("Color \(hex)"))
                            }
                        }
                        .padding(.top, 6)
                    }
                    .frame(height: 22)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    ProductCardView(fromModel: .init(id: "", title: "", image: "", price: "", promoPrice: "", colorHexes: []))
}
