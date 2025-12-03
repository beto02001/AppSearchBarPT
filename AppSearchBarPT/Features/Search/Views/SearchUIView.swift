//
//  SearchUIView.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import SwiftUI

struct SearchView: View {

    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""

    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]

    private let prefetchOffset = 3

    var filteredProducts: [ProductDemo] {
        if searchText.isEmpty {
            return viewModel.products
        } else {
            return viewModel.products.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        let items = filteredProducts

        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(items) { product in
                        ProductCardView(
                            image: product.image,
                            title: product.title,
                            price: product.price
                        )
                        .onAppear {
                            guard searchText.isEmpty else { return }
                            if let index = items.firstIndex(where: { $0.id == product.id }) {
                                let shouldPrefetch = index >= max(0, items.count - prefetchOffset)
                                if shouldPrefetch {
                                    Task {
                                        await viewModel.loadMoreIfNeeded(currentItem: product)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 15)
                .padding(.bottom, 20)
            }
            .navigationTitle("Lista de Productos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .foregroundColor(.black)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Buscar productos...")
            .onAppear {
                Task {
                    await viewModel.fetchProduct(category: "")
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
