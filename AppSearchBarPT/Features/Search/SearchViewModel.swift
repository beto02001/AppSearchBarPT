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
    private var totalNumberOfItems: Int? = nil
    private let prefetchIndexItem: Int = 4
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

    func loadMoreIfNeeded(currentItem: ProductModelToView, sort: String? = nil) {
        Task {
            guard !isLoading && hasMore else { return }
            guard let index = products.firstIndex(where: { $0.id == currentItem.id }) else { return }

            let triggerIndex = max(0, products.count - 1 - prefetchIndexItem)
            if index >= triggerIndex {
                await loadPage(sort: sort)
            }
        }
    }

    private func setUpForNewSearch(term: String) async {
        currentTerm = term
        currentPage = 1
        totalNumberOfItems = nil
        hasMore = true
        products = []
    }

    private func loadPage(sort: String? = nil) async {
        guard !isLoading && hasMore else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let (items, totalItems) = try await repository.searchProducts(term: currentTerm, page: currentPage,
                                                                     pageSize: pageSize, sort: sort)
            saveData(from: items)
            updatePagination(number: totalItems, quantityItems: items.count)
        } catch {
            if Task.isCancelled { return }
            print("Error loadPage:", error)
        }
    }
    
    private func saveData(from items: [ProductModelToView]) {
        if currentPage == 1 {
            products = items
        } else {
            products.append(contentsOf: items)
        }
    }
    
    private func updatePagination(number total: Int?, quantityItems: Int) {
        totalNumberOfItems = total
        guard let totalNum = total else {
            hasMore = quantityItems >= pageSize
            if hasMore { currentPage += 1 }
            return
        }
        hasMore = products.count < totalNum
        if hasMore { currentPage += 1 }
    }
}
