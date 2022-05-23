//
//  ListItemView.swift
//  coinsph-ios
//
//  Created by kukuh on 20/05/22.
//

import SwiftUI

struct ListItemView: View {
    @ObservedObject var viewModel = WalletListItemViewModel()
    var body: some View { renderBody() }

    private func renderBody() -> some View {
        HStack {
            Text(viewModel.title)
            Spacer()
            Text(viewModel.value)
        }
    }
}
