//
//  SearchUIView.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText: String = ""
    private let prefetchOffset = 3

    var body: some View {
        NavigationView {
            Group {
                if viewModel.products.isEmpty && !viewModel.isLoading {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 44))
                            .foregroundColor(.secondary)
                        Text("Priducto no encontrado")
                            .font(.headline)
                        Text("No se encontró \(searchText).")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                } else {
                    let lastProductID = viewModel.products.last?.id ?? ""
                    List {
                        ForEach(viewModel.products) { product in
                            ProductCardView(fromModel: product)
                                .onAppear {
                                    guard product.id == lastProductID else { return }
                                    viewModel.loadMoreIfNeeded(currentItem: product, prefetchOffset: prefetchOffset)
                                }
                                .padding(.vertical, 8)
                        }

                        if viewModel.isLoading {
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            .listRowInsets(EdgeInsets())
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Lista de Productos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "settings")
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Buscar productos...")
            .onSubmit(of: .search) {
                viewModel.fetchInitial(term: searchText)
            }
            .onChange(of: searchText) { newValue in
                if newValue.isEmpty {
                    viewModel.fetchInitial(term: "")
                }
            }
            .onAppear {
                viewModel.fetchInitial(term: "")
            }
        }
    }
}

#Preview {
    SearchView()
}
