//
//  ListItemView.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import SwiftUI

struct ListItemView: View {
    @ObservedObject var viewModel = ListItemViewModel()
    var body: some View { renderBody() }

    private func renderBottomLine() -> some View {
        Color.gray
            .frame(height: 1)
    }

    private func renderContent() -> some View {
        VStack(alignment: .leading, spacing: Spaces.value10) {
            Text(viewModel.title)
                .font(Fonts.robotoMedium16)
                .lineLimit(1)
            Text(viewModel.value)
                .font(Font.body)
                .lineLimit(1)
            renderBottomLine()
        }.frame(maxWidth: .infinity, alignment: .leading)
    }

    private func renderBody() -> some View {
        ZStack {
            Group {
                if viewModel.onTap != nil {
                    Button(action: viewModel.tapHandler) {
                        renderContent()
                            .foregroundColor(.black)
                    }
                } else {
                    renderContent()
                }
            }
        }
    }
}
