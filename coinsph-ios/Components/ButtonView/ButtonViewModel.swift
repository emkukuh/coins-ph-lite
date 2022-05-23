//
//  ButtonViewModel.swift
//  coinsph-ios
//
//  Created by kukuh on 08/04/22.
//

import Foundation

class ButtonViewModel: ObservableObject {
    @Published var isHidden: Bool = false
    @Published var title: String = DefaultValues.string
    @Published var iconName: String = DefaultValues.string
    @Published var onTapHandler: Typealiases.VoidHandler = { return }
}
