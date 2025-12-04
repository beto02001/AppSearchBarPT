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
    @State private var showingFilterSheet = false
    @State private var selectedSort: SortOption? = nil

    var body: some View {
        NavigationView {
            Group {
                if viewModel.products.isEmpty && !viewModel.isLoading {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 44))
                            .foregroundColor(.secondary)
                        Text("Producto no encontrado")
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
                                    viewModel.loadMoreIfNeeded(
                                        currentItem: product,
                                        sort: selectedSort?.rawValue
                                    )
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
                        showingFilterSheet = true
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Buscar productos...")
            .onSubmit(of: .search) {
                viewModel.fetchInitial(term: searchText, sort: selectedSort?.rawValue)
            }
            .onChange(of: searchText) { newValue in
                if newValue.isEmpty {
                    viewModel.fetchInitial(term: "", sort: selectedSort?.rawValue)
                }
            }
            .onAppear {
                viewModel.fetchInitial(term: "", sort: selectedSort?.rawValue)
            }
            .sheet(isPresented: $showingFilterSheet) {
                FilterSortView(initialSort: selectedSort) { newSort in
                    selectedSort = newSort
                    Task {
                        viewModel.fetchInitial(term: searchText, sort: selectedSort?.rawValue)
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
