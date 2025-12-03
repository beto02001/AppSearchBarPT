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
    private let prefetchOffset = 3

    var filteredProducts: [ProductModelToView] {
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
            List {
                ForEach(items) { product in
                    ProductCardView(
                        imageURL: product.image,
                        title: product.title,
                        price: product.price,
                        colorHexes: ["#FF0000", "00FF00", "0000FF"]
                    )
                    .onAppear {
                        guard searchText.isEmpty else { return }
                        if let index = items.firstIndex(where: { $0.id == product.id }) {
                            let shouldPrefetch = index >= max(0, items.count - prefetchOffset)
                            if shouldPrefetch {
                                Task {
                                    //await viewModel.loadMoreIfNeeded(currentItem: product)
                                }
                            }
                        }
                    }
                }

                /*if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }*/
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Lista de Productos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bag")
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Buscar productos...")
            .onAppear {
                Task {
                    await viewModel.search("tenis")
                }
            }
        }
    }
}


#Preview {
    SearchView()
}
