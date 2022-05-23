//
//  HomeScreen.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import Foundation
import SwiftUI

struct HomeScreen: ScreenContent {
    @ObservedObject var viewModel = HomeScreenViewModel()
    var body: some View { renderBody() }

    private func renderDebuggerButton() -> some View {
        ButtonView(
            viewModel: viewModel.debuggerButtonModel,
            style: LabelButtonViewStyle()
        )
    }

    private func renderBody() -> some View {
        VStack {
            ScrollView {
                renderDebuggerButton()
                ListView(viewModel: viewModel.myWalletListViewModel)
                ListView(viewModel: viewModel.historyListViewModel)
                    .padding(.top, Spaces.value24)
            }.onLoad {
                viewModel.fetchData()
            }
        }
        .padding(.horizontal, Spaces.value16)
        .padding(.top, Spaces.value16)
    }
}
