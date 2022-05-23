//
//  SetLoadingModifier.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import SwiftUI

struct SetLoadingModifier: ViewModifier {
    @Binding var isLoading: Bool

    init(_ isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }

    func body(content: Content) -> some View {
        if isLoading {
            ProgressView()
        } else {
            content
        }
    }
}
