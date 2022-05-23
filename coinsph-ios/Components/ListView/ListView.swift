//
//  ListView.swift
//  coinsph-ios
//
//  Created by kukuh on 22/05/22.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    var body: some View { renderBody() }

    private func renderReloadButton() -> some View {
        ButtonView(
            viewModel: viewModel.reloadButtonModel,
            style: LabelButtonViewStyle()
        )
        .padding(.top, Spaces.value24)
        .setHidden(!viewModel.isError, isRemove: true)
    
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium24)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func renderBody() -> some View {
        VStack {
            VStack(spacing: Spaces.value24) {
                renderTitle()
                VStack {
                    ForEach(viewModel.listItemModels, id: \.key) { itemModel in
                        LazyVStack {
                            ListItemView(viewModel: itemModel)
                        }
                    }
                }
                .setLoading(viewModel.isLoading)
                .setHidden(viewModel.isError, isRemove: true)
            }
            renderReloadButton()
        }
    }
}
