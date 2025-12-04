//
//  FilterSheetView.swift
//  AppSearchBarPT
//
//  Created by Luis Humberto Martinez Echegaray on 03/12/25.
//

import SwiftUI

struct FilterSortView: View {
    @Environment(\.presentationMode) private var presentationMode

    @State private var selectedSort: SortOption
    let onApply: (SortOption?) -> Void

    init(initialSort: SortOption? = .relevance, onApply: @escaping (SortOption?) -> Void) {
        _selectedSort = State(initialValue: initialSort ?? .relevance)
        self.onApply = onApply
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ordenar por")) {
                    Picker("Ordenar por", selection: $selectedSort) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.displayName).tag(option)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
            }
            .navigationTitle("Ordenar y filtrar")
            .navigationBarItems(
                leading:
                    Button("Reset") {
                        selectedSort = .relevance
                        onApply(nil)
                        presentationMode.wrappedValue.dismiss()
                    },
                trailing:
                    Button("Aplicar") {
                        onApply(selectedSort)
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}
