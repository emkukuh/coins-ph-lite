//
//  Screen.swift
//  CommonFiles
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct Screen<Content: ScreenContent>: View {
    @Environment(\.presentationMode) var presentationMode
    private let screenContent: Content
    @State var toastOffset: CGFloat = 120
    @ObservedObject var viewModel: ScreenViewModel
    var body: some View { renderBody() }

    init(@ViewBuilder _ screenContent: () -> Content) {
        self.screenContent = screenContent()
        self.viewModel = self.screenContent.viewModel
    }

    private func renderToast() -> some View {
        VStack {
            Spacer()
            ToastView(viewModel: viewModel.toastViewModel)
                .offset(y: toastOffset)
                .setHidden(!viewModel.isShowToast, isRemove: true)
        }.onReceive(viewModel.$isShowToast) { isShowToast in
            if isShowToast {
                withAnimation(.easeIn(duration: 0.2)) {
                    toastOffset = 0
                }
                return
            }
            withAnimation(.easeIn(duration: 0.2)) {
                toastOffset = 120
            }
        }
    }

    private func renderBody() -> some View {
        NavigationBarView(viewModel: viewModel.navigationViewModel) {
            screenContent
                .navigationBarHidden(true)
                .overlay(renderToast())
        }.onAppear {
            viewModel.onBackHandler = {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
