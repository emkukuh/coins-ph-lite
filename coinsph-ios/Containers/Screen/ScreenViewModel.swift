//
//  ScreenViewModel.swift
//  CommonFiles
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

class ScreenViewModel: ObservableObject {
    @Published var navigationViewModel = NavigationBarViewModel()
    @Published var isFullScreenModalPresented: Bool = false
    @Published private(set) var isShowToast: Bool = false
    var toastViewModel = ToastViewModel()
    var onBackHandler: Typealiases.VoidHandler = { return }

    init() {
        navigationViewModel.backButtonViewModel.iconName = R.image.back.name
        navigationViewModel.backButtonViewModel.onTapHandler = { self.onBackHandler() }
    }

    func showToast(message: String) {
        toastViewModel.message = message
        isShowToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.isShowToast = false
        }
    }

    func backToPreviousScreen() {
        onBackHandler()
    }
}
