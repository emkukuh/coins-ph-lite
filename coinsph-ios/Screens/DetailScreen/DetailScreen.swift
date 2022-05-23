//
//  DetailScreen.swift
//  coinsph-ios
//
//  Created by kukuh on 21/05/22.
//

import SwiftUI

struct DetailScreen: ScreenContent {
    @ObservedObject var viewModel = DetailScreenViewModel()
    var body: some View { renderBody() }

    private func renderBody() -> some View {
        VStack {
            ScrollView {
                VStack(spacing: Spaces.value24) {
                    Text(viewModel.title)
                        .font(Fonts.robotoMedium24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(R.string.title.details())
                        .font(Fonts.robotoMedium20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ListItemView(viewModel: viewModel.senderListItemViewModel)
                    ListItemView(viewModel: viewModel.amountListItemViewModel)
                }
            }
            ButtonView(viewModel: viewModel.mainButtonViewModel)
        }.padding(Spaces.value16)
    }
}

