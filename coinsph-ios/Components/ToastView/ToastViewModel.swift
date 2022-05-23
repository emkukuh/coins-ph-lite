//
//  ToastViewModel.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import Foundation

class ToastViewModel: ObservableObject {
    @Published var message: String = DefaultValues.string
}
