//
//  SearchViewModel.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import Foundation
import Combine

import Foundation

@MainActor
final class SearchViewModel: ObservableObject {

    @Published private(set) var products: [ProductModelToView] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var hasMore: Bool = true

    private let repository: ProductRepositoryProtocol
    private var currentPage: Int = 1
    private var pageSize: Int
    private var currentTerm: String = ""
    private var totalNumRecs: Int? = nil

    private var currentTask: Task<Void, Never>?

    init(repository: ProductRepositoryProtocol = ProductRepository(), pageSize: Int = 20) {
        self.repository = repository
        self.pageSize = pageSize
    }

    func fetchInitial(term: String, sort: String? = nil) {
        currentTask?.cancel()

        currentTask = Task { [weak self] in
            guard let self = self else { return }
            await self.setUpForNewSearch(term: term)
            await self.loadPage(sort: sort)
        }
    }

    func loadMoreIfNeeded(currentItem: ProductModelToView, prefetchOffset: Int = 2, sort: String? = nil) {
        Task {
            guard !isLoading && hasMore else { return }
            guard let index = products.firstIndex(where: { $0.id == currentItem.id }) else { return }

            let triggerIndex = max(0, products.count - 1 - prefetchOffset)
            if index >= triggerIndex {
                await loadPage(sort: sort)
            }
        }
    }

    private func setUpForNewSearch(term: String) async {
        currentTerm = term
        currentPage = 1
        totalNumRecs = nil
        hasMore = true
        products = []
    }

    private func loadPage(sort: String? = nil) async {
        guard !isLoading && hasMore else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let (items, total) = try await repository.searchProducts(term: currentTerm, page: currentPage,
                                                                     pageSize: pageSize, sort: sort)

            if currentPage == 1 {
                products = items
            } else {
                products.append(contentsOf: items)
            }
            print("Conteo de productos: \(products.count)")
            totalNumRecs = total

            if let totalNum = totalNumRecs {
                hasMore = products.count < totalNum
                if hasMore { currentPage += 1 }
            } else {
                if items.count < pageSize {
                    hasMore = false
                } else {
                    hasMore = true
                    currentPage += 1
                }
            }
        } catch {
            if Task.isCancelled { return }
            print("Error loadPage:", error)
        }
    }
}
