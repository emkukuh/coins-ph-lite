//
//  ToastView.swift
//  coinsph-ios
//
//  Created by kukuh on 23/05/22.
//

import SwiftUI

struct ToastView: View {
    @ObservedObject var viewModel = ToastViewModel()
    var body: some View { renderBody() }

    private func renderBody() -> some View {
        VStack {
            Text(viewModel.message)
                .foregroundColor(.white)
                .padding(Spaces.value24)
                .frame(maxWidth: .infinity)
        }
        .background(Color.red)
        .cornerRadius(CornerRadiuses.value12)
        .padding(.horizontal, Spaces.value24)
    }
}
