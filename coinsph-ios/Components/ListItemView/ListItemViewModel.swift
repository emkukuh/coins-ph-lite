//
//  ListItemViewModel.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import Foundation

class ListItemViewModel: ObservableObject, Identifiable {
    var key: String = UUID().uuidString
    @Published var title: String = DefaultValues.string
    @Published var value: String = DefaultValues.string
    var onTap: Typealiases.StringHandler?

    func tapHandler() {
        onTap?(key)
    }
}
