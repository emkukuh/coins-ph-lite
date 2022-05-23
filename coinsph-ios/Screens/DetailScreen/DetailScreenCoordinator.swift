//
//  DetailScreenCoordinator.swift
//  coinsph-ios
//
//  Created by kukuh on 21/05/22.
//

import Foundation
import SwiftUI

struct DetailScreenCoordinator: View {
    @Binding var activeCoordinatorName: String?
    @Binding var entry: HistoryEntry
    @Binding var currency: String
    @Binding var cashedOutSenderName: String
    @Binding var cashedOutTargetName: String
    @Binding var cashedOutAmount: String
    @State var viewModel = DetailScreenViewModel()
    var body: some View {
        NavigationLink(
            tag: DetailScreenCoordinator.name,
            selection: $activeCoordinatorName, destination: {
                ZStack {
                    Screen { DetailScreen(viewModel: setupViewModel()) }
                    renderNavigationLink()
                }
            },
            label: { EmptyView() }
        )
    }
    
    private func setupViewModel() -> DetailScreenViewModel {
        viewModel.title = entry == .outgoing
        ? R.string.title.youHaveCashedOutTo(cashedOutTargetName)
        : R.string.title.youHaveReceivedPayment()
        viewModel.senderListItemViewModel.value = entry == .outgoing
        ? cashedOutTargetName
        : cashedOutSenderName
        viewModel.senderListItemViewModel.title = entry == .outgoing
        ? R.string.title.receiver()
        : R.string.title.sender()
        viewModel.amountListItemViewModel.value = cashedOutAmount
            .toString
            .withCurrency(currency)
        return viewModel
    }
    
    private func renderNavigationLink() -> some View {
        AnyView(EmptyView())
    }
}
