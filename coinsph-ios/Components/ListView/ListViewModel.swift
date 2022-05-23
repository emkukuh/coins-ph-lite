//
//  ListViewModel.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import Foundation

class ListViewModel: ObservableObject {
    var title: String = DefaultValues.string
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var reloadButtonModel = ButtonViewModel()
    @Published var listItemModels = [ListItemViewModel]()

    init() {
        reloadButtonModel.title = R.string.button.reload()
    }

    func startLoading() {
        isLoading = true
    }

    func stopLoading() {
        isLoading = false
    }
}
