//
//  ButtonView.swift
//  coinsph-ios
//
//  Created by kukuh on 08/04/22.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    @ObservedObject var viewModel: ButtonViewModel
    var style: ButtonViewStyle = MainButtonViewStyle()
    var body: some View { renderBody() }

    private func renderIcon() -> some View {
        Image(viewModel.iconName)
            .font(Fonts.robotoMedium16)
            .foregroundColor(style.foregroundColor)
            .padding()
            .frame(minWidth: DefaultValues.cgFloat, maxWidth: .infinity)
            .cornerRadius(CornerRadiuses.value12)
            .setHidden(viewModel.iconName.isEmpty, isRemove: true)
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium16)
            .foregroundColor(style.foregroundColor)
            .padding()
            .frame(minWidth: DefaultValues.cgFloat, maxWidth: .infinity)
            .background(style.backgrounColor)
            .cornerRadius(CornerRadiuses.value12)
            .setHidden(viewModel.title.isEmpty, isRemove: true)
    }

    private func renderBody() -> some View {
        Button(action: viewModel.onTapHandler) {
            HStack {
                renderTitle()
                renderIcon()
            }
        }.setHidden(viewModel.isHidden, isRemove: true)
    }
}
